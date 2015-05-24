package com.retouch

class Earning {
    Date createdDate
    BigDecimal amount
    Project project
    User retoucher

    static constraints = {
        project(unique:true)
    }

    def beforeValidate() {
        if (id == null) {
            createdDate = new Date()
        }
    }
}
