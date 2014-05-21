package com.intelligrape.pmi

import com.intelligrape.pmi.co.AnswerSheetCO

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class QuestionnaireController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Questionnaire.list(params), model:[questionnaireCount: Questionnaire.count()]
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
            respond questionnaire.errors, view:'create'
            return
        }

        questionnaire.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), questionnaire.id])
                redirect questionnaire
            }
            '*' { respond questionnaire, [status: CREATED] }
        }
    }

    @Transactional
    def submitSurvey(AnswerSheetCO answerSheetCO){
        answerSheetCO.dateAttempted = new Date()
        List<Answer> answers=[]

        AnswerSheet answerSheet=new AnswerSheet(answerSheetCO)

        answerSheet.answers=answers
        answerSheet.attemptedBy=Collabortaor.get('1')

        answerSheetCO.answerCOs?.each {answerCO->
            Answer answer = new Answer(answerCO)
            answerSheet.addToAnswers(answer)
        }
        answerSheet.totalScore=calculateScore(answerSheet)
            answerSheet.save()
            render "Survey compeleted.PMI for your project is ${answerSheet.totalScore}"

    }


    Double calculateScore(AnswerSheet answerSheet) {
        (answerSheet?.answers*.optionSelected*.score?.sum()  ?: 0) as Double
    }



    def survey(){
        render(view:'quesionnaire',model:[questionnaire:Questionnaire.get('1')])
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
            respond questionnaire.errors, view:'edit'
            return
        }

        questionnaire.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Questionnaire.label', default: 'Questionnaire'), questionnaire.id])
                redirect questionnaire
            }
            '*'{ respond questionnaire, [status: OK] }
        }
    }

    @Transactional
    def delete(Questionnaire questionnaire) {

        if (questionnaire == null) {
            notFound()
            return
        }

        questionnaire.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Questionnaire.label', default: 'Questionnaire'), questionnaire.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaire.label', default: 'Questionnaire'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
