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
      /*  def issuedCoupon = IssuedCoupon.findByProjectId(task.project.id)
        if( issuedCoupon && sumTechnique){
            couponDiscount = (sumTechnique - cashDiscount) * issuedCoupon.discountPercent / 100
        }
*/
        Double totalAmount = sumTechnique - cashDiscount //- couponDiscount

        return totalAmount
    }

    def registerEarning(Project project){

        def registeredEarning = Earning.findByProject(project)
      //  println "REGISTERING EARNING FOR "+registeredEarning
      //  println "REGISTERING EARNING FOR "+ project.assignedTo
       // println "REGISTERING EARNING FOR "+ project.status
        //TODO consider using status 'In Review' instead of 'complete'
        if(project.status=="Complete" && !registeredEarning && project.assignedTo){
            println "REGISTERING EARNING FOR "+ project.assignedTo
            def techniqueList = project.task.techniques.toList()

            //TODO Add support for multiple tasks
            def paymentItems = project.task.payment.paymentItems
            def sumTechnique =  calculateAmount(project.task)

            println sumTechnique
            def percent = retoucherEarningPercentage
            def amountEarned = (percent*sumTechnique)/100
            def earning = new Earning(project: project,amount: amountEarned,retoucher:project.assignedTo )
            earning.save(flush: true)
        }

    }




    


}
