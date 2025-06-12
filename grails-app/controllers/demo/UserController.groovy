package demo

class UserController {

    UserService userService

    def register() {
        render view: 'register'
    }

    def saveRegister() {
        String username = params.username?.trim()
        String password = params.password
        String role = params.role

        if (!username || !password || !role) {
            flash.error = "All fields are required."
            render view: 'register'
            return
        }
        def user = userService.registerUser(username, password, role)
        if (!user) {
            flash.error = "Username already exists."
            render view: 'register'
            return
        }
        flash.message = "Registration successful! Please log in."
        redirect controller: 'user', action: 'login'
    }

    def login() {
        render view: 'login'
    }

    def doLogin() {
        String username = params.username?.trim()
        String password = params.password

        def user = userService.authenticate(username, password)
        if (!user) {
            flash.error = "Invalid credentials"
            render view: 'login'
            return
        }
        // Generate JWT
        String jwt = JwtUtils.generateToken(user)
        println "JWT GENERATED for user ${user.username}: ${jwt}"   // <-- Log the JWT
        session.jwt = jwt
        session.userRole = user.role
        session.username = user.username

        // For debugging: decode claims and log breakdown
        def claims = JwtUtils.validateToken(jwt)
        if (claims) {
            println "--- JWT CLAIMS BREAKDOWN ---"
            claims.each { k, v -> println "$k: $v" }
            println "----------------------------"
        }

        flash.message = "Welcome, ${user.username}!"
        redirect controller: 'employee', action: 'index'
    }

    def logout() {
        session.invalidate()
        redirect action: 'login'
    }
}
