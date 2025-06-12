package demo

import org.mindrot.jbcrypt.BCrypt

import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    // Find by username, then check password with BCrypt
    def authenticate(String username, String password) {
        def user = User.findByUsername(username)
        println "AUTH: username=${username}, foundUser=${user ? user.username : null}"
        if (user) {
            println "AUTH: dbHash=${user.password}"
            println "AUTH: bcryptMatch=" + org.mindrot.jbcrypt.BCrypt.checkpw(password, user.password)
        }
        if (user && org.mindrot.jbcrypt.BCrypt.checkpw(password, user.password)) {
            println "AUTH: LOGIN SUCCESS"
            return user
        }
        println "AUTH: LOGIN FAIL"
        return null
    }

    def registerUser(String username, String password, String role) {
        if (User.findByUsername(username)) {
            return null // Username already exists
        }
        // Hash the password before saving!
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt())
        def user = new User(username: username, password: hashed, role: role, enabled: true)
        user.save(flush: true)
        return user.hasErrors() ? null : user
    }
}
