package demo

import io.jsonwebtoken.Jwts
import io.jsonwebtoken.SignatureAlgorithm
import io.jsonwebtoken.Claims
import java.util.Date

class JwtUtils {

    static String SECRET_KEY = "ChangeThisSecretInProduction!"

    static String generateToken(User user) {
        long now = System.currentTimeMillis()
        long expiry = now + (10 * 60 * 1000) // 10 minutes
        return Jwts.builder()
                .setSubject(user.username)
                .claim("role", user.role)
                .setIssuedAt(new Date(now))
                .setExpiration(new Date(expiry))
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY.bytes)
                .compact()
    }

    static Claims validateToken(String token) {
        try {
            return Jwts.parser().setSigningKey(SECRET_KEY.bytes).parseClaimsJws(token).body
        } catch (Exception e) {
            return null
        }
    }
}
