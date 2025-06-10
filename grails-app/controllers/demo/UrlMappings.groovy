package demo

class UrlMappings {
    static mappings = {
        "/employee"(controller: 'employee', action: 'index')
        "/employee/create"(controller: 'employee', action: 'create')
        "/employee/save"(controller: 'employee', action: 'save')
        "/employee/edit/$id"(controller: 'employee', action: 'edit')
        "/employee/update/$id"(controller: 'employee', action: 'update')
        "/employee/delete/$id"(controller: 'employee', action: 'delete')
        "/"(controller: 'employee', action: 'index')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
