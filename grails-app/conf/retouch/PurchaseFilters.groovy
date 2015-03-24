package retouch

import com.retouch.Task

class PurchaseFilters {

    def filters = {
        all(controller: 'paypal', action: 'buyImage') {
            before = {
                params.baseUrl = grailsApplication.config.grails.serverURL
            }
            after = { Map model ->
                println("params from purchase filter: " + params)
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
