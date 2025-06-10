package demo

import grails.gorm.transactions.Transactional

@Transactional
class EmployeeService {

    List<Employee> listAll() {
        Employee.list(sort: "name")
    }

    Employee getById(Long id) {
        Employee.get(id)
    }

    // Uniqueness check on name (excluding self on update)
    boolean isNameUnique(String name, Long excludeId = null) {
        if (excludeId) {
            Employee.countByNameAndIdNotEqual(name, excludeId) == 0
        } else {
            Employee.countByName(name) == 0
        }
    }

    // Create employee, apply validation and uniqueness check
    void create(Employee employee) {
        if (!isNameUnique(employee.name)) {
            employee.errors.rejectValue("name", "employee.name.unique", "Employee name must be unique")
            return
        }
        employee.validate()
        if (!employee.hasErrors()) {
            employee.save(flush: true)
        }
    }

    // Update employee
    void update(Employee employee) {
        if (!isNameUnique(employee.name, employee.id)) {
            employee.errors.rejectValue("name", "employee.name.unique", "Employee name must be unique")
            return
        }
        employee.validate()
        if (!employee.hasErrors()) {
            employee.save(flush: true)
        }
    }

    // Delete employee by id, return true if deleted
    boolean delete(Long id) {
        Employee emp = Employee.get(id)
        if (emp) {
            emp.delete(flush: true)
            return true
        }
        false
    }
}
