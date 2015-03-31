package com.retouch



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TechniqueController {

	def myImageService

	static allowedMethods = [save: "POST", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 100, 100)
        def uniqueTechniques = Technique.executeQuery("select distinct a.groep from Technique a")
		respond Technique.list(params), model:[techniqueInstanceCount: Technique.count(), uniqueTechniques:uniqueTechniques]
	}

	def show(Technique techniqueInstance) {
		respond techniqueInstance
	}

	def create() {
		respond new Technique(params)
	}
	
	def technique(){}

	@Transactional
	def save() {

		def techniqueInstance
		def beforeAfterImage
		def techniqueImage

		if(params.beforeafterimage){
			beforeAfterImage = request.getFile('beforeafterimage')
		}

		if(beforeAfterImage && !beforeAfterImage.empty){
			techniqueImage = myImageService.saveTechniqueImage(beforeAfterImage)
		}

		println "Technique Image Name:: " + techniqueImage

		if(techniqueImage){
			techniqueInstance = new Technique(beforeafterimage:techniqueImage, name:params.name, description:params.description, groep:params.groep, ratePerTechnique: 0.5)
		}

		if(!techniqueInstance.save(flush:true)){
            render(view: 'create', model: [techniqueInstance:techniqueInstance])
            return
        }

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'technique.label', default: 'Technique'),
					techniqueInstance.id
				])
				redirect techniqueInstance
			}
			'*' { respond techniqueInstance, [status: CREATED] }
		}
	}

	def edit(Technique techniqueInstance) {
		respond techniqueInstance
	}

	@Transactional
	def update(Technique techniqueInstance) {
        def beforeAfterImage
        def techniqueImage

        if(params.beforeafterfile){
            beforeAfterImage = request.getFile('beforeafterfile')
        }

		if (techniqueInstance == null) {
			notFound()
			return
		}

		if (techniqueInstance.hasErrors()) {
			respond techniqueInstance.errors, view:'edit'
			return
		}

        if(beforeAfterImage && !beforeAfterImage.empty){
            techniqueImage = myImageService.saveTechniqueImage(beforeAfterImage)
            myImageService.deleteTechniqueImage(techniqueInstance)
            techniqueInstance?.beforeafterimage=techniqueImage
            techniqueInstance?.name=params.name
            techniqueInstance?.groep=params.groep
            techniqueInstance?.description=params.description
            techniqueInstance?.ratePerTechnique=0.5
        }

		techniqueInstance.save(flush:true)

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Technique.label', default: 'Technique'),
					techniqueInstance.id
				])
				redirect techniqueInstance
			}
			'*'{ respond techniqueInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Technique techniqueInstance) {

		if (techniqueInstance == null) {
			notFound()
			return
		}
        try {
            myImageService.deleteTechniqueImage(techniqueInstance)
            techniqueInstance.delete(flush:true)
        } catch (Exception e){
            render(view: 'show')
            return
        }

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Technique.label', default: 'Technique'),
					techniqueInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'technique.label', default: 'Technique'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
