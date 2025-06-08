package demo

class EmployeeController {

    EmployeeService employeeService

    static responseFormats = ['json']

    def index() {
        def employeeList = employeeService.getEmployeeList()
        if (request.format == 'json') {
            respond employeeList
        } else {
            render view: 'index', model: [employeeList: employeeList]
        }
    }

    def show(Long id) {
        def emp = employeeService.getEmployeeById(id)
        if (emp) {
            respond emp
        } else {
            render status: 404
        }
    }

    def create() {
        render view: 'create'
    }

    def save() {
        def emp

        if (request.format == 'json' || request.JSON) {
            emp = new Employee(request.JSON)
        } else {
            emp = new Employee(params)
        }

        if (emp.validate()) {
            employeeService.saveEmployee(emp)
            if (request.format == 'json') {
                respond emp
            } else {
                redirect action: 'index'
            }
        } else {
            if (request.format == 'json') {
                respond emp.errors, status: 400
            } else {
                render view: 'create', model: [employee: emp]
            }
        }
    }

    def edit(Long id) {
        def emp = employeeService.getEmployeeById(id)
        if (emp) {
            render view: 'edit', model: [employee: emp]
        } else {
            render status: 404
        }
    }

    def update() {
        Long id = params.long('id')
        Employee emp = employeeService.getEmployeeById(id)

        if (emp == null) {
            response.status = 404
            return
        }

        emp.name = params.get('name')
        emp.email = params.get('email')
        emp.department = params.get('department')

        if (emp.validate()) {
            employeeService.saveEmployee(emp)
            if (request.format == 'json') {
                respond emp
            } else {
                redirect action: 'index'
            }
        } else {
            if (request.format == 'json') {
                respond emp.errors, status: 400
            } else {
                render view: 'edit', model: [employee: emp]
            }
        }
    }


    def delete() {
        Long id = params.long('id')
        println "Attempting to delete employee with ID: $id"

        if (!id) {
            flash.message = "Invalid employee ID."
            redirect action: 'index'
            return
        }

        boolean deleted = employeeService.deleteEmployee(id)

        if (deleted) {
            flash.message = "Employee deleted successfully."
        } else {
            flash.message = "Employee not found or could not be deleted."
        }

        redirect action: 'index'
    }

}

