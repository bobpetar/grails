package com.retouch

class Technique {
    String name
    String description
    String groep
	String beforeafterimage

    static constraints = {
        name(unique:true,nullable:false,blank:false)
        description(nullable:false,blank:false, maxSize: 1000)
        groep(nullable:true,blank:true, matches: "[a-zA-Z]+")
		beforeafterimage(nullable:true, blank:true)
    }
}
