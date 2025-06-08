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

        "/employee/create"(controller: 'employee', action: 'create')
        "/employee/edit/$id"(controller: 'employee', action: 'edit')
        "/employee/update"(controller: 'employee', action: 'update', method: "POST")
        "/employee/deleteConfirmed"(controller: 'employee', action: 'delete', method: "POST")
        "/employeeDevice"(controller: 'employeeDeviceAssignment', parseRequest: true) {
            action = [GET: 'index', POST: 'save']
        }
        "/employeeDevice/createDevice"(controller: 'employeeDeviceAssignment', action: 'createDevice')
        "/employeeDevice/$id"(controller: 'employeeDeviceAssignment') {
            action = [GET: 'show', DELETE: 'delete']
        }

        "/"(controller: "employee", action: "index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
