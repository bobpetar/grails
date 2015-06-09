package com.retouch

class User {

	transient springSecurityService

	String username
	String password
	String email
	String firstname
	String lastname
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
    String paypalAccount

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email blank:false, email:true
		firstname blank:false
		lastname blank:false
        paypalAccount nullable:true, blank:true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

    def beforeValidate(){
        if(!username || username==""){
            username = email
        }
    }

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

    String toString(){
        return username
    }

    public String getFirstname(){
        return firstname
    }

    public String getLastname(){
        return lastname
    }
}
