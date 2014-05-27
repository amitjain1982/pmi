package com.intelligrape.pmi



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class OptionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def create() {
        respond new Option(params)
    }

    def index(){

    }

    @Transactional
    def save(Option option) {
        if (option == null) {
            notFound()
            return
        }

        if (option.hasErrors()) {
            respond option.errors, view:'create'
            return
        }

        option.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'option.label', default: 'Option'), option.id])
                redirect option
            }
            '*' { respond option, [status: CREATED] }
        }
    }

    def edit(Option option) {
        respond option
    }

    @Transactional
    def update(Option option) {
        if (option == null) {
            notFound()
            return
        }

        if (option.hasErrors()) {
            respond option.errors, view:'edit'
            return
        }

        option.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Option.label', default: 'Option'), option.id])
                redirect option
            }
            '*'{ respond option, [status: OK] }
        }
    }

    @Transactional
    def delete(Option option) {

        if (option == null) {
            notFound()
            return
        }

        option.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Option.label', default: 'Option'), option.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'option.label', default: 'Option'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
