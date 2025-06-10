package demo

import grails.gorm.annotation.Entity

@Entity
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
}
