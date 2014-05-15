package com.intelligrape.pmi


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

}
