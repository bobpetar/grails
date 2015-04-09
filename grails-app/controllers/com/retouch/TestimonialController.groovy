package com.retouch


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TestimonialController {

    def myImageService

    static allowedMethods = [save: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Testimonial.list(params), model: [testimonialInstanceCount: Testimonial.count()]
    }

    def show(Testimonial testimonialInstance) {
        respond testimonialInstance
    }

    def create() {
        respond new Testimonial(params)
    }

    @Transactional
    def save(Testimonial testimonialInstance) {
        if (testimonialInstance == null) {
            notFound()
            return
        }

        if (testimonialInstance.hasErrors()) {
            respond testimonialInstance.errors, view: 'create'
            return
        }

        def photo
        def testimonialImage

        println(params)

        if(params.photofile){
            photo = request.getFile('photofile')
        }

        if(photo && !photo.empty){
            testimonialImage = myImageService.saveTechniqueImage(photo)
            testimonialInstance = new Testimonial(photo: testimonialImage, fullName: params.fullName, testimonial: params.testimonial, userType: params.userType, customerPosition:params.customerPosition)
        }

        testimonialInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'testimonial.label', default: 'Testimonial'), testimonialInstance.id])
                redirect testimonialInstance
            }
            '*' { respond testimonialInstance, [status: CREATED] }
        }
    }

    def edit(Testimonial testimonialInstance) {
        respond testimonialInstance
    }

    @Transactional
    def update(Testimonial testimonialInstance) {
        if (testimonialInstance == null) {
            notFound()
            return
        }

        if (testimonialInstance.hasErrors()) {
            respond testimonialInstance.errors, view: 'edit'
            return
        }

        def photo

        if(params.photofile){
            photo = request.getFile('photofile')
        }

        def testimonialImage

        if(photo && !photo.empty){
            testimonialImage = myImageService.saveTechniqueImage(photo)
            myImageService.deleteTestimonialImage(testimonialInstance)
            testimonialInstance?.photo=testimonialImage
            testimonialInstance?.fullName=params.fullName
            testimonialInstance?.testimonial=params.testimonial
            testimonialInstance?.userType=params.userType
            testimonialInstance?.customerPosition=params.customerPosition
        }

        testimonialInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Testimonial.label', default: 'Testimonial'), testimonialInstance.id])
                redirect testimonialInstance
            }
            '*' { respond testimonialInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Testimonial testimonialInstance) {

        if (testimonialInstance == null) {
            notFound()
            return
        }

        testimonialInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Testimonial.label', default: 'Testimonial'), testimonialInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'testimonial.label', default: 'Testimonial'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
