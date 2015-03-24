package retouch

import com.retouch.Task
import org.grails.paypal.Payment

class PurchaseFilters {

    def taskService
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

        buyFilter(controller:"paypal", action:"buy") {
            after = {

            }
        }
        paymentReceivedFilter(controller:'paypal', action:'(success|notifyPaypal)') {
            after = {
                def payment = request.payment
                if(payment && payment.status == Payment.COMPLETE) {
                    def task = Task.findByPayment(payment)
                    task.project.status = "Paid"
                    task.project.save()
                    taskService.notifyRetouchers(task)
                }
            }
        }
    }
}
