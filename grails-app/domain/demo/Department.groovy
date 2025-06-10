package demo

class Department {
    String name

    static hasMany = [employees: Employee]

    static constraints = {
        name unique: true, blank: false
    }

    static mapping = {
        version false
    }

    String toString() { name }
}
