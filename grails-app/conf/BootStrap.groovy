import com.retouch.Role
import com.retouch.SiteParams
import com.retouch.User
import com.retouch.UserRole;

class BootStrap {

    def init = { servletContext ->
//        setPropertiesData()
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

        if(SiteParams.count()==0){
            new SiteParams(parameterName: 'FACEBOOK', parameterValue: 'http://www.facebook.com/1hretouch').save(flush: true)
            new SiteParams(parameterName: 'TWITTER', parameterValue: 'http://www.twitter.com/1hretouch').save(flush: true)
            new SiteParams(parameterName: 'LINKEDIN', parameterValue: 'http://www.linkedin.com/1hretouch').save(flush: true)
            new SiteParams(parameterName: 'MAXAMOUNT', parameterValue: '10').save(flush: true)
            new SiteParams(parameterName: 'PHONENUMBER', parameterValue: '0031 (0)622752205').save(flush: true)
            new SiteParams(parameterName: 'COPYRIGHT', parameterValue: '© Copyright 2015. All Rights Reserved.').save(flush: true)
            new SiteParams(parameterName: 'EMAIL', parameterValue: 'info@1hretouch.com').save(flush: true)
            new SiteParams(parameterName: 'ADDRESS1', parameterValue: 'Kanaalpark 157').save(flush: true)
            new SiteParams(parameterName: 'ADDRESS2', parameterValue: '2321 JW Leiden').save(flush: true)
            new SiteParams(parameterName: 'ABOUTUS', parameterValue: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.').save(flush: true)
            new SiteParams(parameterName: 'VIDEOCONTENT1', parameterValue: 'DO YOU NEED A NEW').save(flush: true)
            new SiteParams(parameterName: 'VIDEOCONTENT2', parameterValue: 'WEB DESIGN?').save(flush: true)
            new SiteParams(parameterName: 'VIDEOCONTENT3', parameterValue: 'Parameter Value Check out our options and features.').save(flush: true)
        }
    }

    def destroy = {
    }

    void setPropertiesData()
    {
        String key="city"
        String value="delhi"
        String propertyFileName="sdk_config.properties"
        File file = new File(propertyFileName)
        Properties prop = new Properties();
        try
        {
            prop.setProperty(key, value);
            prop.store(new FileOutputStream(file), null);
            log.debug"key:"+key+" has value:"+value+" in "+propertyFileName
        }
        catch (IOException e)
        {
            log.debug"exception occured while saving properties file :"+e
        }
    }
}
