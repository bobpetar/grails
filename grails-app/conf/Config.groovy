import liquibase.util.SystemUtils

// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
        if(SystemUtils.IS_OS_LINUX){
            retouch.imageUploadPath = "/opt/lampp/htdocs/retouch/"
            retouch.techniqueImageUploadPath = "/opt/lampp/htdocs/retouch/techniques/"
        } else {
            retouch.imageUploadPath = "C:\\wamp\\www\\retouch\\"
            retouch.techniqueImageUploadPath = "C:\\wamp\\www\\retouch\\techniques\\"
        }
        retouch.imageServer= "http://localhost/retouch/"
        retouch.techniqueImageServer= "http://localhost/retouch/techniques/"
        salt = "1HR-RETOUCH-SALT"
        grails.paypal.server="https://www.sandbox.paypal.com/cgi-bin/webscr"
        grails.paypal.email="sachit.nep-facilitator@gmail.com"
        grails.serverURL = "http://localhost:8080/retouch"
        //TODO Move paypal secrets to somewhere safe
        retouch.paypal.clientID="AcExlqqd0YbAMJ_yZdUmo30B4ms-kRG8TrfA08Gslf4Bdo92muBYd9BsGQsOsvVM1rUXBJoigOR66bTj"
        retouch.paypal.clientSecret="EEbyTTKJYdbBO9FSwkKo2xYVeZLSjYCxjiskMJodksR4VnIYUtCXtzVxjoal7IzW5Tjk7QqIVBl9XhEP"
        grails.config.locations = ["classpath:sdk_config_qa.properties"]
    }
    production {
        grails.logging.jul.usebridge = false
        retouch.imageUploadPath = "/home/admin/web/1hretouch.com/public_html/retouch/"
        retouch.techniqueImageUploadPath = "/home/admin/web/1hretouch.com/public_html/retouch/techniques/"
        retouch.imageServer= "http://1hretouch.com/retouch/"
        retouch.techniqueImageServer= "http://1hretouch.com/retouch/techniques/"
        grails.paypal.server="https://www.sandbox.paypal.com/cgi-bin/webscr"
        grails.paypal.email="sachit.nep-facilitator@gmail.com"
        grails.serverURL = "http://1hretouch.com"
        //TODO Move paypal secrets to somewhere safe
        retouch.paypal.clientID="AcExlqqd0YbAMJ_yZdUmo30B4ms-kRG8TrfA08Gslf4Bdo92muBYd9BsGQsOsvVM1rUXBJoigOR66bTj"
        retouch.paypal.clientSecret="EEbyTTKJYdbBO9FSwkKo2xYVeZLSjYCxjiskMJodksR4VnIYUtCXtzVxjoal7IzW5Tjk7QqIVBl9XhEP"
        grails.config.locations = ["classpath:sdk_config_qa.properties"]
    }
    qa {
        grails.logging.jul.usebridge = false
        retouch.imageUploadPath = "/home/admin/web/1hretouch.com/public_html/retouch/"
        retouch.techniqueImageUploadPath = "/home/admin/web/1hretouch.com/public_html/retouch/techniques/"
        retouch.imageServer= "http://qa.1hretouch.com/retouch/"
        retouch.techniqueImageServer= "http://qa.1hretouch.com/retouch/techniques/"
        grails.paypal.server="https://www.sandbox.paypal.com/cgi-bin/webscr"
        grails.paypal.email="sachit.nep-facilitator@gmail.com"
        grails.serverURL = "http://qa.1hretouch.com"
        //TODO Move paypal secrets to somewhere safe
        retouch.paypal.clientID="AcExlqqd0YbAMJ_yZdUmo30B4ms-kRG8TrfA08Gslf4Bdo92muBYd9BsGQsOsvVM1rUXBJoigOR66bTj"
        retouch.paypal.clientSecret="EEbyTTKJYdbBO9FSwkKo2xYVeZLSjYCxjiskMJodksR4VnIYUtCXtzVxjoal7IzW5Tjk7QqIVBl9XhEP"
        grails.config.locations = ["classpath:sdk_config_qa.properties"]
    }
}

