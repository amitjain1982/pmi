package com.intelligrape.pmi

import com.intelligrape.pmi.co.AnswerSheetCO
import grails.transaction.Transactional

@Transactional
class AnswerSheetService {

    def serviceMethod() {
    }

    @Transactional
    AnswerSheet submitSurveyAndCreateAnswerSheet(AnswerSheetCO answerSheetCO){
        answerSheetCO.dateAttempted = new Date()
        List<Answer> answers=[]

        AnswerSheet answerSheet=new AnswerSheet(answerSheetCO)

//        answerSheet.answers=answers
        answerSheet.attemptedBy=Collabortaor.get('1')

        answerSheetCO.answerCOs?.each {answerCO->
            Answer answer = new Answer(answerCO)

            answerSheet.addToAnswers(answer)
        }
        answerSheet.totalScore = answerSheet.calculateScore()
        answerSheet.save()
        return answerSheet

    }
}