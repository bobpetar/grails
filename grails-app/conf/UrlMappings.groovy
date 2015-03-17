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
        "/instructions/"(controller: "project",action: "instructions")
        "/service/"(controller: "project",action: "service")
        "/instructions/$id"(controller: "project",action: "instructions")
        "/service/$id"(controller: "project",action: "service")
        "/projects"(controller: "project",action: "projects")
        "/tasks"(controller: "task",action: "myTasks")
        "/new-tasks"(controller: "task",action: "newTasks")
        "500"(view:'/error')
		"404"(view:'/404')
	}
}
