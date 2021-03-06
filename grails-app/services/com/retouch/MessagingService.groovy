package com.retouch

import grails.transaction.Transactional

@Transactional
class MessagingService {
    def mailService

    def sendMessageMail(Comment comment,User sender) {
        try{

            def receiver
            if(comment.role=="RETOUCHER"){
                receiver = comment.task.project.client.email
            }else{
                receiver = comment.task.project.assignedTo.email
            }
            if(comment){
                mailService.sendMail {
                    async true
                    to receiver
                    subject "New Message from ${sender.username} at 1Hr Retouch"
                    html "${comment.message} <br><br>"

                }
            }
        }catch(e){
            log.error(e)
        }
    }

    def sendApprovedMessage(task){
        try{
            if(task){
                def receiver = task.project.assignedTo.email
                mailService.sendMail {
                    async true
                    to receiver
                    subject "Great job! your retouch was approved"
                    html "Great job! your retouch was approved. <br><br>"
                }
            }
        }catch(e){
            log.error(e)
        }
    }
}
