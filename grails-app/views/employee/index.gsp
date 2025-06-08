<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Employee List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Employee List</h2>
        <g:link controller="employee" action="create" class="btn btn-primary">Add New Employee</g:link>
    </div>

    <table class="table table-bordered table-striped shadow-sm bg-white">
        <thead class="table-primary">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${employeeList}" var="emp">
            <tr>
                <td>${emp.name}</td>
                <td>${emp.email}</td>
                <td>${emp.department}</td>
                <td>
                    <g:link controller="employee" action="edit" id="${emp.id}" class="btn btn-sm btn-outline-primary">Edit</g:link>

                    <g:form uri="/employee/deleteConfirmed" method="POST" useToken="true" style="display:inline;">
                        <g:hiddenField name="id" value="${emp.id}" />
                        <input type="submit" value="Delete" class="btn btn-sm btn-outline-danger"
                               onclick="return confirm('Are you sure you want to delete this employee?')" />
                    </g:form>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>
