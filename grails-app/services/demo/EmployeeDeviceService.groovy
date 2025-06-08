package demo

import grails.gorm.transactions.Transactional

@Transactional
class EmployeeDeviceService {

    List<Employee> getAllEmployees() {
        Employee.list()
    }

    List<DeviceEntry> getAllDevices() {
        DeviceEntry.list()
    }

    List<EmployeeDeviceAssignment> getAllAssignments() {
        EmployeeDeviceAssignment.list()
    }

    void assignDeviceToEmployee(Long employeeId, Long deviceId) {
        def employee = Employee.get(employeeId)
        def device = DeviceEntry.get(deviceId)

        if (!employee || !device) {
            throw new IllegalArgumentException("Invalid employee or device")
        }

        def existingAssignment = EmployeeDeviceAssignment.findByEmployeeAndDeviceEntry(employee, device)
        if (!existingAssignment) {
            def assignment = new EmployeeDeviceAssignment(employee: employee, deviceEntry: device)
            if (!assignment.save(flush: true)) {
                assignment.errors.allErrors.each { println it }
                throw new RuntimeException("Failed to save assignment: ${assignment.errors}")
            }
        } else {
            println "Assignment already exists for employee: ${employee.name} and device: ${device.name}"
        }
    }
}
