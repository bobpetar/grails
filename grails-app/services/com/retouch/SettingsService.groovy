package com.retouch

import grails.transaction.Transactional

@Transactional
class SettingsService {

    boolean isInTestMode() {
        def test = SiteParams.findByParameterName('TEST-MODE')
        return test && test.parameterValue.toLowerCase() == "on"
    }

    def getTestMailRetouchers(){
        return ["aasizvaidya+1hretoucher@gmail.com","sachit.nep+1hretoucher@gmail.com","abhinav.regmi+1hretoucher@gmail.com"]
    }

    def getTestMailCustomer(){
        return ["aasizvaidya+1hCustomer@gmail.com","sachit.nep+1hCustomer@gmail.com","abhinav.regmi+1hCustomer@gmail.com"]
    }


}
