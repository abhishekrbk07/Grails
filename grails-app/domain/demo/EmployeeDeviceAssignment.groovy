package demo

class EmployeeDeviceAssignment {

    Employee employee
    DeviceEntry deviceEntry

    static constraints = {
        employee nullable: false
        deviceEntry nullable: false
        // Prevent duplicate assignment of same device to same employee
        deviceEntry unique: ['employee']
    }

    static mapping = {
        table 'employee_device_assignment'
        employee column: 'employee_id'
        deviceEntry column: 'device_id'
        version false
    }

    static belongsTo = [employee: Employee, deviceEntry: DeviceEntry]
}
