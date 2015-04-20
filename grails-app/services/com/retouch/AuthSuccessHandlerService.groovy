package com.retouch

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.transaction.Transactional
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Transactional
class AuthSuccessHandlerService extends SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    protected String determineTargetUrl(HttpServletRequest request,
                                        HttpServletResponse response) {

        if(SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")){
            return adminUrl
        }else if (SpringSecurityUtils.ifAllGranted("ROLE_USER")){
            return userUrl
        }else if (SpringSecurityUtils.ifAllGranted("ROLE_RETOUCHER")){
            return retoucherUrl
        }else{
            return super.determineTargetUrl(request, response)
        }
    }

    private String userUrl
    private String adminUrl
    private String retoucherUrl

    public void setUserUrl(String userUrl){
        this.userUrl = userUrl
    }

    public void setAdminUrl(String adminUrl){
        this.adminUrl = adminUrl
    }

    public void setRetoucherUrl(String retoucherUrl){
        this.retoucherUrl = retoucherUrl
    }
}
