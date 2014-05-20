package com.intelligrape.pmi

import com.intelligrape.pmi.co.OptionCO


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
        sequenceNumber(sort: 'asc')
    }

    public String toString() {
        return name
    }

    Option(){}

    Option(OptionCO optionCO, Question aQuestion){
        name=optionCO.name
        score=optionCO.score
        sequenceNumber = optionCO.sequenceNumber
        question = aQuestion
    }
}
