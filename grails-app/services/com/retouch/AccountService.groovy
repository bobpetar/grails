package com.retouch

import grails.transaction.Transactional

@Transactional
class AccountService {

    def paypalService
    final BigDecimal REDEEM_LIMIT = 10
    BigDecimal getTotalEarned(User retoucher) {

        def c = Earning.createCriteria()
        def results = c.list {
            eq("retoucher", retoucher)
            projections {
                sum('amount')
            }
        }
        return results[0]
    }

    def getTotalProjectsCompleted(User retoucher){
        def count  = Project.countByAssignedToAndStatus(retoucher,"Complete")
        return count
    }

    BigDecimal getTotalRedeemed(User retoucher) {

        def c = Redeemtion.createCriteria()
        def results = c.list {
            eq("retoucher", retoucher)
            projections {
                sum('amount')
            }
        }
        println "REBEEEMMMEEEPTION + "  + results
        if(results[0]){
            return results[0]
        }else{
            0.0 as BigDecimal
        }
    }


    BigDecimal getAvailableBalance(User retoucher) {
        BigDecimal earned = getTotalEarned(retoucher)
        BigDecimal redeemed = getTotalRedeemed(retoucher)
        return earned - redeemed
    }

    def redeemAmount(User retoucher, BigDecimal amount){
        def balance = getAvailableBalance(retoucher)
        if(amount<=balance && amount>=REDEEM_LIMIT){
            def redemptionID = Redeemtion.generateRedeemId(retoucher)
            def red  = new Redeemtion(redeemId:redemptionID ,status:"Pending",retoucher:retoucher,amount:amount,createdDate: new Date())
            red.save(flush:true)
            Redeemtion redSaved = Redeemtion.findByRedeemId(redemptionID);
            paypalService.issueRetoucherPayout(redSaved)
            return true
        }else{
            return null
        }

    }

    def getRedeemLimit(){
        return REDEEM_LIMIT
    }


}
