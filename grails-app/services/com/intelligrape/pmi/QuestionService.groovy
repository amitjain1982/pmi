package com.intelligrape.pmi

import com.intelligrape.pmi.co.OptionCO
import com.intelligrape.pmi.co.QuestionCO
import grails.transaction.Transactional

@Transactional
class QuestionService {

    def serviceMethod() {

    }

    public static Question saveQuestion(QuestionCO questionCO) {
        if (questionCO == null) {
            return null
        }

        if (!questionCO.validate()) {


            return null
        }

        Question question = new Question(questionCO)
        question.save(flush: true)

        saveOptions(question, questionCO)
        return question
    }

    public static List<Option> saveOptions(Question question, QuestionCO questionCO) {

        List<OptionCO> optionCOList = questionCO.optionCOs

        optionCOList.each{
            Option option = new Option(sequenceNumber: it.sequenceNumber, name: it.name, score: it.score, question: question)
            option.save(flush: true, failOnError: true)
        }
        return optionCOList
    }






}
