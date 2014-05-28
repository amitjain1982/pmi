package com.intelligrape.pmi

import com.intelligrape.pmi.common.AppConstant

class CustomPropertyValue {

    String name
    String value
    static belongsTo = [requestToken: RequestToken]

    static mapping = {
    }

    static constraints = {
        value nullable: true, blank: false
    }

    public static Integer expireTokensValues() {
        executeUpdate("Delete from CustomPropertyValue c where c.requestToken.token in (Select r.token from RequestToken r where expiryDate=:expiryDate or consumed=true)", [expiryDate: new Date() - AppConstant.DEACTIVATE_LINK_DAY])
    }

}
