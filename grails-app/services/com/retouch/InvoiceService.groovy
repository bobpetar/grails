package com.retouch

import grails.transaction.Transactional

@Transactional
class InvoiceService {
    int retoucherEarningPercentage = 90

    Double calculateAmount(Task task) {

        def sumTechnique = task.techniques.ratePerTechnique.sum()

        if(!sumTechnique){
            return
        }

        def maxamount =  getMaxDiscountLimit()

        def cashDiscount = 0.0
        if(sumTechnique>maxamount){
            cashDiscount = sumTechnique - maxamount
        }



        //Coupon discount moved to paypal countroller
      /*
      def couponDiscount = 0.0
      def issuedCoupon = IssuedCoupon.findByProjectId(task.project.id)
        if( issuedCoupon && sumTechnique){
            couponDiscount = (sumTechnique - cashDiscount) * issuedCoupon.discountPercent / 100
        }
*/
        Double totalAmount = sumTechnique - cashDiscount //- couponDiscount

        return totalAmount
    }


    Double calculateCouponDiscountedAmount(Task task) {
        def amount =  calculateAmount(task)
        def couponDiscountedAmt = 0.0
        def issuedCoupon = IssuedCoupon.findByProjectId(task.project.id)
        if( issuedCoupon && amount>0){
            couponDiscountedAmt = amount - ((amount) * issuedCoupon.discountPercent / 100)
        }
    }

    def getMaxDiscountLimit(){
        def maxamount

        if(!SiteParams.findByParameterName('MAXAMOUNT')){
            maxamount=10.0
        } else{
            maxamount=Double.valueOf(SiteParams.findByParameterName('MAXAMOUNT').parameterValue)
        }
        return maxamount
    }



    def registerEarning(Project project){

        def registeredEarning = Earning.findByProject(project)
      //  println "REGISTERING EARNING FOR "+registeredEarning
      //  println "REGISTERING EARNING FOR "+ project.assignedTo
       // println "REGISTERING EARNING FOR "+ project.status
        //TODO consider using status 'In Review' instead of 'complete'
        if(project.status=="Complete" && !registeredEarning && project.assignedTo){
            println "REGISTERING EARNING FOR "+ project.assignedTo
            //def techniqueList = project.task.techniques.toList()

            //TODO Add support for multiple tasks
           // def paymentItems = project.task.payment.paymentItems

            //Proposition 1
           // def sumTechnique =  calculateCouponDiscountedAmount(project.task)


            //Proposition 2
            def sumTechnique = calculateAmount(project.task)

            //End of proposition 2

            println sumTechnique
            def percent = retoucherEarningPercentage
            def amountEarned = (percent*sumTechnique)/100
            def earning = new Earning(project: project,amount: amountEarned,retoucher:project.assignedTo )
            earning.save(flush: true)
        }

    }




    


}
