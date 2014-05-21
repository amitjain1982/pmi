package com.intelligrape.pmi

import com.intelligrape.pmi.co.AnswerCO


class Answer {

    String comment
    Question question
    Date dateCreated
    Date lastUpdated
    Option optionSelected


    static belongsTo = [answerSheet: AnswerSheet]


    static constraints = {
        comment(nullable: true,maxSize:100)
    }

    Answer(){}

    public Answer(AnswerCO answerCO)
    {
        this.comment=answerCO.comment
        this.question=answerCO.question
        this.optionSelected=answerCO.optionSelected


    }

}
