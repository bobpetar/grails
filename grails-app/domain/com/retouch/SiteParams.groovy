package com.retouch

class SiteParams {
    String parameterName
    String parameterValue

    static constraints = {
        parameterName(unique: true, nullable:false,blank:false)
        parameterValue(nullable:false,blank:false, maxSize: 500)
    }
}
