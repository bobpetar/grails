package com.retouch

import grails.transaction.Transactional

@Transactional
class InvoiceService {

    Double calculateAmount(Task task) {

        def sumTechnique = task.techniques.ratePerTechnique.sum()

        if(!sumTechnique){
            return
        }

        def maxamount

        if(!SiteParams.findByParameterName('MAXAMOUNT')){
            maxamount=10.0
        } else{
            maxamount=Double.valueOf(SiteParams.findByParameterName('MAXAMOUNT').parameterValue)
        }

        def cashDiscount = 0.0
        if(sumTechnique>maxamount){
            cashDiscount = sumTechnique - maxamount
        }

        def couponDiscount = 0.0
        if(IssuedCoupon.findByProjectId(task.project.id)  && sumTechnique){
            couponDiscount = (sumTechnique - cashDiscount) * IssuedCoupon.findByProjectId(task.project.id).discountPercent / 100
        }

        Double totalAmount = sumTechnique - cashDiscount - couponDiscount

        return totalAmount
    }
}
