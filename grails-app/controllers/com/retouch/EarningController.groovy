package com.retouch

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(["ROLE_RETOUCHER"])
//TODO FiX ROLE!!!
//@Secured(['permitAll'])
class EarningController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService
    def invoiceService

    def accountService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def retoucher = springSecurityService.getCurrentUser()

        def earnings = Earning.findAllByRetoucher(retoucher,params)
        def earningInstanceCount = Earning.countByRetoucher(retoucher)
        def totalEarned =  accountService.getTotalEarned(retoucher)
        def availableBalance =  accountService.getAvailableBalance(retoucher)
        def totalProjects =  accountService.getTotalProjectsCompleted(retoucher)
        def redeemLimit = accountService.getRedeemLimit()
        if(!earnings)
            earnings=[]

        respond earnings, model: [earningInstanceCount: earningInstanceCount,totalEarned : totalEarned,totalProjects:totalProjects, availableBalance:availableBalance ,redeemLimit:redeemLimit]
    }

    def redeemHistory(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def retoucher = springSecurityService.getCurrentUser()

        def redeemtions = Redeemtion.findAllByRetoucher(retoucher,params)
        def redeemtionInstanceCount = Redeemtion.countByRetoucher(retoucher)
        def totalEarned =  accountService.getTotalEarned(retoucher)
        def availableBalance =  accountService.getAvailableBalance(retoucher)
        def totalProjects =  accountService.getTotalProjectsCompleted(retoucher)
        def redeemLimit = accountService.getRedeemLimit()

        if(!redeemtions)
            redeemtions=[]
        [redeemtions:redeemtions , redeemtionInstanceCount: redeemtionInstanceCount,totalEarned : totalEarned,totalProjects:totalProjects, availableBalance:availableBalance ,redeemLimit:redeemLimit]
    }

    @Transactional
    def redeem(){
        User retoucher = (User)springSecurityService.getCurrentUser()
        println params.redeemAmount
        BigDecimal redeemAmt = 0
        try{
            redeemAmt = new BigDecimal(params.redeemAmount)
        }catch(e){
            redeemAmt = 0
        }

        if( accountService.redeemAmount(retoucher,redeemAmt)){
            flash.message = "Redeem Successful"
        }else{
            flash.error = "Redeem Failed! Please check the amount you are trying to redeem"
        }

        redirect(action:'redeemHistory' )
    }

 /*   def show(Earning earningInstance) {
        respond earningInstance
    }*/

  /*  def create() {
        respond new Earning(params)
    }*/

   /* @Transactional
    def save(Earning earningInstance) {
        if (earningInstance == null) {
            notFound()
            return
        }

        if (earningInstance.hasErrors()) {
            respond earningInstance.errors, view: 'create'
            return
        }

        earningInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'earning.label', default: 'Earning'), earningInstance.id])
                redirect earningInstance
            }
            '*' { respond earningInstance, [status: CREATED] }
        }
    }*/

  /*  def edit(Earning earningInstance) {
        respond earningInstance
    }*/

    /*@Transactional
    def update(Earning earningInstance) {
        if (earningInstance == null) {
            notFound()
            return
        }

        if (earningInstance.hasErrors()) {
            respond earningInstance.errors, view: 'edit'
            return
        }

        earningInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Earning.label', default: 'Earning'), earningInstance.id])
                redirect earningInstance
            }
            '*' { respond earningInstance, [status: OK] }
        }
    }
*/
   /* @Transactional
    def delete(Earning earningInstance) {

        if (earningInstance == null) {
            notFound()
            return
        }

        earningInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Earning.label', default: 'Earning'), earningInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }*/

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'earning.label', default: 'Earning'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
