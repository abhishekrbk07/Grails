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
        def claims = JwtUtils.validateToken(session.jwt as String)
        JwtUtils.logClaims(claims, "in AuthInterceptor")
        if (!claims) {
            session.invalidate()
            redirect(controller: "user", action: "login")
            return false
        }
        true
    }

}
