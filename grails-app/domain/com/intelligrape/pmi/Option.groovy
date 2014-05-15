package com.intelligrape.pmi


class Option {

    String sequenceNumber
    String name
    Double score
    Date dateCreated
    Date lastUpdated

    static belongsTo = [question: Question]

    static constraints = {
        sequenceNumber(unique: true)
        name(unique: true)
        score(min: 0.doubleValue())
    }


}
