package demo

import io.jsonwebtoken.Jwts
import io.jsonwebtoken.SignatureAlgorithm
import io.jsonwebtoken.Claims
import java.util.Date
import java.util.Base64

class JwtUtils {

    static String SECRET_KEY = "47tRHDExDVuNvE+JG2Jh0NCRqXcW1Xurc4B2MroojJg=" // 32 bytes

    static byte[] getSecretKeyBytes() {
        Base64.decoder.decode(SECRET_KEY)
    }

    static String generateToken(User user) {
        long now = System.currentTimeMillis()
        long expiry = now + (10 * 60 * 1000) // 10 minutes
        String jwt = Jwts.builder()
                .setSubject(user.username)
                .claim("role", user.role)
                .setIssuedAt(new Date(now))
                .setExpiration(new Date(expiry))
                .signWith(SignatureAlgorithm.HS256, getSecretKeyBytes())
                .compact()

        println "JWT GENERATED: $jwt"
        return jwt
    }

    static Claims validateToken(String token) {
        try {
            def claims = Jwts.parser()
                    .setSigningKey(getSecretKeyBytes())
                    .parseClaimsJws(token)
                    .body
            // Log claims for debugging
            logClaims(claims, "VALIDATION")
            return claims
        } catch (Exception e) {
            println "JWT VALIDATION ERROR: ${e.getMessage()}"
            return null
        }
    }

    static void logClaims(Claims claims, String context = "") {
        println "---- JWT CLAIMS ${context ? '[' + context + ']' : ''} ----"
        claims.each { k, v -> println "$k: $v" }
        println "--------------------------------------"
    }
}
