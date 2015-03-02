package com.retouch

class Task {
    ReImage finalImage
    ReImage originalImage

    static hasMany = [tags:ImageTag,techniques:Technique]
    static belongsTo = [project:Project]


    static constraints = {
        finalImage(nullable:true,blank:true)
    }
}
