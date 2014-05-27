package com.intelligrape.pmi

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model: [userCount: User.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def show(User user) {
        respond user
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User user) {


        if (user == null) {
            notFound()
            return
        }

        if (user.hasErrors()) {
            respond user.errors, view: 'create'
            return
        }


        String confirmPassword = params['confirmPassword']

        if (confirmPassword != user.password) {
            flash.passwordConfirmMessage = message(code: 'user.create.passwordConfirmMismatchMessage')
            render(view: 'create', model: ['username': user.username])
        } else {

            user.save flush: true
            UserRole userRole=new UserRole(user:user,role: params.role)
            userRole.save()
            request.withFormat {
                form {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                    redirect user
                }
                '*' { respond user, [status: CREATED] }
            }

        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(User user) {
        respond user
    }

    @Transactional
    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        if (user.hasErrors()) {
            respond user.errors, view: 'edit'
            return
        }

        String confirmPassword = params['confirmPassword']

        if (confirmPassword != user.password) {
            flash.passwordConfirmMessage = message(code: 'user.create.passwordConfirmMismatchMessage')
            render(view: 'create', model: ['username': user.username])
        } else {

            user.save flush: true
            UserRole userRole=new UserRole(user:user,role: params.role)
            userRole.save()

            request.withFormat {
                form {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                    redirect user
                }
                '*' { respond user, [status: OK] }
            }
        }
    }

    @Transactional@Secured(['ROLE_ADMIN'])
    def delete(User user) {

        if (user == null) {
            notFound()
            return
        }

        user.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
