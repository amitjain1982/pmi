package com.intelligrape.pmi

import com.intelligrape.pmi.co.AnswerSheetCO
import com.intelligrape.pmi.enums.AnswerSheetStatus


class AnswerSheet {


    String comment
    Double totalScore
    AnswerSheetStatus status
    Collabortaor attemptedBy
    java.util.Date dateAttempted
    Project project // todo think over it more

    Date dateCreated
    Date lastUpdated

    AnswerSheet(){}

    public AnswerSheet(AnswerSheetCO answerSheetCO){
        this.properties=answerSheetCO.properties
    }


    static hasMany = [answers: Answer]
    static belongsTo = [questionnaire: Questionnaire]

    static constraints = { comment(nullable: true, maxSize: 200)
    totalScore(nullable: true)
    }


}
