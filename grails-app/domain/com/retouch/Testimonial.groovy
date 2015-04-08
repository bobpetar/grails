package com.retouch

class Testimonial {

    String fullName
    String customerPosition
    String testimonial
    String userType
    String photo

    static constraints = {
        fullName(blank: false, nullable: false)
        customerPosition(blank: true, nullable: true)
        testimonial(blank: false, nullable: false, maxSize: 1000)
        userType(blank: false, nullable: false, inList: ["Retoucher", "Customer"])
        photo(blank: true, nullable: true)
    }
}
