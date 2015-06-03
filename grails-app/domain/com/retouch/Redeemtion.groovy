package com.retouch

class Redeemtion {
    Date createdDate
    BigDecimal amount
    User retoucher
    String status
    String redeemId

    static constraints = {
        redeemId(unique: true)
    }

    def beforeValidate() {
        if (id == null) {
            createdDate = new Date()
        }
    }

    static String generateRedeemId(User retoucher){
        "1HR-R"+retoucher.id+""+(new Date()).time.toString()
    }
}
