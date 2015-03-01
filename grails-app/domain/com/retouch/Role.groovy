package com.retouch

import com.sun.org.apache.bcel.internal.generic.RETURN;

class Role {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	String toString(){
		return (authority ?: "")
	}
}
