<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>

    <style>
    body {
        font-family: 'Inter', sans-serif;
        background-color: #f4f7fc;
        min-height: 100vh;
        padding-bottom: 40px;
    }

    .header-bar {
        background: linear-gradient(to right, #007bff, #6f42c1);
        color: white;
        padding: 20px 30px;
        border-radius: 12px;
        margin-top: 30px;
        margin-bottom: 30px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .header-bar h3 {
        font-weight: 600;
        font-size: 1.6rem;
        margin: 0;
    }

    .btn-back {
        background: rgba(255, 255, 255, 0.25);
        color: white;
        border: 1.5px solid white;
        border-radius: 8px;
        padding: 6px 16px;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 6px;
    }

    .btn-back:hover {
        background: white;
        color: #007bff;
        text-decoration: none;
    }

    .card-container {
        max-width: 600px;
        margin: 0 auto;
        background-color: white;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.08);
        padding: 40px 35px;
    }

    label.form-label {
        font-weight: 600;
        color: #333;
    }

    .form-control-lg {
        font-size: 1rem;
        padding: 0.75rem 1rem;
        border-radius: 10px;
        border: 1.8px solid #ddd;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-control-lg:focus {
        border-color: #007bff;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.4);
        outline: none;
    }

    .btn-gradient {
        background: linear-gradient(to right, #00c6ff, #0072ff);
        border: none;
        color: white;
        font-weight: 600;
        border-radius: 12px;
        padding: 12px 32px;
        font-size: 1rem;
        transition: background 0.3s ease;
    }

    .btn-gradient:hover {
        background: linear-gradient(to right, #0072ff, #00c6ff);
    }
    </style>
</head>

<body>
<div class="container">

    <!-- Header Bar -->
    <div class="header-bar">
        <h3>Edit Employee Details</h3>
        <a href="${createLink(controller: 'employee', action: 'index')}" class="btn-back">
            <i class="fas fa-arrow-left"></i> Back to List
        </a>
    </div>

    <!-- Edit Form Card -->
    <div class="card-container">
        <g:form controller="employee" action="update" method="POST" autocomplete="off">
            <g:hiddenField name="id" value="${employee.id}" />

            <div class="mb-4">
                <label for="name" class="form-label">Full Name</label>
                <g:textField name="name" id="name" value="${employee.name}" class="form-control form-control-lg" required="true" placeholder="Enter full name"/>
            </div>

            <div class="mb-4">
                <label for="email" class="form-label">Email Address</label>
                <g:textField name="email" id="email" value="${employee.email}" class="form-control form-control-lg" required="true" type="email" placeholder="Enter email address"/>
            </div>

            <div class="mb-4">
                <label for="department" class="form-label">Department</label>
                <g:textField name="department" id="department" value="${employee.department}" class="form-control form-control-lg" required="true" placeholder="Enter department"/>
            </div>

            <div class="text-end">
                <button type="submit" class="btn btn-gradient px-4 py-2">
                    <i class="fas fa-save"></i> Update Employee
                </button>
            </div>
        </g:form>
    </div>
</div>

<!-- Font Awesome for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>
