package demo

import com.aspose.cells.Workbook
import com.aspose.cells.Worksheet
import com.aspose.cells.SaveFormat
import grails.gorm.transactions.Transactional

import java.text.SimpleDateFormat

class EmployeeController {

    EmployeeService employeeService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        String searchName = params.employeeName?.trim()
        String searchDept = params.department?.trim()

        def departmentList = Department.list()

        def employeeList = employeeService.searchEmployees(searchName, searchDept)

        render (view: 'index', model: [
                employeeList: employeeList,
                departmentList: departmentList,
                params: params
        ])
    }

    def pieChart() {
        def deptCountMap = Department.list().collectEntries { dept ->
            [(dept.name): dept.employees?.size() ?: 0]
        }
        render view: 'pieChart', model: [deptCountMap: deptCountMap]
    }

    def create() {
        if (session.userRole != 'ADMIN') {
            flash.error = "Not authorized."
            redirect action: 'index'
            return
        }
        render view: 'create', model: [
                employee: new Employee(),
                departmentList: Department.list(),
                deviceList: Device.list()
        ]
    }

    def save() {
        if (session.userRole != 'ADMIN') {
            flash.error = "Not authorized."
            redirect action: 'index'
            return
        }
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
        println "DEVICES TO ASSIGN FOR ${employee.name}: $selectedDevices"

        if (employeeService.create(employee, selectedDevices)) {
            // After successful save, fetch assignments
            def savedEmployee = Employee.findByName(employee.name) // Assumes name is unique
            def assignedDevices = DeviceAssignment.findAllByEmployee(savedEmployee)*.device?.name
            println "DEVICES ASSIGNED TO ${savedEmployee.name}: $assignedDevices"

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
        if (session.userRole != 'ADMIN') {
            flash.error = "Not authorized."
            redirect action: 'index'
            return
        }
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
        if (session.userRole != 'ADMIN') {
            flash.error = "Not authorized."
            redirect action: 'index'
            return
        }
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
        if (session.userRole != 'ADMIN') {
            flash.error = "Not authorized."
            redirect action: 'index'
            return
        }
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

    def exportExcel() {
        def employees = Employee.list(sort: "name")
        def workbook = new Workbook()
        Worksheet ws = workbook.worksheets[0]
        ws.name = "Employees"

        // Header
        def headers = ['Name', 'Designation', 'Department', 'Joining Date', 'Devices']
        headers.eachWithIndex { h, i -> ws.getCells().get(0, i).putValue(h) }

        def sdf = new SimpleDateFormat("yyyy-MM-dd")

        employees.eachWithIndex { emp, idx ->
            ws.getCells().get(idx + 1, 0).putValue(emp.name)
            ws.getCells().get(idx + 1, 1).putValue(emp.designation)
            ws.getCells().get(idx + 1, 2).putValue(emp.department?.name ?: "")
            def joinDateString = emp.joiningDate ? sdf.format(emp.joiningDate) : ""
            ws.getCells().get(idx + 1, 3).putValue(joinDateString)
            def devices = emp.deviceAssignments?.collect { it.device?.name }?.join(", ") ?: ""
            ws.getCells().get(idx + 1, 4).putValue(devices)
        }

        response.contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        response.setHeader("Content-Disposition", "attachment; filename=employees.xlsx")
        workbook.save(response.outputStream, SaveFormat.XLSX)
        response.outputStream.flush()
    }

    @Transactional
    def createUserFromEmployee(Long id) {
        def employee = Employee.get(id)
        if (!employee) {
            flash.error = "Employee not found."
            redirect action: 'index'
            return
        }
        def email = employee.email
        if (!email) {
            flash.error = "Employee does not have an email."
            redirect action: 'index'
            return
        }
        if (User.findByUsername(email)) {
            flash.error = "User already present!"
            redirect action: 'index'
            return
        }
        // Read defaults from config (application.yml)
        def defaultPassword = grailsApplication.config.app.defaultUserPassword ?: 'root'
        def defaultRole = grailsApplication.config.app.defaultUserRole ?: 'EMPLOYEE'
        String hashed = org.mindrot.jbcrypt.BCrypt.hashpw(defaultPassword, org.mindrot.jbcrypt.BCrypt.gensalt())

        def user = new User(username: email, password: hashed, role: defaultRole, enabled: true)
        user.save(flush: true)
        if (user.hasErrors()) {
            flash.error = user.errors.allErrors.collect { it.defaultMessage }.join('<br>')
        } else {
            flash.message = "User created!"
        }
        redirect action: 'index'
    }

    def agGrid() {
        def employees = Employee.createCriteria().list {
            order("name", "asc")
            fetchMode('deviceAssignments', org.hibernate.FetchMode.JOIN)
            fetchMode('department', org.hibernate.FetchMode.JOIN)
        }
        render view: 'datagrid', model: [employees: employees]
    }
}
