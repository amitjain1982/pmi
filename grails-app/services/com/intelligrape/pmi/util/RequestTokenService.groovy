package com.intelligrape.pmi.util

import com.google.gson.JsonElement
import com.intelligrape.pmi.CustomPropertyValue
import com.intelligrape.pmi.RequestToken
import org.apache.commons.logging.LogFactory

class RequestTokenService {
    private static final LOGGER = LogFactory.getLog(this)
    private static final String BASE_URL = "http://localhost:8080/pmi"
    private static final String CONTROLLER = "mail"
    private static final String ACTION = "confirm"

    def grailsApplication
    def grailsLinkGenerator

    private RequestToken createRequestToken(String controllerName, String actionName, Map customPropertiesMap, String token = "", Integer daysToExpire = null) {
        LOGGER.debug("createRequestToken, controllerName: ${controllerName}, actionName: ${actionName}, customPropertiesMap: ${customPropertiesMap}, token: ${token}, daysToExpire: ${daysToExpire}")
        daysToExpire = daysToExpire ?: grailsApplication.config.pmi.email.daysToExpire
        RequestToken requestToken = new RequestToken(controllerName: controllerName, actionName: actionName, expiryDate: new Date() + daysToExpire)
        requestToken.token = token ?: UUID.randomUUID().toString().replaceAll('-', '')
        requestToken.save()
        addCustomProperties(requestToken, customPropertiesMap)
        return requestToken
    }


    private static void addCustomProperties(RequestToken requestToken, Map customPropertiesMap) {
        customPropertiesMap.each { name, value ->
            if (value instanceof JsonElement) {
                value = value.getAsString()
            }
            value = value.toString().replaceAll(/["']/, "")
            CustomPropertyValue customPropertyValue = new CustomPropertyValue(name: name, value: value, requestToken: requestToken)
            customPropertyValue.save()
        }

    }

    public String generateLink(String controllerName, String actionName, Map params, String token = "", Integer daysToExpire = null) {
        LOGGER.debug("generateLink, controllerName: ${controllerName}, actionName: ${actionName}, token: ${token}, daysToExpire: ${daysToExpire}")
        RequestToken requestToken = createRequestToken(controllerName, actionName, params, token, daysToExpire)
        return grailsLinkGenerator.link(base: BASE_URL, controller: CONTROLLER, action: ACTION, 'questionnaire.id':params['questionnaire.id'],id: requestToken.token)
    }

}
