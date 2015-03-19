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
                    def incompleteTaskCount = Project.countByStatusNotEqual("Complete")
                    model?.newTaskCount = newTaskCount
                    model?.incompleteTaskCount = incompleteTaskCount
                }

            }
            afterView = { Exception e ->

            }
        }
    }
}
