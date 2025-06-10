<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Google Fonts: Poppins & Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@600;800&display=swap" rel="stylesheet"/>
    <style>
    html, body {
        background: linear-gradient(120deg, #e3e9fc 0%, #f4f8ff 100%);
        font-family: 'Inter', sans-serif;
        min-height: 100vh;
        margin: 0;
        padding: 0;
    }
    .header-bar {
        background: linear-gradient(93deg, #4e5bf2 40%, #5a8dee 100%);
        color: #fff;
        border-radius: 20px;
        margin: 38px 0 48px 0;
        box-shadow: 0 12px 32px 0 #a2b6ee4d;
        padding: 30px 38px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .header-bar h2 {
        font-family: 'Poppins', sans-serif;
        font-size: 2.1rem;
        font-weight: 800;
        margin: 0;
        letter-spacing: 0.5px;
    }
    .add-btn {
        background: linear-gradient(90deg, #ff7f50 15%, #4e5bf2 85%);
        color: #fff !important;
        padding: 12px 32px;
        border-radius: 16px;
        border: none;
        font-weight: 700;
        font-family: 'Poppins', sans-serif;
        font-size: 1.05rem;
        box-shadow: 0 2px 12px #5a8dee2d;
        transition: background 0.2s, box-shadow 0.2s, transform 0.18s;
    }
    .add-btn:hover {
        background: linear-gradient(90deg, #4e5bf2 10%, #ff7f50 100%);
        box-shadow: 0 6px 20px #5a8dee3d;
        transform: translateY(-2px) scale(1.05);
    }
    .emp-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 8px 32px 0 #a7b9f233, 0 1.5px 3.5px #dee8fd;
        padding: 30px 28px 23px 28px;
        margin-bottom: 38px;
        transition: box-shadow 0.21s, transform 0.15s;
        position: relative;
        overflow: hidden;
        min-height: 240px;
    }
    .emp-card:hover {
        box-shadow: 0 16px 40px 0 #4054c979, 0 4px 18px #dbeafe;
        transform: translateY(-6px) scale(1.02);
        z-index: 2;
    }
    .emp-name {
        font-size: 1.28rem;
        font-weight: 700;
        color: #334099;
        font-family: 'Poppins', sans-serif;
        margin-bottom: 0.15rem;
    }
    .badge.bg-light {
        font-size: .98rem;
        color: #5a8dee !important;
        background: #f3f6ff !important;
        font-weight: 600;
        border-radius: 8px;
        padding: 4px 15px;
        margin-left: 0.33rem;
        letter-spacing: .3px;
        font-family: 'Inter', sans-serif;
    }
    .emp-detail {
        color: #495583;
        font-size: 1.04rem;
        margin-bottom: 8px;
        font-weight: 500;
        letter-spacing: .2px;
    }
    .emp-actions {
        margin-top: 22px;
        display: flex;
        gap: 12px;
    }
    .emp-actions .btn {
        border-radius: 9px;
        font-size: 1.03rem;
        font-weight: 600;
        font-family: 'Poppins', sans-serif;
        padding: 7px 22px;
        box-shadow: 0 2px 8px #e3e9fc50;
        transition: background 0.18s, box-shadow 0.18s, transform 0.14s;
    }
    .emp-actions .btn-edit {
        background: linear-gradient(90deg, #4e5bf2 60%, #5a8dee 100%);
        color: #fff;
        border: none;
    }
    .emp-actions .btn-edit:hover {
        background: linear-gradient(90deg, #5a8dee 30%, #4e5bf2 90%);
        box-shadow: 0 3px 14px #4e5bf258;
        transform: scale(1.07);
    }
    .emp-actions .btn-delete {
        background: linear-gradient(93deg, #f84646 70%, #ff9980 100%);
        color: #fff;
        border: none;
    }
    .emp-actions .btn-delete:hover {
        background: linear-gradient(90deg, #ff9980 10%, #f84646 90%);
        box-shadow: 0 3px 14px #f8464648;
        transform: scale(1.07);
    }
    .emp-card::before {
        content: "";
        position: absolute;
        right: -46px; top: -56px;
        width: 150px; height: 150px;
        background: radial-gradient(circle, #e3e9fc 80%, transparent 100%);
        opacity: 0.55;
        z-index: 1;
    }
    .emp-card .emp-name, .emp-card .emp-detail, .emp-card .badge, .emp-card .emp-actions { position: relative; z-index: 2; }

    /* Floating Chart Button Styles */
    .floating-chart-btn {
        position: fixed;
        right: 36px;
        bottom: 38px;
        z-index: 300;
        display: flex;
        align-items: center;
        padding: 15px 28px 15px 17px;
        font-size: 1.11rem;
        font-family: 'Poppins',sans-serif;
        font-weight: 700;
        background: linear-gradient(93deg, #ff7f50 48%, #4e5bf2 100%);
        color: #fff !important;
        border-radius: 33px;
        box-shadow: 0 6px 24px #b5c2db68, 0 2.5px 8px #dbeafe;
        border: none;
        transition: background 0.16s, transform 0.13s, box-shadow 0.13s;
        text-decoration: none;
    }
    .floating-chart-btn:hover {
        background: linear-gradient(93deg, #4e5bf2 60%, #ff7f50 100%);
        transform: scale(1.07) translateY(-2.5px);
        box-shadow: 0 12px 32px #a2b6ee50;
        color: #fff !important;
    }
    @media (max-width: 600px) {
        .floating-chart-btn { right: 10px; bottom: 16px; font-size: .99rem; padding: 12px 16px 12px 13px; }
    }
    </style>
</head>
<body>
<div class="container">
    <div class="header-bar">
        <h2>Employee Management System</h2>
        <g:link controller="employee" action="create" class="add-btn text-decoration-none">+ Add Employee</g:link>
    </div>
    <div class="row">
        <g:each in="${employeeList}" var="emp">
            <div class="col-lg-4 col-md-6 col-12">
                <div class="emp-card">
                    <div class="emp-name">
                        ${emp.name}
                        <span class="badge bg-light">${emp.department?.name}</span>
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
                            <span style="color:#c53c3c;">None</span>
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
<a href="${createLink(controller:'employee', action:'pieChart')}" class="floating-chart-btn" title="View Employee Department Pie Chart">
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#fff" class="me-2" viewBox="0 0 16 16"><path d="M15.985 8.5A7.5 7.5 0 1 1 8 .015V8.5h7.485z"/><path d="M8 1a7 7 0 1 0 7 7H8V1z" fill="#ffc463"/></svg>
    View Department Chart
</a>
<g:link controller="employee" action="exportExcel" class="export-btn text-decoration-none ms-2">
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="#fff" class="me-1" viewBox="0 0 24 24"><path d="M19 2H8c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 10H8V4h11v8zm-7 6v-2H8c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2v-6c0-1.1-.9-2-2-2h-4zm0 2h4v6H8v-6h4z"/></svg>
    Export to Excel
</g:link>
</body>
</html>
