import grails.plugin.springsecurity.SpringSecurityUtils


beans = {

    authenticationSuccessHandler(com.retouch.AuthSuccessHandlerService) {
        def conf = SpringSecurityUtils.securityConfig
        requestCache = ref('requestCache')
        defaultTargetUrl = conf.successHandler.defaultTargetUrl
        alwaysUseDefaultTargetUrl = conf.successHandler.alwaysUseDefault
        targetUrlParameter = conf.successHandler.targetUrlParameter
        useReferer = conf.successHandler.useReferer
        redirectStrategy = ref('redirectStrategy')
        adminUrl = "/user"
        userUrl = "/upload"
        retoucherUrl = "/tasks"
    }
}