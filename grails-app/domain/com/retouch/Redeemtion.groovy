package com.retouch

class Redeemtion {
    Date createdDate
    BigDecimal amount
    User retoucher
    String status

    static constraints = {
    }

    def beforeValidate() {
        if (id == null) {
            createdDate = new Date()
        }
    }
}
