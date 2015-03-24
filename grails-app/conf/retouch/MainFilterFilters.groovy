package retouch

import com.retouch.Project
import com.retouch.User
import grails.plugin.springsecurity.SpringSecurityUtils

class MainFilterFilters {
    def springSecurityService

    def filters = {
        all(controller:'*', action:'*') {
            before = {

            }
            after = { Map model ->
                if(SpringSecurityUtils.ifAllGranted("ROLE_RETOUCHER")){
                    def newTaskCount = Project.countByAssignedTo(null)
                    def incompleteTaskCount = Project.countByStatusNotEqualAndAssignedTo("Complete",(User)springSecurityService.getCurrentUser())
                    model?.newTaskCount = newTaskCount
                    model?.incompleteTaskCount = incompleteTaskCount
                }

            }
            afterView = { Exception e ->

            }
        }
    }
}
