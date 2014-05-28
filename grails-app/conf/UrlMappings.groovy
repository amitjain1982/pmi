class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }
        "/$controller/update"{
            
        }



        "/"(view:"/index")
        "500"(view:'/error')
        "/success"(controller: 'test', action: 'success')
        "/testMail"(controller: 'test', action: 'testMail')

	}
}
