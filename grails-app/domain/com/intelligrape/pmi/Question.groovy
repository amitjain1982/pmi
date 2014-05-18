package com.intelligrape.pmi


class Question {

    String sequenceNumber
    String text
    String detailedDescription
    Date dateCreated
    Date lastUpdated

    static hasMany = [options: Option]
    static belongsTo = [questionnaire: Questionnaire]

    static constraints = {
        sequenceNumber(blank: false)
        text(blank: false)
        detailedDescription(nullable: true)
        options(minSize: 2)
    }


}
