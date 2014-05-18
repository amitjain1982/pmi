package com.intelligrape.pmi

import com.sun.jndi.url.iiopname.iiopnameURLContextFactory

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuestionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Question.list(params), model: [questionInstanceCount: Question.count()]
    }

    def show(Question questionInstance) {
        respond questionInstance
    }

    def create() {
        List<Option> optionInstanceList = new ArrayList<Option>()
        respond(questionInstance: new Question(params), optionInstanceList: optionInstanceList)
    }

    @Transactional
    def save(Question questionInstance, List<Option> optionInstanceList) {

        saveQuestion(questionInstance)
        saveOptions(questionInstance, optionInstanceList)
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'questionInstance.label', default: 'Question'), questionInstance.id])
                redirect questionInstance
            }
            '*' { respond questionInstance, [status: CREATED] }
        }


    }

    def edit(Question questionInstance) {
        respond questionInstance
    }

    @Transactional
    def update(Question questionInstance) {
        if (questionInstance == null) {
            notFound()
            return
        }

        if (questionInstance.hasErrors()) {
            respond questionInstance.errors, view: 'edit'
            return
        }

        questionInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Question.label', default: 'Question'), questionInstance.id])
                redirect questionInstance
            }
            '*' { respond questionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Question questionInstance) {

        if (questionInstance == null) {
            notFound()
            return
        }

        questionInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Question.label', default: 'Question'), questionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionInstance.label', default: 'Question'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    @Transactional
    def saveAndCreateNew(Question questionInstance) {
        Question question = new Question()
        question.properties = questionInstance.properties
        saveQuestion(question)
        redirect(action: 'create')
    }

    private static Question saveQuestion(Question questionInstance) {
        if (questionInstance == null) {
            notFound()
            return
        }

        if (questionInstance.hasErrors()) {
            respond questionInstance.errors, view: 'create'
            return
        }

        questionInstance.save(flush: true)


    }


    private static List<Option> saveOptions(Question questionInstance, List<Option> optionInstanceList) {
        if (optionInstanceList == null) {
            notFound()
            return
        }

        for (Option optionInstance in optionInstanceList) {
            if (optionInstance.hasErrors()) {
                respond optionInstance.errors, view: 'create'
                return
            }
            optionInstance.save(flush: true)
        }
    }
}