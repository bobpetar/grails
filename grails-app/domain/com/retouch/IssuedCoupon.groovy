package com.retouch
import groovy.time.TimeCategory
import org.hashids.Hashids

class IssuedCoupon {

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
            def nextId  = (lastIssue ? lastIssue.id:0) + 1
            // registeredDate = new Date()
            code = "1HR-"+generateCouponCode(nextId)+ nextId
            println "CODE:::"  + code
            dateIssued = new Date()
        }
    }

    def generateCouponCode(input){
        Hashids hashids = new Hashids("1HR-RETOUCH-SALT",5);
        return  hashids.encode(input);
    }
}
