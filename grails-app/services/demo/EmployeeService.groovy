package demo

import grails.gorm.transactions.Transactional

@Transactional
class EmployeeService {

    List<Map> getEmployeeList() {
        def employees = Employee.list()  // Fetch all Employee records
        return employees.collect { emp ->

            // Find the device assignment for the current employee
            def assignment = EmployeeDeviceAssignment.findByEmployee(emp)

            // Return a map containing employee details + device name (if assigned)
            [
                    id         : emp.id,
                    name       : emp.name,
                    email      : emp.email,
                    department : emp.department,
                    deviceName : assignment?.deviceEntry?.name  // Safely access device name
            ]
        }
    }

    Employee getEmployeeById(Long id) {
        return Employee.get(id)
    }

    Employee saveEmployee(Employee emp) {
        return emp.save(flush: true, failOnError: true)
    }

    boolean deleteEmployee(Long id) {
        def emp = Employee.get(id)
        if (emp) {
            // Delete related EmployeeDeviceAssignment records first
            def assignments = EmployeeDeviceAssignment.findAllByEmployee(emp)
            assignments*.delete(flush: true)

            // Now delete the employee
            emp.delete(flush: true)
            return true
        }
        return false
    }
}