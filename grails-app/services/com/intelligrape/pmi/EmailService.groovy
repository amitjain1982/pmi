package com.intelligrape.pmi

import grails.plugin.mail.MailService
import grails.transaction.Transactional

@Transactional
class EmailService {
    MailService mailService

    public void sendTestMail(String sendTo, EmailMessageTemplate emailMessageTemplate, Map messageParameters=null) {
        try {
            String messageBody = emailMessageTemplate.writeMessageOutput(messageParameters)
            String messageSubject = emailMessageTemplate.writeMessageOutput(messageParameters, false)
            mailService.sendMail {
                to sendTo
                subject messageSubject
                html messageBody
            }
        } catch (Exception e) {
            println "${emailMessageTemplate?.templateType} mail is not sent to ${sendTo} due to some error, Message: ${e.message}"
        }

    }
}
