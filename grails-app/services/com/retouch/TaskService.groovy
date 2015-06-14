package com.retouch

import grails.converters.JSON
import grails.transaction.Transactional
import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib

@Transactional
class TaskService {

    def mailService
    def grailsApplication
    def settingsService

   // def grailsLinkGenerator

    def getImageTagJSON(ImageTag tag) {
        return ["x1":tag.posX,"y1":tag.posY,"height":tag.height,"width":tag.width,"note":tag.note,note_id:tag.id]

    }

    def getImageTagJSON(Task task){
        def list = []
        for (ImageTag it in task.tags) {
            list.add(getImageTagJSON(it))
        }
        return list as JSON
    }

    def notifyRetouchers(Task task){
        def recoucherRole=  Role.findByAuthority("ROLE_RETOUCHER")
        def serverURL = grailsApplication.config.grails.serverURL
        def claimPageURl = serverURL + "/task/show/${task.project.id}"
        try{

            if(recoucherRole){
                def retouchersEmails
                if(settingsService.isInTestMode()){
                    retouchersEmails = settingsService.getTestMailRetouchers()
                }else{
                    retouchersEmails = UserRole.findAllByRole(recoucherRole).user.email.toArray()
                }

                println retouchersEmails
                mailService.sendMail {
                    async true
                    bcc retouchersEmails
                    subject "New Task"
                    html "Hi Retoucher,<br><br>" +
                            "A new retouch task is available. You can check out the task and see if you want to claim it.<br>"+
                            "Remember if you claim the task it will be yours and you should work on it immediately. You have 1 hour to complete the task. <br><br>" +
                            "Please click on following link to see the task:<br><br>" +
                            "<a href='${claimPageURl}'>go to new task now</a> "
                }

            }


        }catch(e){
            log.error(e)
        }
    }

    def triggerConfirmation(User user){
        IssuedCoupon newCoupon = generateCoupon(user)
        println "NEW COUPON GENERATED" + newCoupon
        if(newCoupon){
            sendConfirmationMailWithCoupon(user,newCoupon)
        }

    }


    IssuedCoupon generateCoupon(User user){
        Coupon activeCoupon = Coupon.findByActive(true)
        if(activeCoupon){
            IssuedCoupon newCoupon = new IssuedCoupon(activeCoupon,user)
            if(newCoupon.save(flush: true)){
                return newCoupon
            }else{
                return null
            }
        }
    }


    def sendConfirmationMailWithCoupon(User user,IssuedCoupon coupon){
        try{
            if(user){
                mailService.sendMail {
                    async true
                    to user.email
                    subject "New Task"
                    html "Hey ${user.firstname}, <br><br>" +
                            "Thank you for your order. We are happy to have you as a customer." +
                            " We hope you enjoyed our services and as a thank you, we are giving you a free discount coupon." +
                            " Your discount code is ${coupon?.code} which will give you a discount of ${coupon?.discountPercent}%" +
                            " on your next service purchase." //TODO add detailed email
                }
            }
        }catch(e){
            println "EMAIL SENDING FAILED!!!! TO: " +user?.email

            log.error(e)
        }
    }
}
