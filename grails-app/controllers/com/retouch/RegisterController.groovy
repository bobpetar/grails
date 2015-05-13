package com.retouch

import grails.plugin.springsecurity.ui.*

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import groovy.text.SimpleTemplateEngine


class RegisterController extends grails.plugin.springsecurity.ui.RegisterController {

    def index() {
        def copy = [:] + (flash.chainedParams ?: [:])
        copy.remove 'controller'
        copy.remove 'action'
        [command: new RegisterCommand(copy)]
    }

    def retoucher() {
        def copy = [:] + (flash.chainedParams ?: [:])
        copy.remove 'controller'
        copy.remove 'action'
        [command: new RegisterCommand(copy)]
    }

    def register(RegisterCommand command) {
        command.username = command.email
        command.validate()
        if (command.hasErrors()) {
            if(params.retoucher){
                render view: 'retoucher', model: [command: command]
            } else {
                render view: 'index', model: [command: command]
            }
            return
        }

        String salt = saltSource instanceof NullSaltSource ? null : command.username
        def user = lookupUserClass().newInstance(email: command.email, username: command.username,
                accountLocked: true, firstname:command.firstname, lastname:command.lastname, enabled: true)

        RegistrationCode registrationCode = springSecurityUiService.register(user, command.password, salt)
        if (registrationCode == null || registrationCode.hasErrors()) {
            // null means problem creating the user
            flash.error = message(code: 'spring.security.ui.register.miscError')
            flash.chainedParams = params
            redirect action: 'index'
            return
        }

        println(params)

        String url

        if(params.retoucher){
            url = generateLink('verifyRegistration', [t: registrationCode.token, r:'true'])
        } else {
            url = generateLink('verifyRegistration', [t: registrationCode.token])
        }

        println("url " + url)

        def conf = SpringSecurityUtils.securityConfig
        def body = conf.ui.register.emailBody
        if (body.contains('$')) {
            body = evaluate(body, [user: user, url: url])
        }
        mailService.sendMail {
            to command.email
            from conf.ui.register.emailFrom
            subject conf.ui.register.emailSubject
            html body.toString()
        }
        render view: 'index', model: [emailSent: true]
    }

    def verifyRegistration() {

        def conf = SpringSecurityUtils.securityConfig
        String defaultTargetUrl = conf.successHandler.defaultTargetUrl

        String token = params.t
        String retoucherFlag = params.r

        def registrationCode = token ? RegistrationCode.findByToken(token) : null
        if (!registrationCode) {
            flash.error = message(code: 'spring.security.ui.register.badCode')
            redirect uri: defaultTargetUrl
            return
        }

        def user
        // TODO to ui service
        RegistrationCode.withTransaction { status ->
            String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName
            user = lookupUserClass().findWhere((usernameFieldName): registrationCode.username)
            if (!user) {
                return
            }
            user.accountLocked = false
            user.save(flush:true)
            def UserRole = lookupUserRoleClass()
            def Role = lookupRoleClass()

            if(retoucherFlag){
                UserRole.create user, Role.findByAuthority('ROLE_RETOUCHER')
            } else {
                for (roleName in conf.ui.register.defaultRoleNames) {
                    UserRole.create user, Role.findByAuthority(roleName)
                }
            }

            registrationCode.delete()
        }

        if (!user) {
            flash.error = message(code: 'spring.security.ui.register.badCode')
            redirect uri: defaultTargetUrl
            return
        }

        springSecurityService.reauthenticate user.username

        flash.message = message(code: 'spring.security.ui.register.complete')
        redirect uri: conf.ui.register.postRegisterUrl ?: defaultTargetUrl
    }
}

class RegisterCommand {

    String username
    String email
    String password
    String password2
    String firstname
    String lastname
    def grailsApplication

    static constraints = {
        username blank: false, validator: { value, command ->
            if (value) {
                def User = command.grailsApplication.getDomainClass(
                        SpringSecurityUtils.securityConfig.userLookup.userDomainClassName).clazz
                if (User.findByUsername(value)) {
                    return 'registerCommand.username.unique'
                }
            }
        }
        email blank: false, email: true
        password blank: false, validator: RegisterController.passwordValidator
        password2 validator: RegisterController.password2Validator
    }

    def beforeValidate(){
        if(!username || username==""){
            username = email
        }
    }
}
	