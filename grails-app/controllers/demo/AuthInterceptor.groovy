package demo

class AuthInterceptor {

    AuthInterceptor() {
        matchAll().except(controller: "user") // All except register/login/logout
    }

    boolean before() {
        if (!session.jwt) {
            redirect(controller: "user", action: "login")
            return false
        }
        // Optionally, validate JWT again
        def claims = JwtUtils.validateToken(session.jwt as String)
        if (!claims) {
            session.invalidate()
            redirect(controller: "user", action: "login")
            return false
        }
        // For role-based protection, check claims.role
        true
    }
}
