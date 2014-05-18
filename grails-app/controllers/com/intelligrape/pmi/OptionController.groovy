package com.intelligrape.pmi



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OptionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Option.list(params), model: [optionInstanceCount: Option.count()]
    }

    def show(Option optionInstance) {
        respond optionInstance
    }

    def create() {
        respond new Option(params)
    }

    @Transactional
    def save(Option optionInstance) {
        saveOption(optionInstance)
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'optionInstance.label', default: 'Option'), optionInstance.id])
                redirect optionInstance
            }
            '*' { respond optionInstance, [status: CREATED] }
        }
    }

    def edit(Option optionInstance) {
        respond optionInstance
    }

    @Transactional
    def update(Option optionInstance) {
        if (optionInstance == null) {
            notFound()
            return
        }

        if (optionInstance.hasErrors()) {
            respond optionInstance.errors, view: 'edit'
            return
        }

        optionInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Option.label', default: 'Option'), optionInstance.id])
                redirect optionInstance
            }
            '*' { respond optionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Option optionInstance) {

        if (optionInstance == null) {
            notFound()
            return
        }

        optionInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Option.label', default: 'Option'), optionInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'optionInstance.label', default: 'Option'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    private def saveOption(Option optionInstance) {
        if (optionInstance == null) {
            notFound()
            return
        }

        if (optionInstance.hasErrors()) {
            respond optionInstance.errors, view: 'create'
            return
        }

        optionInstance.save flush: true


    }

//    public saveAndRedirectToQuestion() {
//        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>inside save and redirect to question")
//        Option optionInstance=new Option(params)
//        saveOption(optionInstance)
//        render template: 'savedOptionRow', model: [optionName: optionInstance.name, optionScore: optionInstance.score]
//    }

}
