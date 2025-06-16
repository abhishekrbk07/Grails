package demo

class Employee {
    String name
    String email
    String designation
    Date joiningDate

    static belongsTo = [department: Department]
    static hasMany = [deviceAssignments: DeviceAssignment]

    static constraints = {
        name blank: false, maxSize: 100, matches: /^[a-zA-Z\s]+$/
        email blank: false, email: true, unique: true
        designation blank: false, maxSize: 100
        joiningDate nullable: false
        department nullable: false
    }

    static mapping = {
        version false
    }

    String toString() { name }
}
