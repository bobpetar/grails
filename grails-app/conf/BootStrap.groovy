import com.retouch.Role
import com.retouch.User
import com.retouch.UserRole;

class BootStrap {

    def init = { servletContext ->
		def users = User.count()
		if(users==0){
			def adminRole = Role.findByAuthority('ROLE_ADMIN')
            println adminRole
            if(!adminRole){
                adminRole = new	Role(authority:'ROLE_ADMIN')
                adminRole.save(flush:true)
            }
			def adminUser = new User(username: 'admin', password: 'admin',email: "test@test.com")
			println adminUser.save(flush:true)
            println adminUser.errors
			UserRole.create adminUser, adminRole, true
		}
    }
    def destroy = {
    }
}
