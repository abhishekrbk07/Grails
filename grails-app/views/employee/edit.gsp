<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header bg-warning">
            <h3 class="mb-0 text-white">Edit Employee Details</h3>
        </div>
        <div class="card-body">
            <g:form controller="employee" action="update" method="POST">
                <g:hiddenField name="id" value="${employee.id}" />

                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <g:textField name="name" value="${employee.name}" class="form-control" required="true"/>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <g:textField name="email" value="${employee.email}" class="form-control" required="true"/>
                </div>

                <div class="mb-3">
                    <label for="department" class="form-label">Department</label>
                    <g:textField name="department" value="${employee.department}" class="form-control" required="true"/>
                </div>

                <button type="submit" class="btn btn-warning">Update</button>
            </g:form>

        </div>
    </div>
</div>
</body>
</html>
