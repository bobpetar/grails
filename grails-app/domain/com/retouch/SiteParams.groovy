package com.retouch

class SiteParams {
    String parameterName
    String parameterValue

    static constraints = {
        parameterName(nullable:false,blank:false)
        parameterValue(nullable:false,blank:false)
    }
}
