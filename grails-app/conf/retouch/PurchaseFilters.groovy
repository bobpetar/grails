package retouch

import com.retouch.Project

class PurchaseFilters {

    def filters = {
        all(controller: 'paypal', action: 'buy') {
            before = {
                params.baseUrl = grailsApplication.config.grails.serverURL
            }
            after = { Map model ->
                def payment = request.payment
                def projectInstance = Project.findByProjectId(params.itemName)
                projectInstance.task.payment=payment
                projectInstance.save(flush: true)
            }
            afterView = { Exception e ->

            }
        }
    }
}
