package com.retouch

class ImageTag {
    Integer posX
    Integer posY
    Integer height
    Integer width
    String note

    static belongsTo = [task:Task]
    static constraints = {
        note(nullable:false,blank:false,maxSize: 300)
    }




}
