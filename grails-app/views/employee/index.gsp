<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employees</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
    body { background: #f0f4fa; }
    .header-bar {
        background: linear-gradient(135deg, #5a8dee, #4e5bf2);
        color: #fff;
        border-radius: 16px;
        margin-top: 30px;
        margin-bottom: 40px;
        box-shadow: 0 12px 30px rgba(90,141,238,0.11);
        padding: 22px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .add-btn {
        background: #4e5bf2;
        color: #fff !important;
        padding: 10px 22px;
        border-radius: 10px;
        border: none;
        font-weight: 500;
        font-size: 1rem;
    }
    .emp-card {
        background: #fff;
        border-radius: 14px;
        box-shadow: 0 4px 18px rgba(90,141,238,0.08);
        padding: 26px 24px 20px 24px;
        margin-bottom: 30px;
        transition: box-shadow 0.16s;
    }
    .emp-card:hover {
        box-shadow: 0 8px 36px rgba(90,141,238,0.18);
    }
    .emp-name {
        font-size: 1.2rem;
        font-weight: 600;
        color: #3851a6;
    }
    .emp-detail {
        color: #555f82;
        font-size: 1rem;
        margin-bottom: 7px;
    }
    .emp-actions {
        margin-top: 16px;
    }
    .emp-actions .btn {
        border-radius: 7px;
        font-size: .99rem;
        font-weight: 500;
        margin-right: 8px;
    }
    .emp-actions .btn-edit {
        background: #5a8dee;
        color: #fff;
        border: none;
    }
    .emp-actions .btn-edit:hover {
        background: #4e5bf2;
    }
    .emp-actions .btn-delete {
        background: #f84646;
        color: #fff;
        border: none;
    }
    .emp-actions .btn-delete:hover {
        background: #d12f2f;
    }
    </style>
</head>
<body>
<div class="container">
    <div class="header-bar">
        <h2>Employees</h2>
        <g:link controller="employee" action="create" class="add-btn text-decoration-none">+ Add Employee</g:link>
    </div>
    <div class="row">
        <g:each in="${employeeList}" var="emp">
            <div class="col-lg-4 col-md-6 col-12">
                <div class="emp-card">
                    <div class="emp-name">
                        ${emp.name}
                        <span class="badge bg-light text-primary ms-2">${emp.department?.name}</span>
                    </div>
                    <div class="emp-detail"><b>Designation:</b> ${emp.designation}</div>
                    <div class="emp-detail"><b>Joining Date:</b> <g:formatDate date="${emp.joiningDate}" format="yyyy-MM-dd"/></div>
                    <div class="emp-detail">
                        <b>Devices:</b>
                        <g:if test="${emp.deviceAssignments}">
                            <g:each in="${emp.deviceAssignments}" var="da" status="i">
                                ${da.device?.name}<g:if test="${i < emp.deviceAssignments.size()-1}">, </g:if>
                            </g:each>
                        </g:if>
                        <g:else>
                            None
                        </g:else>
                    </div>
                    <div class="emp-actions">
                        <g:link controller="employee" action="edit" id="${emp.id}" class="btn btn-edit me-1">Edit</g:link>
                        <g:form controller="employee" action="delete" id="${emp.id}" method="POST" style="display:inline;">
                            <button type="submit" class="btn btn-delete" onclick="return confirm('Delete this employee?');">Delete</button>
                        </g:form>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>
</body>
</html>
