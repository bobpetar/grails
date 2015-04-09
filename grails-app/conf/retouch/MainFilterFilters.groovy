package retouch

import com.retouch.Project
import com.retouch.SiteParams
import com.retouch.User
import grails.plugin.springsecurity.SpringSecurityUtils

class MainFilterFilters {
    def springSecurityService

    def configurationService
    def filters = {
        all(controller:'*', action:'*') {
            before = {

            }
            after = { Map model ->
                if(SpringSecurityUtils.ifAllGranted("ROLE_RETOUCHER")){
                    def newTaskCount = Project.countByStatus("Paid")
                    def incompleteTaskCount = Project.countByStatusNotEqualAndAssignedTo("Complete",(User)springSecurityService.getCurrentUser())
                    model?.newTaskCount = newTaskCount
                    model?.incompleteTaskCount = incompleteTaskCount
                }
                def config = SpringSecurityUtils.securityConfig
                model?.postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
                model?.rememberMeParameter= config.rememberMe.parameter
                model?.siteParams = configurationService.getParamsKeyValue()
            }
            afterView = { Exception e ->

            }
        }
    }
}
