package com.retouch

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
//@Secured(["ROLE_ADMIN"])
@Secured(['permitAll'])
class EarningController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def invoiceService
    @Transactional
    def index(Integer max) {
        println "TEST"
        params.max = Math.min(max ?: 10, 100)

        def earnings = Earning.findAllByRetoucher(springSecurityService.getCurrentUser(),params)
        def earningInstanceCount = Earning.countByRetoucher(springSecurityService.getCurrentUser())
        //test
       // invoiceService.registerEarning(Project.get(13))
        println earnings
        if(!earnings)
            earnings=[]

        respond earnings, model: [earningInstanceCount: earningInstanceCount]
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
