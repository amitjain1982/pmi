package com.intelligrape.pmi.co

import com.intelligrape.pmi.Question
import com.intelligrape.pmi.Questionnaire
import grails.validation.Validateable
import org.apache.jasper.compiler.ELParser

@Validateable
public class QuestionCO {

    Long id
    String sequenceNumber
    String text
    String detailedDescription
    Questionnaire questionnaire
    List<String> optionId =[]
    List<String> optionName=[]
    List<Double> optionScore=[]

    List<OptionCO> optionCOs=[]

    QuestionCO() {}

    QuestionCO(Question question) {
        sequenceNumber = question.sequenceNumber
        text = question.text
        detailedDescription = question.detailedDescription
        questionnaire = question.questionnaire
        id = question.id
        question.options?.each{
            optionCOs << new OptionCO(it)
        }
    }

    static constraints = {
        sequenceNumber(blank: false)
        text(blank: false)
        detailedDescription(blank: true)
        optionCOs(minSize: 2)
    }

    public List<OptionCO> getOptionCOs(){
        if(! this.@optionCOs){
            this.@optionCOs=[]

            optionName?.eachWithIndex{obj, index->
                Long id= optionId[index]? optionId[index] as Long: null
                this.@optionCOs << new OptionCO(id, optionName[index],optionScore[index],"${index+1}")
            }
        }
        return this.@optionCOs.sort{it.sequenceNumber}
    }



}
