package com.intelligrape.pmi

import com.intelligrape.pmi.common.AppConstant
import com.intelligrape.pmi.enums.TemplateType
import grails.plugin.springsecurity.annotation.Secured
import sun.org.mozilla.javascript.internal.Token

import javax.rmi.CORBA.Util

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuestionnaireController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Questionnaire.list(params), model: [questionnaireCount: Questionnaire.count()]
    }


    def survey(RequestToken requestToken) {
        println "survey.................."
        String questionnaireId = Utility.getCustomPropertyValue(requestToken, AppConstant.QUESTIONNAIRE_ID)
        Questionnaire questionnaire = Questionnaire.get(new Long(questionnaireId))
        [questionnaire: questionnaire]
    }

    @Secured(['ROLE_ADMIN'])
    def sendSurvey() {
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


    def show(Questionnaire questionnaire) {
        respond questionnaire
    }

    def create() {
        respond new Questionnaire(params)
    }

    @Transactional
    def save(Questionnaire questionnaire) {
        if (questionnaire == null) {
            notFound()
            return
        }

        if (questionnaire.hasErrors()) {
            respond questionnaire.errors, view: 'create'
            return
        }

        questionnaire.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), questionnaire.id])
                redirect questionnaire
            }
            '*' { respond questionnaire, [status: CREATED] }
        }
    }

    def edit(Questionnaire questionnaire) {
        respond questionnaire
    }

    @Transactional
    def update(Questionnaire questionnaire) {
        if (questionnaire == null) {
            notFound()
            return
        }

        if (questionnaire.hasErrors()) {
            respond questionnaire.errors, view: 'edit'
            return
        }

        questionnaire.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Questionnaire.label', default: 'Questionnaire'), questionnaire.id])
                redirect questionnaire
            }
            '*' { respond questionnaire, [status: OK] }
        }
    }

    @Transactional
    def delete(Questionnaire questionnaire) {

        if (questionnaire == null) {
            notFound()
            return
        }

        questionnaire.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Questionnaire.label', default: 'Questionnaire'), questionnaire.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
