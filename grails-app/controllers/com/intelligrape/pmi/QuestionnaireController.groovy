package com.intelligrape.pmi



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuestionnaireController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Questionnaire.list(params), model:[questionnaireInstanceCount: Questionnaire.count()]
    }

    def show(Questionnaire questionnaireInstance) {
        respond questionnaireInstance
    }

    def create() {
        respond new Questionnaire(params)
    }

    @Transactional
    def save(Questionnaire questionnaireInstance) {
        if (questionnaireInstance == null) {
            notFound()
            return
        }

        if (questionnaireInstance.hasErrors()) {
            respond questionnaireInstance.errors, view:'create'
            return
        }

        questionnaireInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'questionnaireInstance.label', default: 'Questionnaire'), questionnaireInstance.id])
                redirect questionnaireInstance
            }
            '*' { respond questionnaireInstance, [status: CREATED] }
        }
    }

    def edit(Questionnaire questionnaireInstance) {
        respond questionnaireInstance
    }

    @Transactional
    def update(Questionnaire questionnaireInstance) {
        if (questionnaireInstance == null) {
            notFound()
            return
        }

        if (questionnaireInstance.hasErrors()) {
            respond questionnaireInstance.errors, view:'edit'
            return
        }

        questionnaireInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Questionnaire.label', default: 'Questionnaire'), questionnaireInstance.id])
                redirect questionnaireInstance
            }
            '*'{ respond questionnaireInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Questionnaire questionnaireInstance) {

        if (questionnaireInstance == null) {
            notFound()
            return
        }

        questionnaireInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Questionnaire.label', default: 'Questionnaire'), questionnaireInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionnaireInstance.label', default: 'Questionnaire'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
