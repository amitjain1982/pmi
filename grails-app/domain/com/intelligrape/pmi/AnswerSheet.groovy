package com.intelligrape.pmi

import com.intelligrape.pmi.co.AnswerSheetCO
import com.intelligrape.pmi.enums.AnswerSheetStatus


class AnswerSheet {

    String comment
    Double totalScore
    AnswerSheetStatus status
    Collabortaor attemptedBy
    java.util.Date dateAttempted
    Project project

    Date dateCreated
    Date lastUpdated

    AnswerSheet(){}

    public AnswerSheet(AnswerSheetCO answerSheetCO){
        this.properties=answerSheetCO.properties
    }

    static hasMany = [answers: Answer]
    static belongsTo = [questionnaire: Questionnaire]

    static constraints = { comment(nullable: true, maxSize: 256)
    totalScore(nullable: true)
    }

    public Double calculateScore() {
        Double maxMarks=(this.answers.size()*4)
        Double scoreOutOfMaxMarks=(this?.answers*.optionSelected*.score?.sum()  ?: 0) as Double
        Double scoreOutOf10=((scoreOutOfMaxMarks/maxMarks)*10)
        this.totalScore=scoreOutOf10
    }
}
