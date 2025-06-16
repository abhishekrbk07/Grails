<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employees A–Z Grid</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ag-grid-community/styles/ag-grid.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ag-grid-community/styles/ag-theme-alpine.css">
    <style>
    body { background: #f4f8ff; font-family: 'Inter', sans-serif; min-height:100vh; }
    .header-bar {
        background: linear-gradient(93deg, #4155be 40%, #4e5bf2 100%);
        color: #fff; border-radius: 20px; margin: 38px 0 38px 0;
        box-shadow: 0 8px 28px 0 #a2b6ee55; padding: 22px 32px;
        display: flex; justify-content: space-between; align-items: center;
    }
    .header-bar h2 { margin: 0; font-size: 2.1rem; font-family: 'Poppins', sans-serif; font-weight: 800; }
    .back-btn {
        border: none; border-radius: 16px; padding: 11px 22px; font-size: 1.08rem; font-weight: 700;
        background: linear-gradient(90deg,#e3e9fc 50%,#5a8dee 100%); color: #4e5bf2;
        transition: background 0.14s, box-shadow 0.18s, transform 0.15s;
        box-shadow: 0 2px 8px #a2b6ee2d; text-decoration:none;
    }
    .back-btn:hover { background: linear-gradient(90deg,#dbeafe 20%,#4e5bf2 90%); color:#fff; }
    #gridCard { background: #fff; border-radius: 18px; padding: 22px 18px 12px 18px; margin-top: 30px; }
    .ag-theme-alpine { border-radius: 12px; font-size: 1.01rem; }
    </style>
</head>
<body>
<div class="container">
    <div class="header-bar">
        <h2>Employees (A–Z Grid)</h2>
        <g:link controller="employee" action="index" class="back-btn">
            <i class="fa fa-arrow-left me-2"></i>Back to List
        </g:link>
    </div>
    <div id="gridCard">
        <div id="myGrid" class="ag-theme-alpine" style="height: 540px; width: 100%;"></div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.js"></script>
<script>
    const rowData = [
        <g:each in="${employees}" var="emp" status="i">
        {
            name: "${emp.name?.encodeAsJavaScript()}",
            email: "${emp.email?.encodeAsJavaScript()}",
            designation: "${emp.designation?.encodeAsJavaScript()}",
            department: "${emp.department?.name?.encodeAsJavaScript()}",
            joiningDate: "${emp.joiningDate ? g.formatDate(date: emp.joiningDate, format:'yyyy-MM-dd') : ''}",
            devices: "<g:if test='${emp.deviceAssignments?.size() > 0}'>${emp.deviceAssignments*.device?.name?.join(', ')}</g:if><g:else>None</g:else>"
        }<g:if test='${i < employees.size() - 1}'>,</g:if>
        </g:each>
    ];

    const columnDefs = [
        { headerName: "Name", field: "name", sortable: true, filter: true, flex: 1 },
        { headerName: "Email", field: "email", sortable: true, filter: true, flex: 1 },
        { headerName: "Designation", field: "designation", sortable: true, filter: true, flex: 1 },
        { headerName: "Department", field: "department", sortable: true, filter: true, flex: 1 },
        { headerName: "Joining Date", field: "joiningDate", sortable: true, filter: true, flex: 1 },
        { headerName: "Devices", field: "devices", sortable: true, filter: true, flex: 1 }
    ];

    const gridOptions = {
        columnDefs: columnDefs,
        rowData: rowData,
        pagination: true,
        paginationPageSize: 15,
        defaultColDef: { resizable: true }
    };

    document.addEventListener('DOMContentLoaded', function () {
        agGrid.createGrid(document.querySelector("#myGrid"), gridOptions);
    });
</script>
</body>
</html>
