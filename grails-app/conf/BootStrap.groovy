import com.retouch.Role
import com.retouch.User
import com.retouch.UserRole;

class BootStrap {

    def init = { servletContext ->
		def checkuser = Role.findByAuthority('ROLE_ADMIN')
		if(!checkuser){
			def adminRole = new	Role(authority:'ROLE_ADMIN')
			adminRole.save(flush:true)
			def adminUser = new User(username: 'admin', password: 'admin')
			adminUser.save(flush:true)		
			UserRole.create adminUser, adminRole, true
		}		
    }
    def destroy = {
    }
}
