package com.intelligrape.pmi.co

import com.intelligrape.pmi.Collabortaor
import com.intelligrape.pmi.Project
import com.intelligrape.pmi.Questionnaire
import com.intelligrape.pmi.enums.AnswerSheetStatus
import grails.validation.Validateable

@Validateable
class AnswerSheetCO {

    String comment
    AnswerSheetStatus status
    Date dateAttempted //= new Date()
    Project project
    Questionnaire questionnaire
    List<AnswerCO> answerCOs


    static constraints = { comment(nullable: true, maxSize: 256) }


}
