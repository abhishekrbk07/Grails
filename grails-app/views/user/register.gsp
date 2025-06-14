<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@600;800&display=swap" rel="stylesheet"/>
    <style>
    body { background: linear-gradient(120deg, #e3e9fc 0%, #f4f8ff 100%);font-family: 'Poppins', sans-serif; }

    .register-card { max-width: 440px;
        margin: 64px auto;
        border-radius: 20px;
        box-shadow: 0 5px 18px #b5c2db4d;
        background: #fff; }

    .form-label { font-weight: 600; }
    .btn-primary { background: linear-gradient(90deg, #5a8dee, #4e5bf2);
        border: none;
        font-weight:700; }
    h2 { font-weight: 800;
        color: #4e5bf2;
        font-family: 'Poppins', sans-serif; }
    </style>
</head>
<body>
<div class="register-card p-4">
    <h2 class="mb-4 text-center">Register</h2>
    <g:if test="${flash.error}">
        <div class="alert alert-danger">${flash.error}</div>
    </g:if>
    <g:form controller="user" action="saveRegister" method="POST" class="needs-validation" novalidate="">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" maxlength="64" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" maxlength="128" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Role</label>
            <select name="role" class="form-select" required>
                <option value="" disabled selected>Select Role</option>
                <option value="ADMIN">Admin</option>
                <option value="EMPLOYEE">Employee</option>
            </select>
        </div>
        <button class="btn btn-primary w-100 mt-3" type="submit">Register</button>
        <div class="text-center mt-3">
            <a href="${createLink(controller:'user', action:'login')}" style="color:#5a8dee;">Already have an account? Login</a>
        </div>
    </g:form>
</div>
</body>
</html>
