package com.retouch

class Coupon {
    boolean active = true
    String name
    Integer discountPercent
    Integer daysValid = 30

    static constraints = {
        discountPercent(min:1,max:100)
    }
}
