package com.retouch

import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class TaskService {

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

    }
}
