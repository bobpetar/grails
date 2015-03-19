package com.retouch

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class PublicController {

    def index() {
        def techniqueInstanceList = Technique.list()
        Set uniqueGroep = techniqueInstanceList.groep
        [techniqueInstaneList:techniqueInstanceList, uniqueGroep:uniqueGroep]
    }
}
