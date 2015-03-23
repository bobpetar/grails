package com.retouch

import org.grails.paypal.Payment
import org.grails.paypal.PaymentItem

class PaypalController extends org.grails.paypal.PaypalController {

    def buy() {
        def taskInstance = Task.get(params.taskInstance)
        def itemName = taskInstance.project.projectId
        def itemNumber = taskInstance.project.projectId
        def amount = taskInstance.techniques.ratePerTechnique.sum()
        def buyerId = taskInstance.project.client.id

        def payment

        if (params.transactionId) {
            payment = Payment.findByTransactionId(params.transactionId)
        }
        else {
            payment = new Payment(buyerId:buyerId)
            payment.addToPaymentItems(new PaymentItem(amount: amount, itemName: itemName, itemNumber: itemNumber))
        }

        if (payment?.id) log.debug "Resuming existing transaction $payment"
        if (payment?.validate()) {
            request.payment = payment
            payment.save(flush: true)
            def config = grailsApplication.config.grails.paypal
            def server = config.server
            def baseUrl = params.baseUrl
            def login = params.email ?: config.email
            if (!server || !login) throw new IllegalStateException("Paypal misconfigured! You need to specify the Paypal server URL and/or account email. Refer to documentation.")

            def commonParams = [buyerId: buyerId, transactionId: payment.transactionId]
            if (params.returnAction) {
                commonParams.returnAction = params.returnAction
            }
            if (params.returnController) {
                commonParams.returnController = params.returnController
            }
            if (params.cancelAction) {
                commonParams.cancelAction = params.cancelAction
            }
            if (params.cancelController) {
                commonParams.cancelController = params.cancelController
            }
            def notifyURL = g.createLink(absolute: baseUrl==null, base: baseUrl, controller: 'paypal', action: 'notifyPaypal', params: commonParams).encodeAsURL()
            def successURL = g.createLink(absolute: baseUrl==null, base: baseUrl, controller: 'paypal', action: 'success', params: commonParams).encodeAsURL()
            def cancelURL = g.createLink(absolute: baseUrl==null, base: baseUrl, controller: 'paypal', action: 'cancel', params: commonParams).encodeAsURL()

            def url = new StringBuffer("$server?")
            url << "cmd=_xclick&"
            url << "business=$login&"
            url << "item_name=${itemName}&"
            url << "item_number=${itemNumber}&"
            url << "quantity=${payment.paymentItems[0].quantity}&"
            url << "amount=${amount}&"
            if (payment.paymentItems[0].discountAmount > 0) {
                url << "discount_amount=${payment.paymentItems[0].discountAmount}&"
            }
            url << "tax=${payment.tax}&"
            url << "currency_code=${payment.currency}&"
            if (params.lc)
                url << "lc=${params.lc}&"
            url << "notify_url=${notifyURL}&"
            url << "return=${successURL}&"
            url << "cancel_return=${cancelURL}"

            log.debug "Redirection to PayPal with URL: $url"

            redirect(url: url)
        }
        else {
            flash.payment = payment
            redirect(url: params.originalURL)
        }
    }
}
