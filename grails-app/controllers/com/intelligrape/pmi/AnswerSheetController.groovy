package com.intelligrape.pmi

import com.intelligrape.pmi.co.AnswerSheetCO

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class AnswerSheetController {


    AnswerSheetService answerSheetService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AnswerSheet.list(params), model: [answerSheetCount: AnswerSheet.count()]
    }

    def show(AnswerSheet answerSheet) {
        respond answerSheet
    }

    def create() {
        respond new AnswerSheet(params)
    }

    @Transactional
    def save(AnswerSheet answerSheet) {
        if (answerSheet == null) {
            notFound()
            return
        }

        if (answerSheet.hasErrors()) {
            respond answerSheet.errors, view: 'create'
            return
        }

        answerSheet.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'answerSheet.label', default: 'AnswerSheet'), answerSheet.id])
                redirect answerSheet
            }
            '*' { respond answerSheet, [status: CREATED] }
        }
    }

    def edit(AnswerSheet answerSheet) {
        respond answerSheet
    }

    @Transactional
    def update(AnswerSheet answerSheet) {
        if (answerSheet == null) {
            notFound()
            return
        }

        if (answerSheet.hasErrors()) {
            respond answerSheet.errors, view: 'edit'
            return
        }

        answerSheet.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AnswerSheet.label', default: 'AnswerSheet'), answerSheet.id])
                redirect answerSheet
            }
            '*' { respond answerSheet, [status: OK] }
        }
    }

    @Transactional
    def delete(AnswerSheet answerSheet) {

        if (answerSheet == null) {
            notFound()
            return
        }

        answerSheet.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AnswerSheet.label', default: 'AnswerSheet'), answerSheet.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'answerSheet.label', default: 'AnswerSheet'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    def submitSurvey(AnswerSheetCO answerSheetCO) {
        AnswerSheet answerSheet = answerSheetService.submitSurveyAndCreateAnswerSheet(answerSheetCO)
//        render "Total Score is" + answerSheet.totalScore
        render(view: '/questionnaire/questionnaireFeedback', model: ['answerSheet' : answerSheet])
    }


}