// log4j configuration
log4j.main = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

//For spring sec email
grails.plugin.springsecurity.ui.register.emailFrom = 'info@1hretouch.com'
grails.plugin.springsecurity.ui.forgotPassword.emailFrom = 'info@1hretouch.com'
// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.password.bcrypt.logrounds = 15
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.retouch.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.retouch.UserRole'
grails.plugin.springsecurity.authority.className = 'com.retouch.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	'/':                              ['permitAll'],
	'/index':                         ['permitAll'],
    '/public/index':                  ['permitAll'],
	'/register/**':                   ['permitAll'],
	'/index.gsp':                     ['permitAll'],
	'/examples':                  ['permitAll'],
	'/pricing':                   ['permitAll'],
	'/faq':                       ['permitAll'],
	'/assets/**':                     ['permitAll'],
	'/**/js/**':                      ['permitAll'],
	'/**/css/**':                     ['permitAll'],
	'/**/images/**':                  ['permitAll'],
	'/**/favicon.ico':                ['permitAll'],
	'/**/**':						  ['ROLE_ADMIN'],
	'/user/show/**':				  ['ROLE_ADMIN', 'ROLE_USER', 'ROLE_RETOUCHER'],
	'/user/edit/**':				  ['ROLE_ADMIN', 'ROLE_USER', 'ROLE_RETOUCHER'],
    '/user/update/**':				  ['ROLE_ADMIN', 'ROLE_USER', 'ROLE_RETOUCHER'],
    '/paypal/**':                     ['ROLE_USER'],
    '/paypal/notifyPaypal':           ['permitAll'],
	'/project/myTasks':				  ['ROLE_RETOUCHER'],
]


grails.plugin.springsecurity.ui.register.emailBody = '''\
Hi $user.firstname,<br/>
<br/>
Thank you for choosing 1Hretouch. Your registration is almost complete.
click&nbsp;<a href="$url">here</a> to finish your registration and upload your first Image.
<br/><br/>
If you need any support call 0031622752205 or use the chat function on our website.
<br/><br/>
Regards,
<br/>
Support Team 1hretouch
'''


grails.plugin.springsecurity.ui.register.emailBodyRetoucher = '''\
Hi $user.firstname,<br/>
<br/>
Thank you for choosing 1Hretouch. Your registration is almost complete.
click&nbsp;<a href="$url">here</a> to finish your registration and start retouching.
<br/><br/>
If you need any support call 0031622752205.
<br/><br/>
Regards,
<br/>
Support Team 1hretouch
'''

//grails {
//	mail {
//		host = "smtp.gmail.com"
//		port = 465
//		username = "retouch.null@gmail.com"
//		password = "iam@codeharmony"
//		props = ["mail.smtp.auth":"true",
//				"mail.smtp.socketFactory.port":"465",
//				"mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
//				"mail.smtp.socketFactory.fallback":"false"]
//	}
//}

grails {
    mail {
        host = "smtp.office365.com"
        port = 587
        username = "info@1hretouch.com"
        password = "Wachtwoord1!"
        props = ["mail.smtp.starttls.enable":"true",
                 "mail.smtp.port":"587"]
    }
}



grails.mail.default.from = "1hRetouch <info@1hretouch.com>"
grails.plugins.remotepagination.enableBootstrap=true


imageUpload {
    temporaryFile = '/tmp/uploaded.file' // Path to where files will be uploaded
}
retouch.supportedFormats = ['.jpeg', '.jpg','.png',".3fr",".ari", ".arw",".bay",".crw", ".cr2",".cap",".dcs", ".dcr", ".dng",".drf",".eip", ".erf",".fff",".iiq",".k25", ".kdc",".mdc", ".mef", ".mos", ".mrw",".nef", ".nrw",
                            ".obm", ".orf",".pef", ".ptx", ".pxn",".r3d", ".raf", ".raw", ".rwl", ".rw2", ".rwz",".sr2", ".srf", ".srw",".tif",".x3f"]
//TODO Test all raw format
//TESTED FORMATS : jpeg, jpg, nef