package com.intelligrape.pmi

import com.intelligrape.pmi.enums.QuestionnaireCategory
import com.intelligrape.pmi.enums.QuestionnaireStatus


class Questionnaire {

    String title
    String description
    Date expiryDate
    Vertical vertical
    QuestionnaireCategory category = QuestionnaireCategory.PROJECT
    QuestionnaireStatus status
    Date dateCreated
    Date lastUpdated


    static hasMany = [questions: Question]


    static constraints = {
        description(nullable: true, blank: true, type: 'text')
        expiryDate(nullable: true)
    }

}



