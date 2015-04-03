package com.retouch

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(["ROLE_RETOUCHER","ROLE_ADMIN"])
class TaskController {

    def springSecurityService
    def myImageService
    def taskService
    def mailService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(["ROLE_RETOUCHER"])
    @Transactional
    def claimTask(Project projectInstance){
        if(projectInstance && !projectInstance.assignedTo){
            projectInstance.assignedTo  = (User)springSecurityService.getCurrentUser()
            projectInstance.status  = "In Progress"
            if(projectInstance.save(flush: true)){
                flash.message = "Task has been successfully claimed"
                redirect(action: "show",id:projectInstance.id )
                return
            }
        }
        flash.message = "Claim Failed! Someone else must have claimed the task before you."
        redirect(action: "myTasks")
    }

    @Secured(["ROLE_RETOUCHER"])
    @Transactional
    def upload(Project projectInstance){
        def imageFile
        if(params.reimage){
            imageFile = request.getFile('reimage')
        }

        if(imageFile && !imageFile.empty) {
            def fileName = myImageService.saveImagePackage( imageFile )
            def image = new ReImage(imagePath: fileName)
            def imageToDelete = null
            if(projectInstance.task.finalImage){
                imageToDelete = ReImage.get(projectInstance.task.finalImage.id)
                projectInstance.task.finalImage = null


            }
            projectInstance.task.finalImage = image
            projectInstance.status = "In Review"


            def proj
            try{
                projectInstance.task.save(flush: true)
                proj =  projectInstance.save(flush: true)
                //Notify the Client

                mailService.sendMail {
                    to projectInstance.client.email
                    subject "Retouch Complete"
                    html "Your image retouch has been completed. " //TODO add detailed email
                }

            }
            catch(e){
                println e

            }
            if (proj) {
                imageToDelete?.save(flush:true)
                imageToDelete?.delete(flush:true)
                flash.message = "Image Uploaded"
            } else {
                // myImageService.deleteImagePackage(image)
                println projectInstance.errors
                flash.message = "Upload Failed!!! Please try again"
            }
        }else{
            flash.message = "Please select an image"
        }
        redirect(action: "show",id: projectInstance.id)
    }


    @Transactional
    def addTask(){

    }

    @Secured(["ROLE_RETOUCHER"])
    def myTasks(Integer max){
        println "My tassks"
       // taskService.notifyRetouchers(Task.get(1))
        params.max = Math.min(max ?: 10, 100)
        if(!params.sort){
            params.sort = "id"
            params.order = "desc"
        }
        respond Project.findAllByAssignedTo(springSecurityService.getCurrentUser(),params), model: [projectInstanceCount: Project.countByAssignedTo(springSecurityService.getCurrentUser())]

    }


    @Secured(["ROLE_RETOUCHER"])
    def newTasks(Integer max){
        params.max = Math.min(max ?: 10, 100)
        if(!params.sort){
            params.sort = "id"
            params.order = "desc"
        }
        respond Project.findAllByAssignedTo(null,params), model: [projectInstanceCount: Project.countByAssignedTo(null)]

    }

    /*  def index(Integer max) {
          params.max = Math.min(max ?: 10, 100)
          respond Task.list(params), model: [taskInstanceCount: Task.count()]
      }*/


    @Secured(["ROLE_RETOUCHER","ROLE_ADMIN"])
    def show(Project projectInstance) {
        if(!projectInstance.assignedTo || projectInstance.assignedTo == springSecurityService.getCurrentUser()){
            respond projectInstance
        }else{
            notFound()
            return
        }

    }

    /* def create() {
         respond new Task(params)
     }*/

    /*  @Transactional
      def save(Task taskInstance) {
          if (taskInstance == null) {
              notFound()
              return
          }

          if (taskInstance.hasErrors()) {
              respond taskInstance.errors, view: 'create'
              return
          }

          taskInstance.save flush: true

          request.withFormat {
              form multipartForm {
                  flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
                  redirect taskInstance
              }
              '*' { respond taskInstance, [status: CREATED] }
          }
      }
  */
    /*def edit(Task taskInstance) {
        respond taskInstance
    }*/

    /*  @Transactional
      def update(Task taskInstance) {
          if (taskInstance == null) {
              notFound()
              return
          }

          if (taskInstance.hasErrors()) {
              respond taskInstance.errors, view: 'edit'
              return
          }

          taskInstance.save flush: true

          request.withFormat {
              form multipartForm {
                  flash.message = message(code: 'default.updated.message', args: [message(code: 'Task.label', default: 'Task'), taskInstance.id])
                  redirect taskInstance
              }
              '*' { respond taskInstance, [status: OK] }
          }
      }*/

    /* @Transactional
     def delete(Task taskInstance) {

         if (taskInstance == null) {
             notFound()
             return
         }

         taskInstance.delete flush: true

         request.withFormat {
             form multipartForm {
                 flash.message = message(code: 'default.deleted.message', args: [message(code: 'Task.label', default: 'Task'), taskInstance.id])
                 redirect action: "index", method: "GET"
             }
             '*' { render status: NO_CONTENT }
         }
     }*/

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
