package demo

class UrlMappings {
    static mappings = {
        // REST-style API mappings
        "/employee"(controller: 'employee', parseRequest: true) {
            action = [GET: 'index', POST: 'save']
        }
        "/employee/$id"(controller: 'employee') {
            action = [GET: 'show', PUT: 'update']
        }

        // GSP/web browser friendly routes
        "/employee/create"(controller: 'employee', action: 'create')
        "/employee/edit/$id"(controller: 'employee', action: 'edit')
        "/employee/update"(controller: 'employee', action: 'update', method: "POST")
        "/employee/deleteConfirmed"(controller: 'employee', action: 'delete', method: "POST")
        "/"(controller: "employee", action: "index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
