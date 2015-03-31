package com.retouch

import grails.transaction.Transactional

@Transactional
class ConfigurationService {

    def getParamsKeyValue() {
        def siteParmsMap = SiteParams.list().collectEntries { keyvalue ->
            [keyvalue.parameterName, keyvalue.parameterValue]
        }
    }
}
