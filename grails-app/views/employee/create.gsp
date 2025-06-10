<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
    body { background: #f6f9fc; font-family: 'Poppins', sans-serif; }
    .card { max-width: 480px; margin: 60px auto; border-radius: 18px; box-shadow: 0 4px 16px #b5c2db4d; }
    .btn-primary { background: linear-gradient(90deg, #5a8dee, #4e5bf2); border: none; }
    .form-label { font-weight: 600; }
    </style>
</head>
<body>
<div class="card p-4">
    <h2 class="mb-4 text-center">Add New Employee</h2>
    <g:if test="${flash.error}">
        <div class="alert alert-danger">${flash.error}</div>
    </g:if>
    <g:form controller="employee" action="save" method="POST" class="needs-validation" novalidate="">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" value="${employee?.name ?: ''}" required maxlength="100" class="form-control" pattern="^[a-zA-Z\s]+$"/>
            <div class="invalid-feedback">Please enter a valid name (no special characters, no &lt; or &gt; allowed).</div>
        </div>
        <div class="mb-3">
            <label class="form-label">Designation</label>
            <g:textField name="designation" value="${employee?.designation}" required="true" maxlength="100" class="form-control"/>
            <div class="invalid-feedback">Please enter the designation.</div>
        </div>
        <div class="mb-3">
            <label class="form-label">Department</label>
            <select name="department" required class="form-select">
                <option value="" disabled selected>Select Department</option>
                <option value="HR">HR</option>
                <option value="Analytics">Analytics</option>
                <option value="Data">Data</option>
                <option value="Care">Care</option>
                <option value="Admin">Admin</option>
                <option value="Finance">Finance</option>
                <option value="IT">IT</option>
            </select>
            <div class="invalid-feedback">Please select a department.</div>
        </div>
        <div class="mb-3">
            <label class="form-label">Joining Date</label>
            <g:datePicker name="joiningDate" value="${employee?.joiningDate}" precision="day" required="true" class="form-control"/>
            <div class="invalid-feedback">Please provide the joining date.</div>
        </div>
        <button class="btn btn-primary w-100 mt-3" type="submit">Add Employee</button>
    </g:form>
</div>
<script>
    // Client-side form validation for Bootstrap 5
    (() => {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>
</body>
</html>
