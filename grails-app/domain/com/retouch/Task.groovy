package com.retouch
import org.grails.paypal.Payment

class Task {
    ReImage finalImage
    ReImage originalImage
    Payment payment

    static hasMany = [tags:ImageTag,techniques:Technique, comments:Comment]
    static belongsTo = [project:Project]


    static constraints = {
        finalImage(nullable:true,blank:true)
        payment(nullable: true, blank:true)
    }
}
