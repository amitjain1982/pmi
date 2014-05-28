package com.intelligrape.pmi

import com.intelligrape.pmi.common.AppConstant

class RequestToken {

    String token
    String controllerName
    String actionName
    Boolean consumed = false
    Date expiryDate
    Date dateCreated
    Date lastUpdated

    static hasMany = [customPropertyValues: CustomPropertyValue]

    static mapping = {
        id name: 'token', generator: 'assigned'
        customPropertyValues cascade: "all-delete-orphan"
    }

    public def getParameters() {
        Map params = [:]
        customPropertyValues?.each {
            params[it.name] = it.value
        }
        return params
    }

    //TODO:need to test it
    public static Integer expireTokens() {
        CustomPropertyValue.expireTokensValues()
        executeUpdate("Delete from RequestToken where expiryDate<=:expiryDate or consumed=true", [expiryDate: new Date() - AppConstant.DEACTIVATE_LINK_DAY])
    }

}
