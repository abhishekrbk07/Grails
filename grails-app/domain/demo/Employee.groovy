package demo

class Employee {
    String name
    String email
    String department

    static constraints = {
        name nullable: false, minSize: 2, maxSize: 20, matches: /^[a-zA-Z].*/
        email nullable: false, email: true
        department nullable: true, inList: ['Software Engineer', 'Senior Software Engineer', 'Marketing', 'IT', 'HR', 'Finance', 'Admin', 'Manager']
    }
}

