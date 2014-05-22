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

        answerSheet.answers=answers
        answerSheet.attemptedBy=Collabortaor.get('1')

        answerSheetCO.answerCOs?.each {answerCO->
            Answer answer = new Answer(answerCO)

            answerSheet.addToAnswers(answer)
        }
        answerSheet.totalScore=calculateScore(answerSheet)
        answerSheet.save()
        return answerSheet

    }





    /*
    *   answerSheetCO.dateAttempted = new Date()
        List<Answer> answers=[]

        AnswerSheet answerSheet=new AnswerSheet(answerSheetCO)

        answerSheet.answers=answers
        answerSheet.attemptedBy=Collabortaor.get('1')

        answerSheet.totalScore= 1//calculateScore(answerSheet)
        answerSheet.save()
        answerSheetCO.answerCOs?.each {answerCO->
            Answer answer = new Answer(answerCO)
            answer.answerSheet = answerSheet
            answer.save()
//            answerSheet.addToAnswers(answer)*/
}
