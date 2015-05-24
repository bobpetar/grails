package com.retouch

import grails.transaction.Transactional

@Transactional
class AccountService {

    def getTotalEarned(User retoucher) {

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
}
