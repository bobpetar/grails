package com.retouch
import org.grails.paypal.Payment

class Task {
    ReImage finalImage
    ReImage originalImage
    Payment payment
    boolean paymentCompleted = false

    static hasMany = [tags:ImageTag,techniques:Technique]
    static belongsTo = [project:Project]


    static constraints = {
        finalImage(nullable:true,blank:true)
    }
}
