package com.retouch

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class PublicController {

    def index() {
        def Random randomGenerator = new Random()
        int videoNumber = randomGenerator.nextInt(5)
        def techniqueInstanceList = Technique.list()
        Set uniqueGroep = techniqueInstanceList.groep
        [techniqueInstaneList:techniqueInstanceList, uniqueGroep:uniqueGroep,videoNumber:videoNumber]
    }
}
