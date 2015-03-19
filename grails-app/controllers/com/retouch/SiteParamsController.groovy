package com.retouch

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(["ROLE_ADMIN"])
class SiteParamsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SiteParams.list(params), model: [siteParamsInstanceCount: SiteParams.count()]
    }

    def show(SiteParams siteParamsInstance) {
        respond siteParamsInstance
    }

    def create() {
        respond new SiteParams(params)
    }

    @Transactional
    def save(SiteParams siteParamsInstance) {
        if (siteParamsInstance == null) {
            notFound()
            return
        }

        if (siteParamsInstance.hasErrors()) {
            respond siteParamsInstance.errors, view: 'create'
            return
        }

        siteParamsInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'siteParams.label', default: 'SiteParams'), siteParamsInstance.id])
                redirect siteParamsInstance
            }
            '*' { respond siteParamsInstance, [status: CREATED] }
        }
    }

    def edit(SiteParams siteParamsInstance) {
        respond siteParamsInstance
    }

    @Transactional
    def update(SiteParams siteParamsInstance) {
        if (siteParamsInstance == null) {
            notFound()
            return
        }

        if (siteParamsInstance.hasErrors()) {
            respond siteParamsInstance.errors, view: 'edit'
            return
        }

        siteParamsInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SiteParams.label', default: 'SiteParams'), siteParamsInstance.id])
                redirect siteParamsInstance
            }
            '*' { respond siteParamsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SiteParams siteParamsInstance) {

        if (siteParamsInstance == null) {
            notFound()
            return
        }

        siteParamsInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SiteParams.label', default: 'SiteParams'), siteParamsInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteParams.label', default: 'SiteParams'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
