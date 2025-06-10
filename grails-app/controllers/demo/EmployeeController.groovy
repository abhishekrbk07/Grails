package demo

class EmployeeController {

    EmployeeService employeeService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        def employeeList = employeeService.listAll()
        render view: 'index', model: [employeeList: employeeList]
    }

    // Pie chart action: employees by department
    def pieChart() {
        def deptCountMap = Department.list().collectEntries { dept ->
            [(dept.name): dept.employees?.size() ?: 0]
        }
        render view: 'pieChart', model: [deptCountMap: deptCountMap]
    }

    def create() {
        render view: 'create', model: [
                employee: new Employee(),
                departmentList: Department.list(),
                deviceList: Device.list()
        ]
    }

    def save() {
        def cleanParams = params.findAll { it.key != 'department' && it.key != 'devices' }
        def employee = new Employee(cleanParams)
        def dept = Department.findByName(params.department)
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

        def selectedDevices = params.list('devices')
        if (employeeService.create(employee, selectedDevices)) {
            flash.message = "Employee created successfully."
            redirect action: 'index'
        } else {
            flash.error = employee.errors.allErrors.collect { it.defaultMessage }.join('<br>')
            render view: 'create', model: [
                    employee: employee,
                    departmentList: Department.list(),
                    deviceList: Device.list()
            ]
        }
    }

    def edit(Long id) {
        def employee = employeeService.getById(id)
        if (!employee) {
            flash.error = "Employee not found."
            redirect action: 'index'
            return
        }
        def assignedDevices = employee.deviceAssignments*.device?.name
        render view: 'edit', model: [
                employee: employee,
                departmentList: Department.list(),
                deviceList: Device.list(),
                assignedDevices: assignedDevices
        ]
    }

    def update(Long id) {
        def employee = employeeService.getById(id)
        if (!employee) {
            flash.error = "Employee not found."
            redirect action: 'index'
            return
        }
        def cleanParams = params.findAll { it.key != 'department' && it.key != 'devices' }
        employee.properties = cleanParams

        def dept = Department.findByName(params.department)
        if (!dept) {
            flash.error = "Invalid department selected!"
            render view: 'edit', model: [
                    employee: employee,
                    departmentList: Department.list(),
                    deviceList: Device.list(),
                    assignedDevices: employee.deviceAssignments*.device?.name
            ]
            return
        }
        employee.department = dept
        employee.name = sanitize(employee.name)
        employee.designation = sanitize(employee.designation)

        def selectedDevices = params.list('devices')
        if (employeeService.update(employee, selectedDevices)) {
            flash.message = "Employee updated successfully."
            redirect action: 'index'
        } else {
            flash.error = employee.errors.allErrors.collect { it.defaultMessage }.join('<br>')
            render view: 'edit', model: [
                    employee: employee,
                    departmentList: Department.list(),
                    deviceList: Device.list(),
                    assignedDevices: employee.deviceAssignments*.device?.name
            ]
        }
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

    private static String sanitize(String input) {
        if (input == null) return null
        return input.replaceAll(/[<>]/, '')
    }
}
