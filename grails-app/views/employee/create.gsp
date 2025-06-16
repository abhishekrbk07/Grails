<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Google Fonts: Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@600;800&display=swap" rel="stylesheet"/>
    <style>
    body {
        background: linear-gradient(120deg, #e3e9fc 0%, #f4f8ff 100%);
        font-family: 'Inter', sans-serif;
        min-height: 100vh;
        margin: 0;
    }
    .card {
        max-width: 500px;
        margin: 64px auto;
        border-radius: 22px;
        box-shadow: 0 6px 24px #b5c2db3c, 0 2.5px 8px #dbeafe;
        background: #fff;
        padding: 2.7rem 2.3rem 2.1rem 2.3rem;
        border: none;
        position: relative;
        overflow: hidden;
    }
    .card:before {
        content: "";
        position: absolute;
        right: -38px; top: -52px;
        width: 138px; height: 138px;
        background: radial-gradient(circle, #e3e9fc 85%, transparent 100%);
        opacity: 0.5;
        z-index: 1;
    }
    .card h2 {
        font-family: 'Poppins', sans-serif;
        font-size: 2rem;
        font-weight: 800;
        margin-bottom: 2.1rem;
        letter-spacing: .3px;
        color: #4155be;
    }
    .form-label {
        font-weight: 700;
        color: #3e4772;
        font-family: 'Poppins', sans-serif;
        font-size: 1.07rem;
    }
    .form-control, .form-select {
        border-radius: 11px;
        font-size: 1.06rem;
        min-height: 2.5rem;
        padding: 0.53rem 1rem;
        box-shadow: 0 1px 4px #e7ebf7;
    }
    .form-control:focus, .form-select:focus {
        border-color: #5a8dee;
        box-shadow: 0 0 0 0.14rem #5a8dee3a;
    }
    .form-check-input {
        width: 1.17em;
        height: 1.17em;
        margin-top: .32em;
        margin-right: .65em;
        accent-color: #5a8dee;
    }
    .form-check-label {
        font-weight: 500;
        font-size: 1.03rem;
        color: #4e5bf2;
    }
    .btn-primary {
        background: linear-gradient(90deg, #5a8dee, #4e5bf2 70%);
        border: none;
        font-family: 'Poppins', sans-serif;
        font-size: 1.09rem;
        font-weight: 700;
        padding: .73rem 1rem;
        border-radius: 14px;
        margin-top: 0.4rem;
        box-shadow: 0 2px 8px #5a8dee38;
        transition: background 0.18s, box-shadow 0.17s, transform 0.13s;
    }
    .btn-primary:hover {
        background: linear-gradient(90deg, #4e5bf2 10%, #5a8dee 90%);
        box-shadow: 0 4px 18px #4e5bf234;
        transform: scale(1.045) translateY(-1.5px);
    }
    .alert-danger {
        font-family: 'Inter', sans-serif;
        font-size: 1.02rem;
        border-radius: 10px;
    }
    .back-link-btn {
        display: flex;
        align-items: center;
        gap: 7px;
        background: #f4f8ff;
        color: #4155be;
        border: 2px solid #5a8dee;
        font-weight: 700;
        font-size: 1.09rem;
        padding: .55rem 1.25rem;
        border-radius: 13px;
        transition: background .17s, box-shadow .17s, color .18s;
        box-shadow: 0 2px 10px #c0c5ee28;
    }

    .back-link-btn:hover {
        background: linear-gradient(90deg, #e3e9fc 80%, #dbeafe 100%);
        color: #4e5bf2;
        box-shadow: 0 4px 20px #4e5bf230;
        border-color: #4e5bf2;
        text-decoration: none;
    }

    .back-arrow {
        font-size: 1.3em;
        margin-right: 4px;
        transform: translateY(-1px);
    }

    </style>
</head>
<body>
<g:if test="${session.userRole != 'ADMIN'}">
    <div class="alert alert-danger mt-5 text-center">Not authorized.</div>
    <% return %>
</g:if>
<div class="card p-4">
    <div class="d-flex justify-content-start mb-3">
        <g:link controller="employee" action="index" class="btn back-link-btn">
            <span class="back-arrow">&#8592;</span>
            Back to List
        </g:link>
    </div>
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
            <label class="form-label">Email</label>
            <input type="email" name="email" value="${employee?.email ?: ''}" required maxlength="100" class="form-control"/>
            <div class="invalid-feedback">Please enter a valid email address.</div>
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
            <label class="form-label">Devices</label>
            <div class="form-check mb-1">
                <input class="form-check-input" type="checkbox" name="devices" value="Laptop" id="devLaptop">
                <label class="form-check-label" for="devLaptop">Laptop</label>
            </div>
            <div class="form-check mb-1">
                <input class="form-check-input" type="checkbox" name="devices" value="Monitor" id="devMonitor">
                <label class="form-check-label" for="devMonitor">Monitor</label>
            </div>
            <div class="form-check mb-1">
                <input class="form-check-input" type="checkbox" name="devices" value="Headphone" id="devHeadphone">
                <label class="form-check-label" for="devHeadphone">Headphone</label>
            </div>
            <div class="form-check mb-1">
                <input class="form-check-input" type="checkbox" name="devices" value="Mouse" id="devMouse">
                <label class="form-check-label" for="devMouse">Mouse</label>
            </div>
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
