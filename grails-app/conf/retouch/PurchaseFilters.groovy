package retouch

import com.retouch.Task
import com.retouch.User
import org.grails.paypal.Payment

class PurchaseFilters {

    def taskService
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

        buyFilter(controller:"paypal", action:"buy") {
            after = {

            }
        }
        paymentReceivedFilter(controller:'paypal', action:'(notifyPaypal)') {
            after = {
                def payment = request.payment
                println "**********************************IPN RECIVED***********************************"
                println "action: " + params.action
                println "payment: " +payment.status

                if(payment && payment.status == Payment.COMPLETE) {
                    println "updating tasks and notifying client"
                    def task = Task.findByPayment(payment)
                    println "client email: "+task?.project?.client?.email
                    taskService.triggerConfirmation(task.project.client)
                    task.project.status = "Paid"
                    task.project.save()
                    println "updating tasks and notifying retouchers"
                    taskService.notifyRetouchers(task)
                }
                println "**********************************IPN END***********************************"
            }
        }
    }
}
