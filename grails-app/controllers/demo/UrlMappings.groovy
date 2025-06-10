package demo

class UrlMappings {
    static mappings = {
        "/employee"(controller: 'employee', action: 'index')
        "/employee/create"(controller: 'employee', action: 'create')
        "/employee/save"(controller: 'employee', action: 'save')
        "/employee/edit/$id"(controller: 'employee', action: 'edit')
        "/employee/update/$id"(controller: 'employee', action: 'update')
        "/employee/delete/$id"(controller: 'employee', action: 'delete')
        "/employee/pieChart"(controller: 'employee', action: 'pieChart')
        "/employee/exportExcel"(controller: 'employee', action: 'exportExcel')
        "/register"(controller: "user", action: "register")
        "/login"(controller: "user", action: "login")
        "/logout"(controller: "user", action: "logout")
        "/doLogin"(controller: "user", action: "doLogin")
        "/saveRegister"(controller: "user", action: "saveRegister")
        "/"(controller: 'employee', action: 'index')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
