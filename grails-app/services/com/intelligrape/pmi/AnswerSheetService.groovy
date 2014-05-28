package com.intelligrape.pmi

import com.intelligrape.pmi.co.AnswerSheetCO
import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional

@Transactional
class AnswerSheetService {

    SpringSecurityService springSecurityService

    def serviceMethod() {
    }

    @Transactional
    AnswerSheet submitSurveyAndCreateAnswerSheet(AnswerSheetCO answerSheetCO){
        answerSheetCO.dateAttempted = new Date()
        List<Answer> answers=[]

        AnswerSheet answerSheet=new AnswerSheet(answerSheetCO)
        User currentUser=springSecurityService.currentUser
        Collabortaor collabortaor=new Collabortaor(name:'Amit',email:currentUser.username,isProjectOwner: 'true' ,project: Project.get(1)).save()

        answerSheet.attemptedBy=collabortaor

        answerSheetCO.answerCOs?.each {answerCO->
            Answer answer = new Answer(answerCO)

            answerSheet.addToAnswers(answer)
        }
        answerSheet.totalScore = answerSheet.calculateScore()
        answerSheet.save()
        return answerSheet

    }




}