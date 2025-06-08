package demo

import grails.gorm.transactions.Transactional

@Transactional
class EmployeeService {

    List<Employee> getEmployeeList() {
        return Employee.list()
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
            emp.delete(flush: true)
            return true
        }
        return false
    }
}