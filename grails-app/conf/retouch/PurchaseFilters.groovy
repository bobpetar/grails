package retouch

import com.retouch.Project

class PurchaseFilters {

    def filters = {
        all(controller: 'paypal', action: 'buy') {
            before = {
                params.baseUrl ="http://localhost:8080/retouch"
            }
            after = { Map model ->
                println("Payment Instance " + request.payment)
                def payment = request.payment
                println("Payment transaction "+params)
                def projectInstance = Project.findByProjectId(params.itemName)
                projectInstance.task.payment=payment
                projectInstance.save(flush: true)
            }
            afterView = { Exception e ->

            }
        }
    }
}
