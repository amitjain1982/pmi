package com.intelligrape.pmi

import org.apache.commons.logging.LogFactory

class RemoveDeactivateRequestTokenJob {
    private static final LOGGER = LogFactory.getLog(this)

    static triggers = {
        simple repeatInterval: 24 * 60 * 60 * 1000 // execute job once in 24 hours
    }

    def execute() {
        LOGGER.debug("start remove deactivate request token job")
        RequestToken.expireTokens()
    }
}
