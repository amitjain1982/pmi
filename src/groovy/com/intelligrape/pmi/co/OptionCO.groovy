package com.intelligrape.pmi.co

import com.intelligrape.pmi.Option


class OptionCO {

    Long id
    String name
    Double score
    String sequenceNumber

    public OptionCO(Option option){
        id=option.id
        name=option.name
        score=option.score
        sequenceNumber=option.sequenceNumber
    }

    public OptionCO(Long aId,String aOptionName, Double aOptionScore, String seqNumber){
        id=aId
        name=aOptionName
        score=aOptionScore
        sequenceNumber = seqNumber
    }

    OptionCO(){}


}