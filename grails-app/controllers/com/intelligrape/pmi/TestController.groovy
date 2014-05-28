package com.intelligrape.pmi

import com.intelligrape.pmi.common.AppConstant
import com.intelligrape.pmi.enums.TemplateType
import com.intelligrape.pmi.util.RequestTokenService
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import uk.co.desirableobjects.oauth.scribe.OauthService

class TestController {

    SpringSecurityService springSecurityService
    OauthService oauthService
    RequestTokenService requestTokenService
    EmailService emailService

    def index() {
        User user = springSecurityService.currentUser
        println user

        render(view: 'login')
    }


    def accessToken() {

        User user = springSecurityService.currentUser
        render user.username

//        render oauthService.getOauthClient()

    }

    def oauth2callback() {

        render "hello"
    }

    def success(String id) {
        render "success, token: ${id}"
    }

    def testMail() {
        println "start: testMail==============================="
        Map paramsMap = [:]
        Questionnaire questionnaire = Questionnaire.get(new Long(1))
        paramsMap.put(AppConstant.QUESTIONNAIRE_ID, questionnaire.id)
        String link = requestTokenService.generateLink("questionnaire", "survey", paramsMap)
        println "link: ${link}"
        Map messageParameters = [link: link]
        emailService.sendTestMail('shikha.goel@intelligrape.com', EmailMessageTemplate.findByTemplateType(TemplateType.QUESTIONARE), messageParameters)
        println "end: testMail==============================="
        render "sent testMail with link : ${link}"
    }
}
