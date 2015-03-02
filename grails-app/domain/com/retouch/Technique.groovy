package com.retouch

class Technique {
    String name
    String description
    String groep

    static constraints = {
        name(unique:true,nullable:false,blank:false)
        description(nullable:false,blank:false)
        groep(nullable:true,blank:true)
    }

    String toString(){
        return name
    }
}
