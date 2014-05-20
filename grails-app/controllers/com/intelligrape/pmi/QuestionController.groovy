package com.intelligrape.pmi

import com.intelligrape.pmi.co.OptionCO
import com.intelligrape.pmi.co.QuestionCO
import com.sun.jndi.url.iiopname.iiopnameURLContextFactory

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional
class QuestionController {

    def questionService

    static allowedMethods = [save: "POST", update: "PUT"]


    def create() {

        Questionnaire questionnaire = Questionnaire.findById(params.long('questionnaireId'))
        QuestionCO questionCO = new QuestionCO()
        questionCO.optionCOs = [new OptionCO(), new OptionCO()]
        render(view: 'create', model: [questionCO: questionCO, questionnaire: questionnaire])
    }

    @Transactional
    def save(QuestionCO questionCO) {

        Question question = questionService.saveQuestion(questionCO)

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), question.id])
                redirect question.questionnaire
            }
            '*' { respond question, [status: CREATED] }
        }


    }

    def edit(Question question) {
        println "question " + question
        QuestionCO questionCO = new QuestionCO(question)
        render(view: 'edit', model: [questionCO: questionCO])
    }

    @Transactional
    def update(QuestionCO questionCO) {
        if (questionCO == null) {
            notFound()
            return
        }

        if (questionCO.hasErrors()) {
            respond questionCO.errors, view: 'edit'
            return
        }
        Question question = Question.get(questionCO.id)
        Set<Option> options = question.options
        // find option and update it
        // create new option if option id not found
        // delete option not found in optionCO

        //delete options that were deleted by the user
        options.findAll{! questionCO.optionCOs*.id.contains(it.id)}.each{
            question.removeFromOptions(it)
            it.delete()
        }

        questionCO.optionCOs?.each{OptionCO co->
            Option option = options.find{it.id == co.id}
            if(option){
                option.name = co.name
                option.score = co.score
                option.sequenceNumber = co.sequenceNumber
                option.save()
            }else{
                option = new Option(co, question)
                option.save()
                question.addToOptions(option)
            }
        }

        question.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Question.label', default: 'Question'), question.id])
                redirect question.questionnaire
            }
            '*' { respond question.questionnaire, [status: OK] }
        }
    }

//    @Transactional
    def delete(Question question) {
        Questionnaire questionnaire=question.questionnaire
        question.delete()
        redirect(controller: 'questionnaire', action: 'show', params: [id:questionnaire.id])
    }

        protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    @Transactional
    def saveAndCreateNew(QuestionCO questionCO) {

        Question question = questionService.saveQuestion(questionCO)
        redirect(action: 'create', params: ['questionnaireId': questionCO.questionnaire.id])
    }


}