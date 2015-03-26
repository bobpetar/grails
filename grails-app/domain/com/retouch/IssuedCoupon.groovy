package com.retouch
import groovy.time.TimeCategory

class IssuedCoupon {

    def hashGeneratorService
    String code
    String projectId
    String couponName
    Integer discountPercent
    Date dateIssued
    Date expiresOn
    User user

    static constraints = {
        code(nullable: false,blank: false,unique: true)
        discountPercent(nullable: false,blank: false)
        expiresOn(nullable: true,blank: true)
        projectId(nullable: true,blank: true)

    }

    public IssuedCoupon(Coupon couponTemplate,User user){
        this.code = code
        this.discountPercent = couponTemplate.discountPercent
        this.couponName = couponTemplate.name
        this.user = user
        use(TimeCategory) {
            this.expiresOn = (new Date()) + couponTemplate.daysValid.days
        }

    }

    def beforeInsert(){

    }

    def beforeValidate() {
        if (id == null) {
            def lastIssue = last()
            def nextId  = lastIssue.id + 1
            // registeredDate = new Date()
            code = "1HR-"+hashGeneratorService.generateUniqueCode(nextId)+ nextId
            dateIssued = new Date()
        }
    }
}
