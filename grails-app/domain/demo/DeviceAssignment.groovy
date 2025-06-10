package demo

class DeviceAssignment {
    Employee employee
    Device device

    static belongsTo = [employee: Employee, device: Device]

    static constraints = {
        employee unique: ['device']
    }

    String toString() { "${employee.name} - ${device.name}" }
}
