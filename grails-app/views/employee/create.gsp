<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
</head>
<body class="bg-light" style="font-family: 'Inter', sans-serif;">
<div class="container mt-5">
    <div class="card shadow-lg rounded-4">
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h3 class="mb-0">Add New Employee</h3>
            <a href="${createLink(controller: 'employee', action: 'index')}" class="btn btn-light btn-sm">← Back to List</a>
        </div>
        <div class="card-body px-4 py-4">
            <g:form controller="employee" action="save" method="POST">
                <div class="mb-4">
                    <label for="name" class="form-label">Full Name</label>
                    <g:textField name="name" id="name" class="form-control form-control-lg" required="true"/>
                </div>

                <div class="mb-4">
                    <label for="email" class="form-label">Email Address</label>
                    <g:textField name="email" id="email" class="form-control form-control-lg" required="true" type="email"/>
                </div>

                <div class="mb-4">
                    <label for="department" class="form-label">Department</label>
                    <g:textField name="department" id="department" class="form-control form-control-lg" required="true"/>
                </div>

                <div class="text-end">
                    <button type="submit" class="btn btn-primary px-4 py-2">💾 Save Employee</button>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
