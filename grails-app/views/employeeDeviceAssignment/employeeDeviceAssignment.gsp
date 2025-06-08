<!DOCTYPE html>
<html>
<head>
    <title>Employee Device Assignments</title>
</head>
<body>
<h2>Employee Device Assignments</h2>

<g:link action="create">Assign Device to Employee</g:link>

<table border="1" cellpadding="8" cellspacing="0">
    <thead>
    <tr>
        <th>Employee Name</th>
        <th>Device Name</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${assignments}" var="assign">
        <tr>
            <td>${assign.employee.name}</td>
            <td>${assign.device.name}</td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>
