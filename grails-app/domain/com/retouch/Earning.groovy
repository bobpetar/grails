package com.retouch

class Earning {
    Date createdDate
    BigDecimal amount
    Project project
    User retoucher

    static constraints = {
    }

    def beforeValidate() {
        if (id == null) {
            createdDate = new Date()
        }
    }
}
