package demo

class Employee {
    String name
    String email
    String department

    static constraints = {
        name nullable: false
        email nullable: false, email: true
        department nullable: true
    }

}