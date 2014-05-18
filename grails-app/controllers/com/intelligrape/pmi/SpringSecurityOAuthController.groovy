/*
 * Copyright 2012 the original author or authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.intelligrape.pmi

import grails.plugin.springsecurity.oauth.OAuthToken
import grails.plugin.springsecurity.userdetails.GormUserDetailsService
import grails.plugin.springsecurity.userdetails.GrailsUser
import grails.plugin.springsecurity.SpringSecurityUtils
import org.apache.commons.lang.RandomStringUtils
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.context.SecurityContextHolder

/**
 * Simple helper controller for handling OAuth authentication and integrating it
 * into Spring Security.
 */
class SpringSecurityOAuthController {

    public static final String SPRING_SECURITY_OAUTH_TOKEN = 'springSecurityOAuthToken'

    static allowedMethods = [linkAccount: 'POST', createAccount: 'POST']

    def oauthService
    def springSecurityService
    def userService

    /**
     * This can be used as a callback for a successful OAuth authentication
     * attempt. It logs the associated user in if he or she has an internal
     * Spring Security account and redirects to <tt>targetUri</tt> (provided as a URL
     * parameter or in the session). Otherwise it redirects to a URL for
     * linking OAuth identities to Spring Security accounts. The application must implement
     * the page and provide the associated URL via the <tt>oauth.registration.askToLinkOrCreateAccountUri</tt>
     * configuration setting.
     */
    def onSuccess = {
        // Validate the 'provider' URL. Any errors here are either misconfiguration
        // or web crawlers (or malicious users).
        if (!params.provider) {
            renderError 400, "The Spring Security OAuth callback URL must include the 'provider' URL parameter."
            return
        }

        def sessionKey = oauthService.findSessionKeyForAccessToken(params.provider)
        if (!session[sessionKey]) {
            renderError 500, "No OAuth token in the session for provider '${params.provider}'!"
            return
        }

        //Validate that the user should be a member of intelligrape
        OAuthToken oAuthToken = userService.createAuthToken(params.provider, session[sessionKey])
        String[] emailContents = oAuthToken.socialId.split("@");
        if ((!emailContents[1].equals('intelligrape.com')) && (!isAuthorisedNonIntelligrapeUser(oAuthToken.socialId))) {

            renderError 400, "Sorry you are not authorised to use this application"
        } else {

            // Create the relevant authentication token and attempt to log in.


            if (oAuthToken.principal instanceof GrailsUser) {
                authenticateAndRedirect(oAuthToken, defaultTargetUrl)
            } else {
                // This OAuth account hasn't been registered against an internal
                // account yet. Give the oAuthID the opportunity to create a new
                // internal account or link to an existing one.
                session[SPRING_SECURITY_OAUTH_TOKEN] = oAuthToken

                def redirectUrl = SpringSecurityUtils.securityConfig.oauth.registration.askToLinkOrCreateAccountUri
                assert redirectUrl, "grails.plugin.springsecurity.oauth.registration.askToLinkOrCreateAccountUri" +
                        " configuration option must be set!"
                log.debug "Redirecting to askToLinkOrCreateAccountUri: ${redirectUrl}"
                redirect(redirectUrl instanceof Map ? redirectUrl : [uri: redirectUrl])
            }


        }
    }

    def onFailure = {
        authenticateAndRedirect(null, defaultTargetUrl)
    }

    def askToLinkOrCreateAccount = {
        //Create user with default username and password
        log.error("no user found for command : ${session[SPRING_SECURITY_OAUTH_TOKEN]}");
        OAuthToken oAuthToken = session[SPRING_SECURITY_OAUTH_TOKEN]
        assert oAuthToken, "There is no auth token in the session!"

        println "springSecurityService.loggedIn ${springSecurityService.loggedIn}"

        oAuthToken = userService.updateOrCreateUser(oAuthToken)
        if (oAuthToken) {
            authenticateAndRedirect(oAuthToken, defaultTargetUrl)
            return
        }
    }

    /**
     * Associates an OAuthID with an existing account. Needs the user's password to ensure
     * that the user owns that account, and authenticates to verify before linking.
     */

    def linkAccount = { OAuthLinkAccountCommand command ->
        OAuthToken oAuthToken = session[SPRING_SECURITY_OAUTH_TOKEN]
        assert oAuthToken, "There is no auth token in the session!"
        try {
            userService.linkAccount(command, oAuthToken)
            authenticateAndRedirect(oAuthToken, defaultTargetUrl)
            return
        } catch (RuntimeException e) {
            command.errors.rejectValue("username", e.message)
        }
        render view: 'askToLinkOrCreateAccount', model: [linkAccountCommand: command]
    }

    def createAccount = { OAuthCreateAccountCommand command ->
        OAuthToken oAuthToken = session[SPRING_SECURITY_OAUTH_TOKEN]
        assert oAuthToken, "There is no auth token in the session!"

        if (!springSecurityService.loggedIn) {
            User user = userService.createUser(oAuthToken, command)
            if (user) {
                oAuthToken = userService.updateOAuthToken(oAuthToken, user)
                authenticateAndRedirect(oAuthToken, defaultTargetUrl)
                return true
            }
        }
        render view: 'askToLinkOrCreateAccount', model: [createAccountCommand: command]
    }

    // utils

    protected renderError(code, msg) {
        log.error msg + " (returning ${code})"
        render status: code, text: msg
    }


    protected Map getDefaultTargetUrl() {
        def config = SpringSecurityUtils.securityConfig
        def savedRequest = SpringSecurityUtils.getSavedRequest(session)
        def defaultUrlOnNull = '/'

        if (savedRequest && !config.successHandler.alwaysUseDefault) {
            return [url: (savedRequest.redirectUrl ?: defaultUrlOnNull)]
        } else {
            return [uri: (config.successHandler.defaultTargetUrl ?: defaultUrlOnNull)]
        }
    }

    protected void authenticateAndRedirect(OAuthToken oAuthToken, redirectUrl) {
        session.removeAttribute SPRING_SECURITY_OAUTH_TOKEN
        println "oAuthToken ----------- " + oAuthToken
        SecurityContextHolder.context.authentication = oAuthToken
        redirect(redirectUrl instanceof Map ? redirectUrl : [uri: redirectUrl])
    }


    def isAuthorisedNonIntelligrapeUser(String username) {

        return User.findByUsername(username)


    }


}

class OAuthCreateAccountCommand {

    String username
    String password1
    String password2

    static constraints = {
        username blank: false, validator: { String username, command ->
            User.withNewSession { session ->
                if (username && User.countByUsername(username)) {
                    return 'OAuthCreateAccountCommand.username.error.unique'
                }
            }
        }
        password1 blank: false, minSize: 8, maxSize: 64, validator: { password1, command ->
            if (command.username && command.username.equals(password1)) {
                return 'OAuthCreateAccountCommand.password.error.username'
            }

            if (password1 && password1.length() >= 8 && password1.length() <= 64 &&
                    (!password1.matches('^.*\\p{Alpha}.*$') ||
                            !password1.matches('^.*\\p{Digit}.*$') ||
                            !password1.matches('^.*[!@#$%^&].*$'))) {
                return 'OAuthCreateAccountCommand.password.error.strength'
            }
        }
        password2 nullable: true, blank: true, validator: { password2, command ->
            if (command.password1 != password2) {
                return 'OAuthCreateAccountCommand.password.error.mismatch'
            }
        }
    }
}

class OAuthLinkAccountCommand {

    String username
    String password

    static constraints = {
        username blank: false
        password blank: false
    }


}






