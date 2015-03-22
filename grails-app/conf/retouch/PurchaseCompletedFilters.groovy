package retouch

import com.retouch.Task

class PurchaseCompletedFilters {

    def filters = {
        all(controller: 'paypal', action: 'success|notifyPaypal') {
            before = {

            }
            after = { Map model ->
                def taskInstance = Task.findByPayment(request.payment)
                if(request.payment && request.payment.status == org.grails.paypal.Payment.COMPLETE) {
                    if(!taskInstance.paymentCompleted){
                        taskInstance.paymentCompleted=true
                        taskInstance.save(flush: true)
                    }
                }
            }
            afterView = { Exception e ->

            }
        }
    }
}
