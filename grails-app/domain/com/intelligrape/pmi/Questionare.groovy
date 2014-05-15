package com.intelligrape.pmi

import com.intelligrape.pmi.enums.QuestionareCategory
import com.intelligrape.pmi.enums.QuestionareStatus


class Questionare {

    String title
    String description
    Date expiryDate
    Vertical vertical
    QuestionareCategory category = QuestionareCategory.PROJECT
    QuestionareStatus status
    Date dateCreated
    Date lastUpdated


    static hasMany = [questions: Question]


    static constraints = {
        description(nullable: true, blank: true, type:'text')
        expiryDate(nullable: true)
    }

}
 