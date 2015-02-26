package com.retouch


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProjectController {
    def myImageService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Project.list(params), model: [projectInstanceCount: Project.count()]
    }

    //Main upload page
    def upload(){
       def projectId = (new Date()).time.toString()
        [projectId:projectId]
    }

    def instructions(String id){
        def projectInstance = Project.findByProjectId(id)
        if(!projectInstance){
            println "NO Project" + id
            redirect(action: "upload")
        }

        [projectInstance:projectInstance]

    }

    @Transactional
    def addTask(){
        def project
        if(params.id){
            project  = Project.findByProjectId(params.id)
            if(!project){
                project = new Project(client:springSecurityService.getCurrentUser(),projectId:params.id ,createdDate:new Date() )
            }
        }else{
            redirect(action: "upload")
        }

        def imageFile
        if(params.reimage){
            imageFile = request.getFile('reimage')
        }

        if(imageFile && !imageFile.empty) {
            def fileName = myImageService.saveImage( imageFile )
            def image = new ReImage(imagePath: fileName)
            project?.originalImage = image
            image.save(flush:true)
            if(!project.save(flush:true)){
                flash.message = "Action Failed!!! Please try again"
                redirect(action: "upload")
            }else{
                redirect(action: "instructions", id:project.projectId )
            }
        }else{
            flash.message = "Please select an image"
            redirect(action: "upload")
        }
    }

    def show(Project projectInstance) {
        respond projectInstance
    }

    def create() {
        respond new Project(params)
    }

    @Transactional
    def save(Project projectInstance) {
        if (projectInstance == null) {
            notFound()
            return
        }

        if (projectInstance.hasErrors()) {
            respond projectInstance.errors, view: 'create'
            return
        }

        projectInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
                redirect projectInstance
            }
            '*' { respond projectInstance, [status: CREATED] }
        }
    }

    def edit(Project projectInstance) {
        respond projectInstance
    }

    @Transactional
    def update(Project projectInstance) {
        if (projectInstance == null) {
            notFound()
            return
        }

        if (projectInstance.hasErrors()) {
            respond projectInstance.errors, view: 'edit'
            return
        }

        projectInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Project.label', default: 'Project'), projectInstance.id])
                redirect projectInstance
            }
            '*' { respond projectInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Project projectInstance) {

        if (projectInstance == null) {
            notFound()
            return
        }

        projectInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Project.label', default: 'Project'), projectInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
