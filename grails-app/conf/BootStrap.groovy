import com.retouch.Role
import com.retouch.User
import com.retouch.UserRole;

class BootStrap {

    def init = { servletContext ->
		def users = User.count()
		if(users==0){
			def adminRole = Role.findByAuthority('ROLE_ADMIN')
            if(!adminRole){
                adminRole = new	Role(authority:'ROLE_ADMIN')
                adminRole.save(flush:true)
            }
			def userRole = Role.findByAuthority('ROLE_USER')
			if(!userRole){
				userRole = new	Role(authority:'ROLE_USER')
				userRole.save(flush:true)
			}
			def retoucherRole = Role.findByAuthority('ROLE_RETOUCHER')
			if(!retoucherRole){
				retoucherRole = new	Role(authority:'ROLE_RETOUCHER')
				retoucherRole.save(flush:true)
			}
			def adminUser = new User(username: 'admin', password: 'admin',email: "test@test.com", firstname:'Sachit', lastname:'Pandey')
			println adminUser.save(flush:true)
            println adminUser.errors
			UserRole.create adminUser, adminRole, true
		}
    }
    def destroy = {
    }
}
