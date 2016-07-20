package com.retouch
import grails.plugin.springsecurity.annotation.Secured
import java.net.URLConnection

@Secured(['permitAll'])
class MediaController {

    def technique() { 
    	String profilePicturePath = "${grailsApplication.config.retouch.techniqueImageUploadPath}/${params.media}"
	    File file = new File(profilePicturePath)
	    if(file.exists()){
	    	// response.setHeader('Expires', '-1')
		    response.contentType = URLConnection.guessContentTypeFromName(file.getName())
		    response.outputStream << file.bytes
		    response.outputStream.flush()
		    }else{
		    	response.status = 404;
		    }
	    
	}


}
