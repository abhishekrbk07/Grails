package demo

class User {
    String username
    String password // hashed
    String role // 'ADMIN' or 'EMPLOYEE'
    Boolean enabled = true
    Date dateCreated
    Date lastUpdated

    static constraints = {
        username blank: false, unique: true, maxSize: 64
        password blank: false, maxSize: 255
        role inList: ['ADMIN', 'EMPLOYEE'], blank: false
        enabled nullable: false
    }

    static mapping = {
        table '`user`'
        username column: 'username'
        password column: 'password'
        role column: 'role'
        enabled column: 'enabled'
        dateCreated column: 'date_created'
        lastUpdated column: 'last_updated'
    }
}
