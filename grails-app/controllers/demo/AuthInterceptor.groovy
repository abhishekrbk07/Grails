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
        JwtUtils.logClaims(claims, "in AuthInterceptor")
        if (!claims) {
            session.invalidate()
            redirect(controller: "user", action: "login")
            return false
        }
        // Log the token claims for debugging
        println "--- JWT CLAIMS IN INTERCEPTOR ---"
        claims.each { k, v -> println "$k: $v" }
        println "---------------------------------"
        true
    }

}
