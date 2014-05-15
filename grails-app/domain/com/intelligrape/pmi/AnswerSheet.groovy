package com.intelligrape.pmi

import com.intelligrape.pmi.enums.AnswerSheetStatus


class AnswerSheet {


    String comment
    Double totalScore
    AnswerSheetStatus status
    Collabortaor attemptedBy
    Date dateAttempted
    Project project // todo think over it more

    Date dateCreated
    Date lastUpdated


    static hasMany = [answers: Answer]
    static belongsTo = [questionare: Questionare]

    static constraints = { comment(nullable: true,maxSize: 200) }


}
