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

	def register(RegisterCommand command) {

		if (command.hasErrors()) {
			render view: 'index', model: [command: command]
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

		String url = generateLink('verifyRegistration', [t: registrationCode.token])

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
	}
	