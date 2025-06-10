package demo

class Employee {
    String name
    String designation
    Date joiningDate

    static belongsTo = [department: Department]
    static hasMany = [deviceAssignments: DeviceAssignment]

    static constraints = {
        name blank: false, maxSize: 100, matches: /^[a-zA-Z\s]+$/
        designation blank: false, maxSize: 100
        joiningDate nullable: false
        department nullable: false
    }

    static mapping = {
        version false  // If you don't want a version column
    }

    String toString() { name }
}
