package retouch

import com.retouch.Task

class PurchaseFilters {

    def filters = {
        all(controller: 'paypal', action: 'buy') {
            before = {
                params.baseUrl = grailsApplication.config.grails.serverURL
            }
            after = { Map model ->
                def payment = request.payment
                def taskInstance = Task.get(params.taskInstance)
                taskInstance.payment=payment
                taskInstance.save(flush: true)
            }
            afterView = { Exception e ->

            }
        }
    }
}
