<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Employee List</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@500&display=swap" rel="stylesheet"/>

    <style>
    body {
        font-family: 'Inter', sans-serif;
        font-size: 16px;
        background-color: #f0f4fa;
        min-height: 100vh;
        padding-bottom: 40px;
    }

    .header-bar {
        background: linear-gradient(135deg, #5a8dee, #4e5bf2);
        color: white;
        padding: 24px 36px;
        border-radius: 16px;
        margin-top: 30px;
        margin-bottom: 40px;
        box-shadow: 0 12px 30px rgb(78 91 242 / 0.25);
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
        font-size: 1.75rem;
        letter-spacing: 0.03em;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .employee-logo {
        width: 48px;
        height: 48px;
        margin-right: 18px;
        border-radius: 12px;
        background: rgba(255 255 255 / 0.2);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 1.7rem;
    }

    .btn-gradient {
        background: linear-gradient(90deg, #4e5bf2 0%, #5a8dee 100%);
        color: white;
        border: none;
        padding: 12px 34px;
        font-size: 1.1rem;
        font-weight: 600;
        border-radius: 12px;
        cursor: pointer;
        transition: background 0.4s ease, box-shadow 0.3s ease;
        font-family: 'Poppins', sans-serif;
        box-shadow: 0 6px 14px rgb(78 91 242 / 0.35);
        text-decoration: none;
        display: inline-block;
    }

    .btn-gradient:hover {
        background: linear-gradient(90deg, #5a8dee 0%, #4e5bf2 100%);
        box-shadow: 0 8px 24px rgb(78 91 242 / 0.55);
        text-decoration: none;
        color: white;
    }

    .employee-card {
        background-color: white;
        border: none;
        border-radius: 20px;
        box-shadow: 0 16px 40px rgb(0 0 0 / 0.08);
        transition: transform 0.3s, box-shadow 0.3s;
        cursor: default;
        padding: 30px;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .employee-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 24px 48px rgb(0 0 0 / 0.12);
    }

    .card-title {
        font-size: 1.4rem;
        font-weight: 700;
        color: #2b2f48;
        margin-bottom: 6px;
        font-family: 'Poppins', sans-serif;
    }

    .card-subtitle {
        font-size: 1rem;
        color: #555a7b;
        margin-bottom: 12px;
    }

    .text-muted {
        font-size: 0.9rem;
        color: #7a7f9a;
        margin-bottom: 20px;
        font-style: italic;
    }

    .btn-group-custom {
        display: flex;
        gap: 16px;
    }

    .btn-edit {
        background: linear-gradient(90deg, #4e5bf2 0%, #5a8dee 100%);
        color: white;
        border: none;
        border-radius: 12px;
        padding: 8px 22px;
        font-weight: 600;
        font-family: 'Poppins', sans-serif;
        font-size: 0.95rem;
        box-shadow: 0 4px 12px rgb(78 91 242 / 0.3);
        transition: background 0.3s ease, box-shadow 0.3s ease;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 6px;
        cursor: pointer;
    }

    .btn-edit:hover {
        background: linear-gradient(90deg, #5a8dee 0%, #4e5bf2 100%);
        box-shadow: 0 6px 20px rgb(78 91 242 / 0.45);
        text-decoration: none;
        color: white;
    }

    .btn-delete {
        background: #f44336;
        color: white;
        border: none;
        border-radius: 12px;
        padding: 8px 22px;
        font-weight: 600;
        font-family: 'Poppins', sans-serif;
        font-size: 0.95rem;
        box-shadow: 0 4px 12px rgb(244 67 54 / 0.3);
        cursor: pointer;
        transition: background 0.3s ease, box-shadow 0.3s ease;
    }

    .btn-delete:hover {
        background: #d32f2f;
        box-shadow: 0 6px 20px rgb(211 47 47 / 0.45);
    }
    </style>

    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">

    <!-- Header -->
    <div class="header-bar">
        <div class="d-flex align-items-center">
            <div class="employee-logo">
                <i class="fas fa-users"></i>
            </div>
            <h2 class="mb-0">Employee Management System</h2>
        </div>
        <g:link controller="employee" action="create" class="btn-gradient">+ Add Employee</g:link>
        <g:link controller="employeeDeviceAssignment" action="createDevice" class="btn-gradient">
            Assign Device to User
        </g:link>
    </div>

    <!-- Employee Cards -->
    <div class="row g-4">
        <g:each in="${employeeList}" var="emp">
            <div class="col-md-6 col-lg-4">
                <div class="employee-card">
                    <div>
                        <h5 class="card-title">${emp.name}</h5>
                        <h6 class="card-subtitle">${emp.email}</h6>
                        <p class="text-muted">${emp.department}</p>
                        <p><strong>Device Assigned:</strong> ${emp.deviceName ?: 'No device assigned'}</p>

                    </div>

                    <div class="btn-group-custom">
                        <g:link controller="employee" action="edit" id="${emp.id}" class="btn-edit">
                            <i class="fas fa-edit"></i> Edit
                        </g:link>

                        <g:form uri="/employee/deleteConfirmed" method="POST" useToken="true" onsubmit="return confirm('Are you sure you want to delete this employee?');" style="margin:0;">
                            <g:hiddenField name="id" value="${emp.id}" />
                            <button type="submit" class="btn-delete">
                                <i class="fas fa-trash-alt"></i> Delete
                            </button>
                        </g:form>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>
</body>
</html>