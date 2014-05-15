package com.intelligrape.pmi

import grails.transaction.Transactional

@Transactional
class UtilService {
     def grailsApplication

     public def getBean(String beanName){
         grailsApplication.mainContext.getBean(beanName)
     }
}
