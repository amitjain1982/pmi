package com.intelligrape.pmi

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.oauth.OAuthToken
import grails.plugin.springsecurity.userdetails.GormUserDetailsService
import grails.plugin.springsecurity.userdetails.GrailsUser
import grails.transaction.Transactional
import org.apache.commons.lang.RandomStringUtils
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.GrantedAuthorityImpl

@Transactional
class UserService {
    def utilService
    def springSecurityService

    public OAuthToken updateOrCreateUser(OAuthToken oAuthToken) {
        User user

        if (springSecurityService.loggedIn) {
            user = addAuthIdsToUser(oAuthToken)
        } else {
            user = createUser(oAuthToken)
        }

        oAuthToken = updateOAuthToken(oAuthToken,user)
        return user ? oAuthToken : null
    }

    public User createUser(OAuthToken oAuthToken, OAuthCreateAccountCommand command=null) {
        String username = command?.username ?: oAuthToken.socialId
        String password = command?.password1 ?: RandomStringUtils.randomAlphabetic(10)

        User user = new User(username: username, password: password, enabled: true).save(flush: true, failOnError: true);
        //Defining Roles for spring security
        def userRole = Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save(flush: true);
        UserRole.create(user, userRole, true)
        user.addToOauthIds(provider: oAuthToken.providerName, accessToken: oAuthToken.socialId, user: user)
        if (user.validate() && user.save()) {
            return user
        }
        return null
    }

    public User addAuthIdsToUser(OAuthToken oAuthToken, User user = null) {
        user = user ?: springSecurityService.currentUser as User
        user?.addToOauthIds(provider: oAuthToken.providerName, accessToken: oAuthToken.socialId, user: user)
        if (user?.validate() && user?.save()) {
            return user
        }
        return null
    }

    OAuthToken createAuthToken(providerName, scribeToken) {
        def providerService = utilService.getBean("${providerName}SpringSecurityOAuthService")

        OAuthToken oAuthToken = providerService.createAuthToken(scribeToken)

        def oAuthID = OAuthID.findByProviderAndAccessToken(oAuthToken.providerName, oAuthToken.socialId)
        if (oAuthID) {
            updateOAuthToken(oAuthToken, oAuthID.user)
        }

        return oAuthToken
    }

    OAuthToken updateOAuthToken(OAuthToken oAuthToken, User user) {
        Collection<Role> userAuthorities = user.authorities
       def authorities = userAuthorities.collect { new GrantedAuthorityImpl(it.authority) }

        oAuthToken.principal = new GrailsUser(user.username, user.password, user.enabled, !user.accountExpired,
                !user.passwordExpired, !user.accountLocked,
                authorities ?: [GormUserDetailsService.NO_ROLE], user.id)
        oAuthToken.authorities = authorities
        oAuthToken.authenticated = true

        return oAuthToken
    }

    public void linkAccount(OAuthLinkAccountCommand command, OAuthToken oAuthToken) {
        if (command.validate()) {

            User user = User.findByUsernameAndPassword(
                    command.username, springSecurityService.encodePassword(command.password))
            if (user) {
                user = addAuthIdsToUser(oAuthToken, user)
                if (user) {
                    oAuthToken = updateOAuthToken(oAuthToken, user)
                    throw new RuntimeException("Couldn't add auth id to user")
                }
            } else {
                throw new RuntimeException("User name not found")
            }
        }
    }


}
