package demo

class EmployeeDeviceAssignmentController {

    EmployeeDeviceService employeeDeviceService

    def createDevice() {
        def employees = employeeDeviceService.getAllEmployees()
        def devices = employeeDeviceService.getAllDevices()
        render(view: 'createDevice', model: [employees: employees, devices: devices])
    }

    def save() {
        Long employeeId = params.long('employeeId')
        String deviceType = params.deviceType

        try {
            def deviceEntry = DeviceEntry.findByName(deviceType)
            if (!deviceEntry) {
                flash.message = "Device type '${deviceType}' not found."
                redirect(action: 'createDevice')
                return
            }

            employeeDeviceService.assignDeviceToEmployee(employeeId, deviceEntry.id)
            flash.message = "Device assigned successfully."
        } catch (Exception e) {
            flash.message = "Assignment failed: ${e.message}"
        }

        redirect(controller: 'employee', action: 'index')
    }
}
