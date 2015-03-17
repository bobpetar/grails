package com.retouch

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class TaskService {

    def mailService

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
        try{
            if(recoucherRole){
                def retouchers = UserRole.findAllByRole(recoucherRole).user
                println retouchers
                mailService.sendMail {
                    bcc retouchers.email.toArray()
                    subject "New Task"
                    html "New retouch task is available. " //TODO add detailed email
                }

            }


        }catch(e){
            log.error(e)
        }
    }
}
