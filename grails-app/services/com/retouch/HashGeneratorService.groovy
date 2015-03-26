package com.retouch

import org.hashids.Hashids




class HashGeneratorService {

    def grailsApplication

    def generateUniqueCode(input) {
        Hashids hashids = new Hashids(grailsApplication.config.salt);
        println grailsApplication.config.salt
        return  hashids.encode(input);
    }
}
