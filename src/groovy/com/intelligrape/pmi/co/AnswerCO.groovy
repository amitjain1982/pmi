package com.intelligrape.pmi.co

import com.intelligrape.pmi.AnswerSheet
import com.intelligrape.pmi.Option
import com.intelligrape.pmi.Question
import grails.validation.Validateable

@Validateable
class AnswerCO {

    String comment
    Question question
    Option optionSelected
//    AnswerSheet answerSheet

    static constraints = {
        comment(nullable: true,maxSize:100)
    }



}
