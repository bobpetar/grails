import com.retouch.Role
import com.retouch.User
import com.retouch.UserRole;

class BootStrap {

    def init = { servletContext ->
        def users = User.count()
        if (users == 0) {
            def adminRole = Role.findByAuthority('ROLE_ADMIN')
            if (!adminRole) {
                adminRole = new Role(authority: 'ROLE_ADMIN')
                adminRole.save(flush: true)
            }
            def userRole = Role.findByAuthority('ROLE_USER')
            if (!userRole) {
                userRole = new Role(authority: 'ROLE_USER')
                userRole.save(flush: true)
            }
            def retoucherRole = Role.findByAuthority('ROLE_RETOUCHER')
            if (!retoucherRole) {
                retoucherRole = new Role(authority: 'ROLE_RETOUCHER')
                retoucherRole.save(flush: true)
            }

        }

        try {
            def adminUser = new User(username: 'admin', password: 'admin', email: "admin@1hretouch.com", firstname: 'Admin', lastname: 'LastName')
            def retoucher = new User(username: 'retoucher', password: 'retoucher', email: "retoucher@1hretouch.com", firstname: 'Retoucher', lastname: 'LastName')
            def customer = new User(username: 'customer', password: 'customer', email: "customer@1hretouch.com", firstname: 'Customer', lastname: 'LastName')
            def adminRole = Role.findByAuthority('ROLE_ADMIN')
            def retoucherRole = Role.findByAuthority('ROLE_RETOUCHER')
            def customerRole = Role.findByAuthority('ROLE_USER')
            if (adminUser.save(flush: true)) {
                UserRole.create adminUser, adminRole, true
            }
            if (retoucher.save(flush: true)) {
                UserRole.create retoucher, retoucherRole, true
            }
            if (customer.save(flush: true)) {
                UserRole.create customer, customerRole, true
            }
        }
        catch (e) {
            println(e)
        }
    }

    def destroy = {
    }
}
