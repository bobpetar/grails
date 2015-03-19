package com.retouch

import grails.plugin.springsecurity.annotation.Secured
@Secured(['permitAll'])

class PublicController {

    def index() { }
}
