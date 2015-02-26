class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
		"/examples"(view:"/examples")
		"/faq"(view:"/faq")
		"/pricing"(view:'/pricing')
        "/upload/"(controller: "project",action: "upload")
        "/instructions/"(controller: "project",action: "upload")
        "/projects"(controller: "project",action: "projects")
        "500"(view:'/error')
		"404"(view:'/404')
	}
}
