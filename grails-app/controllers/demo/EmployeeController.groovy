package demo

class EmployeeController {

    EmployeeService employeeService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        def employeeList = employeeService.listAll()
        render view: 'index', model: [employeeList: employeeList]
    }

    def create() {
        render view: 'create', model: [
                employee: new Employee(),
                departmentList: Department.list(),
                deviceList: Device.list()
        ]
    }

    def save() {
        // Remove the department param so Grails doesn't try to use it
        def cleanParams = params.findAll { it.key != 'department' }
        def employee = new Employee(cleanParams)
        def dept = Department.findByName(params.department)  // Look up department by name
        if (!dept) {
            flash.error = "Invalid department selected!"
            render view: 'create', model: [
                    employee: employee,
                    departmentList: Department.list(),
                    deviceList: Device.list()
            ]
            return
        }
        employee.department = dept

        employee.name = sanitize(employee.name)
        employee.designation = sanitize(employee.designation)

        employeeService.create(employee)
        if (employee.hasErrors()) {
            flash.error = employee.errors.allErrors.collect { it.defaultMessage }.join('<br>')
            render view: 'create', model: [
                    employee: employee,
                    departmentList: Department.list(),
                    deviceList: Device.list()
            ]
            return
        }

        flash.message = "Employee created successfully."
        redirect action: 'index'
    }

    def edit(Long id) {
        def employee = employeeService.getById(id)
        if (!employee) {
            flash.error = "Employee not found."
            redirect action: 'index'
            return
        }
        render view: 'edit', model: [
                employee: employee,
                departmentList: Department.list(),
                deviceList: Device.list()
        ]
    }

    def update(Long id) {
        def employee = employeeService.getById(id)
        if (!employee) {
            flash.error = "Employee not found."
            redirect action: 'index'
            return
        }
        employee.properties = params

        def dept = Department.findByName(params.department)  // Look up department by name
        if (!dept) {
            flash.error = "Invalid department selected!"
            render view: 'edit', model: [
                    employee: employee,
                    departmentList: Department.list(),
                    deviceList: Device.list()
            ]
            return
        }
        employee.department = dept

        employee.name = sanitize(employee.name)
        employee.designation = sanitize(employee.designation)

        employeeService.update(employee)
        if (employee.hasErrors()) {
            flash.error = employee.errors.allErrors.collect { it.defaultMessage }.join('<br>')
            render view: 'edit', model: [
                    employee: employee,
                    departmentList: Department.list(),
                    deviceList: Device.list()
            ]
            return
        }

        flash.message = "Employee updated successfully."
        redirect action: 'index'
    }

    def delete(Long id) {
        def deleted = employeeService.delete(id)
        if (!deleted) {
            flash.error = "Could not delete employee."
        } else {
            flash.message = "Employee deleted."
        }
        redirect action: 'index'
    }

    // Basic XSS sanitizer for form fields
    private static String sanitize(String input) {
        if (input == null) return null
        return input.replaceAll(/[<>]/, '')
    }
}
