package demo

import grails.gorm.transactions.Transactional

@Transactional
class EmployeeService {

    List<Employee> listAll() {
        def hql = """
        select distinct e
        from Employee e
        left join fetch e.deviceAssignments da
        order by e.id
    """
        Employee.executeQuery(hql)
    }

    Employee getById(Long id) {
        Employee.get(id)
    }


    /**
     * Save a new employee and assign devices.
     * Returns true if success, false if validation error.
     */
    boolean create(Employee employee, List<String> deviceNames) {
        employee.validate()
        if (employee.hasErrors()) return false
        employee.save(flush: true) // Save ONCE!
        assignDevices(employee, deviceNames)
        return true
    }

    /**
     * Update existing employee and re-assign devices.
     * Returns true if success, false if validation error.
     */
    boolean update(Employee employee, List<String> deviceNames) {
        employee.validate()
        if (employee.hasErrors()) return false
        employee.save(flush: true) // Save ONCE!
        assignDevices(employee, deviceNames)
        return true
    }

    /**
     * Assigns devices: removes existing, then adds new.
     */
    void assignDevices(Employee employee, List<String> deviceNames) {
        // Remove previous assignments
        DeviceAssignment.findAllByEmployee(employee)*.delete()
        def uniqueDeviceNames = deviceNames ? deviceNames.toSet().toList() : []
        uniqueDeviceNames.each { deviceName ->
            def device = Device.findByName(deviceName)
            if (device) {
                new DeviceAssignment(employee: employee, device: device).save(flush: true)
            }
        }
    }

    /**
     * Deletes employee and assignments (once only).
     */
    boolean delete(Long id) {
        Employee emp = Employee.get(id)
        if (emp) {
            DeviceAssignment.findAllByEmployee(emp)*.delete()
            emp.delete(flush: true)
            return true
        }
        false
    }

    List<Employee> searchEmployees(String name, String departmentName) {
        def c = Employee.createCriteria()
        c.list {
            if (name) {
                ilike('name', "%${name}%")  // Case-insensitive partial match
            }
            if (departmentName) {
                department {
                    eq('name', departmentName)
                }
            }
            fetchMode('deviceAssignments', org.hibernate.FetchMode.JOIN)
            order('id', 'asc')
            projections {
                distinct('id')
            }
        }.collect { Employee.get(it) }
    }

}
