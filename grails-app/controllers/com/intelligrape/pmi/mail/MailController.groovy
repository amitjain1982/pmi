package com.intelligrape.pmi.mail

import com.intelligrape.pmi.RequestToken

class MailController {

    private static final String INVALID = 'mail.token.invalid'
    private static final String CONSUMED = 'mail.token.consumed'

    def confirm(String id) {
        RequestToken token = id ? RequestToken.get(id) : null
        if (!token) {
            flash.error = message(code: INVALID, default:'Token is invalid')
        } else if (token.consumed) {
            flash.message = message(code: CONSUMED, default:'Token is already consumed')
        } else {
            token.consumed = true
            token.save()
            forward(controller: token.controllerName, action: token.actionName, params: [token:token])
        }

        //Forward to login/any common page in case of consumed/invalid token
        forward(controller: 'login',action: 'index')
    }
}

