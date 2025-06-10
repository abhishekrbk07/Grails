package demo

import grails.gorm.transactions.Transactional
import org.springframework.security.crypto.bcrypt.BCrypt

@Transactional
class UserService {

    User registerUser(String username, String password, String role) {
        if (User.findByUsername(username)) return null
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt())
        def user = new User(username: username, password: hashed, role: role, enabled: true)
        user.save(flush: true)
        return user
    }

    User authenticate(String username, String password) {
        def user = User.findByUsername(username)
        if (user && BCrypt.checkpw(password, user.password)) {
            return user
        }
        return null
    }
}
