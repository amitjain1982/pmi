package com.intelligrape.pmi

import com.intelligrape.pmi.co.OptionCO
import com.intelligrape.pmi.co.QuestionCO


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



    public Question(QuestionCO questionCO) {
        this.properties = questionCO.properties

    }








}
