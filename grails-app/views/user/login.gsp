<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@600;800&display=swap" rel="stylesheet"/>
    <style>
    body { background: linear-gradient(120deg, #e3e9fc 0%, #f4f8ff 100%); font-family: 'Poppins', sans-serif; }
    .login-card { max-width: 420px; margin: 72px auto; border-radius: 20px; box-shadow: 0 5px 18px #b5c2db4d; background: #fff; }
    .form-label { font-weight: 600; }
    .btn-primary { background: linear-gradient(90deg, #5a8dee, #4e5bf2); border: none; font-weight:700; }
    h2 { font-weight: 800; color: #4e5bf2; font-family: 'Poppins', sans-serif; }
    </style>
</head>
<body>
<div class="login-card p-4">
    <h2 class="mb-4 text-center">Login</h2>
    <g:if test="${flash.error}">
        <div class="alert alert-danger">${flash.error}</div>
    </g:if>
    <g:if test="${flash.message}">
        <div class="alert alert-success">${flash.message}</div>
    </g:if>
    <g:form controller="user" action="doLogin" method="POST" class="needs-validation" novalidate="">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" maxlength="64" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" maxlength="128" required />
        </div>
        <button class="btn btn-primary w-100 mt-3" type="submit">Login</button>
        <div class="text-center mt-3">
            <a href="${createLink(controller:'user', action:'register')}" style="color:#5a8dee;">Don't have an account? Register</a>
        </div>
    </g:form>
</div>
</body>
</html>
