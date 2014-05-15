package com.intelligrape.pmi


class Question {

    String sequenceNumber
    String text
    String detailedDescription
    Date dateCreated
    Date lastUpdated

    static hasMany = [options: Option]
    static belongsTo = [questionare: Questionare]

    static constraints = {
        sequenceNumber(blank: false)
        text(unique: true, blank: false)
        detailedDescription(nullable: true)
    }


}
