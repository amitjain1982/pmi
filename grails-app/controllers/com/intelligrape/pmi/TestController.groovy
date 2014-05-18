package com.intelligrape.pmi

import com.intelligrape.pmi.User
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import uk.co.desirableobjects.oauth.scribe.OauthService

class TestController {

    SpringSecurityService springSecurityService
    OauthService oauthService

    def index() {

        render(view: 'login')

    }


    def accessToken() {
        User user = springSecurityService.currentUser
        render user.username
    }



    def success() {
        render "success"
    }



}
