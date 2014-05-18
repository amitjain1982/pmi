package com.intelligrape.pmi


class Option {

    String sequenceNumber
    String name
    Double score
    Date dateCreated
    Date lastUpdated

    static belongsTo = [question: Question]

    static constraints = {
        score(min: 0.doubleValue())
        sequenceNumber(nullable: true)
    }

    static mapping = {
        table(name: 'question_option')
    }

    public String toString() {
        return name
    }
}
