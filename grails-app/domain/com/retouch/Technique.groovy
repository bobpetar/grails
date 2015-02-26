package com.retouch

class Technique {
    String name
    String description

    static constraints = {
        name(nullable:false,blank:false)
        description(nullable:false,blank:false)
    }
}
