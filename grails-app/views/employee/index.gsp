<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System</title>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
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
    .export-btn, .add-btn {
        border: none;
        border-radius: 16px;
        padding: 11px 24px;
        font-size: 1.04rem;
        font-family: 'Poppins',sans-serif;
        font-weight: 700;
        box-shadow: 0 2px 12px #5a8dee2d;
        margin-left: 0.5rem;
        margin-bottom: 0.6rem;
    }
    .export-btn {
        background: linear-gradient(90deg, #20c997 10%, #4e5bf2 90%);
        color: #fff !important;
        transition: background 0.16s, box-shadow 0.18s, transform 0.15s;
    }
    .export-btn:hover {
        background: linear-gradient(90deg, #4e5bf2 10%, #20c997 90%);
        box-shadow: 0 6px 20px #20c9972d;
        transform: translateY(-2px) scale(1.045);
    }
    .add-btn {
        background: linear-gradient(90deg, #ff7f50 15%, #4e5bf2 85%);
        color: #fff !important;
        transition: background 0.2s, box-shadow 0.2s, transform 0.18s;
    }
    .add-btn:hover {
        background: linear-gradient(90deg, #4e5bf2 10%, #ff7f50 100%);
        box-shadow: 0 6px 20px #5a8dee3d;
        transform: translateY(-2px) scale(1.05);
    }
    .logout-btn {
        background: linear-gradient(90deg, #f53737 20%, #f5706b 80%);
        color: #fff !important;
        border: none;
        margin-left: 0.5rem;
    }
    .logout-btn:hover {
        background: linear-gradient(90deg, #f5706b 20%, #f53737 80%);
    }
    /* --------- Search Box --------- */
    .search-section {
        max-width: 760px;
        margin: 0 auto 28px auto;
        padding: 28px 20px 24px 20px;
        border-radius: 18px;
        background: #fff;
        box-shadow: 0 4px 24px #d6e0fb55;
        display: flex;
        flex-wrap: wrap;
        gap: 18px 26px;
        align-items: end;
        justify-content: center;
    }
    .search-section label {
        font-family: 'Poppins', sans-serif;
        font-weight: 700;
        font-size: 1.08rem;
        color: #4e5bf2;
        margin-bottom: 7px;
    }
    .search-section .form-control,
    .search-section .form-select {
        border-radius: 11px;
        font-size: 1.08rem;
        font-weight: 500;
        box-shadow: none;
        border: 1.2px solid #b3b8ec;
    }
    .search-section .search-btn {
        background: linear-gradient(90deg, #4e5bf2 60%, #5a8dee 100%);
        color: #fff;
        font-weight: 700;
        font-size: 1.09rem;
        padding: 10px 40px 10px 18px;
        border-radius: 11px;
        box-shadow: 0 3px 14px #4e5bf225;
        border: none;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: background 0.15s, box-shadow 0.13s, transform 0.13s;
    }
    .search-section .search-btn:hover {
        background: linear-gradient(90deg, #5a8dee 50%, #4e5bf2 100%);
        transform: scale(1.035);
    }
    /* --------- Employee Card Grid --------- */
    .emp-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(330px, 1fr));
        gap: 32px 30px;
        margin-bottom: 60px;
        margin-top: 18px;
        padding-left: 6px;
        padding-right: 6px;
    }
    .emp-card {
        background: #fff;
        border-radius: 22px;
        box-shadow: 0 6px 28px #90a2d955, 0 2px 6px #dae6fa4d;
        padding: 26px 24px 18px 24px;
        transition: box-shadow 0.16s, transform 0.14s;
        min-height: 210px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .emp-card:hover {
        box-shadow: 0 16px 36px #4e5bf245, 0 4px 16px #b3c2f5;
        transform: scale(1.025) translateY(-3px);
        z-index: 2;
        cursor: pointer;
    }
    .emp-name {
        font-size: 1.14rem;
        font-weight: 800;
        color: #32419c;
        font-family: 'Poppins', sans-serif;
        margin-bottom: 3px;
        text-transform: capitalize;
        letter-spacing: 0.01em;
    }
    .emp-detail {
        color: #405584;
        font-size: 1.04rem;
        margin-bottom: 5px;
        font-weight: 500;
    }
    .badge.bg-light {
        font-size: .97rem;
        color: #5a8dee !important;
        background: #f3f6ff !important;
        font-weight: 600;
        border-radius: 8px;
        padding: 4px 15px;
        margin-left: 0.28rem;
        font-family: 'Inter', sans-serif;
    }
    .emp-actions {
        margin-top: 14px;
        display: flex;
        gap: 9px;
    }
    .emp-actions .btn {
        border-radius: 10px;
        font-size: 1.02rem;
        font-weight: 600;
        padding: 7px 20px;
        transition: background 0.17s, box-shadow 0.15s, transform 0.11s;
    }
    .emp-actions .btn-edit { background: linear-gradient(90deg, #4e5bf2 60%, #5a8dee 100%); color: #fff; }
    .emp-actions .btn-edit:hover { background: linear-gradient(90deg, #5a8dee 30%, #4e5bf2 90%);}
    .emp-actions .btn-delete { background: linear-gradient(93deg, #f84646 70%, #ff9980 100%); color: #fff; }
    .emp-actions .btn-delete:hover { background: linear-gradient(90deg, #ff9980 10%, #f84646 90%); }
    /* Responsive Tweaks */
    @media (max-width: 1000px) {
        .header-bar { flex-direction: column; align-items: stretch; }
    }
    @media (max-width: 900px) {
        .emp-grid { gap: 22px 10px; }
        .emp-card { padding: 18px 10px 12px 14px; }
    }
    @media (max-width: 650px) {
        .emp-grid { grid-template-columns: 1fr; gap: 14px 0; }
        .emp-card { padding: 13px 6px 10px 9px; min-height: 150px; }
        .header-bar { padding: 14px 8px; }
    }
    .floating-chart-btn {
        position: fixed;
        right: 38px;
        bottom: 34px;
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
        letter-spacing: 0.05em;
        gap: 10px;
    }
    .floating-chart-btn:hover {
        background: linear-gradient(93deg, #4e5bf2 60%, #ff7f50 100%);
        transform: scale(1.07) translateY(-2.5px);
        box-shadow: 0 12px 32px #a2b6ee50;
        color: #fff !important;
    }
    .flash-fancy {
        max-width: 440px;
        min-width: 260px;
        margin-top: 26px;
        border-radius: 15px;
        font-size: 1.09rem;
        box-shadow: 0 6px 32px #4155be29, 0 1px 2px #dbeafe55;
        padding: 13px 28px 13px 18px;
        background: linear-gradient(90deg, #e3e9fc 60%, #f4f8ff 100%);
        font-family: 'Poppins', 'Inter', sans-serif;
        font-weight: 600;
        letter-spacing: 0.01em;
        display: flex;
        align-items: center;
        gap: 12px;
        transition: all 0.16s;
        opacity: 0.97;
    }
    .flash-fancy .fa-check-circle { color: #20c997; font-size: 1.36rem; }
    .flash-fancy .fa-exclamation-triangle { color: #ff7f50; font-size: 1.36rem; }
    .flash-fancy .btn-close { margin-left: auto; outline: none; }
    @media (max-width: 600px) {
        .flash-fancy { max-width: 98%; font-size: 1rem; padding: 11px 12px; }
    }

    @media (max-width: 700px) {
        .floating-chart-btn { right: 10px; bottom: 16px; font-size: .99rem; padding: 12px 16px 12px 13px; }
    }

    </style>
</head>
<body>
<div class="container">
    <div class="container">
    <!-- Flash Messages -->
        <g:if test="${flash.message}">
            <div class="alert alert-success flash-fancy alert-dismissible fade show mx-auto" role="alert">
                <i class="fa fa-check-circle me-2"></i>
                <span>${flash.message}</span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger flash-fancy alert-dismissible fade show mx-auto" role="alert">
                <i class="fa fa-exclamation-triangle me-2"></i>
                <span>${flash.error}</span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </g:if>
    <!-- Header Bar with Action Buttons -->
    <div class="header-bar">
        <h2>EMS</h2>
        <div class="d-flex align-items-center flex-wrap gap-2">
            <g:link controller="employee" action="exportExcel" class="export-btn text-decoration-none">
                <span style="display:inline-flex;align-items:center;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="#fff" class="me-1" viewBox="0 0 24 24">
                        <path d="M19 2H8c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 10H8V4h11v8zm-7 6v-2H8c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2v-6c0-1.1-.9-2-2-2h-4zm0 2h4v6H8v-6h4z"/>
                    </svg>
                    Export to Excel
                </span>
            </g:link>
            <g:link controller="employee" action="agGrid" class="export-btn text-decoration-none me-2" style="background:linear-gradient(93deg,#4155be,#4e5bf2);">
                <span style="display:inline-flex;align-items:center;">
                    <i class="fa-solid fa-table-cells-large me-1"></i>
                </span>
            </g:link>
            <g:if test="${session.userRole == 'ADMIN'}">
                <g:link controller="employee" action="create" class="add-btn text-decoration-none ms-2">+ Add Employee</g:link>
            </g:if>
            <g:link controller="user" action="logout" class="add-btn logout-btn text-decoration-none">⎋ Logout</g:link>
        </div>
    </div>

    <!-- Search Section -->
    <form method="get" class="search-section" style="margin-bottom: 0;">
        <div style="flex:2; min-width:210px;">
            <label for="employeeName">Employee Name</label>
            <input type="text" name="employeeName" id="employeeName" class="form-control" value="${params.employeeName ?: ''}" placeholder="Search by name" autocomplete="off"/>
        </div>
        <div style="flex:2; min-width:180px;">
            <label for="department">Department</label>
            <select name="department" id="department" class="form-select">
                <option value="">All Departments</option>
                <g:each in="${departmentList}" var="dept">
                    <option value="${dept.name}" <g:if test="${params.department == dept.name}">selected</g:if>>${dept.name}</option>
                </g:each>
            </select>
        </div>
        <div style="flex:1; min-width:110px;">
            <button type="submit" class="search-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" fill="#fff" viewBox="0 0 20 20"><path d="M12.9 14.32a8 8 0 1 1 1.41-1.41l5.39 5.38-1.4 1.41-5.4-5.39zM8 14a6 6 0 1 0 0-12 6 6 0 0 0 0 12z"/></svg>
                Search
            </button>
        </div>
    </form>

    <!-- Employee Cards Grid -->
    <div class="emp-grid">
        <g:if test="${employeeList && employeeList.size() > 0}">
            <g:each in="${employeeList}" var="emp">
                <div class="emp-card">
                    <div>
                        <div class="emp-name">
                            ${emp.name}
                            <span class="badge bg-light">${emp.department?.name}</span>
                        </div>
                        <div class="emp-detail"><b>Email:</b> ${emp.email}</div>
                        <div class="emp-detail"><b>Designation:</b> ${emp.designation}</div>
                        <div class="emp-detail"><b>Joining Date:</b> <g:formatDate date="${emp.joiningDate}" format="yyyy-MM-dd"/></div>
                        <div class="emp-detail">
                            <b>Devices:</b>
                            <g:if test="${emp.deviceAssignments && emp.deviceAssignments.size() > 0}">
                                <g:each in="${emp.deviceAssignments}" var="da" status="i">
                                    ${da.device?.name}<g:if test="${i < emp.deviceAssignments.size()-1}">, </g:if>
                                </g:each>
                            </g:if>
                            <g:else>
                                <span style="color:#c53c3c;">None</span>
                            </g:else>
                        </div>
                    </div>
                    <g:if test="${session.userRole == 'ADMIN'}">
                        <div class="emp-actions">
                            <g:link controller="employee" action="createUserFromEmployee" params="[id: emp.id]" class="btn btn-outline-primary me-2" title="Create User Account">
                                <i class="fa-solid fa-user-plus"></i>
                            </g:link>
                            <g:link controller="employee" action="edit" id="${emp.id}" class="btn btn-edit me-1">Edit</g:link>
                            <g:form controller="employee" action="delete" id="${emp.id}" method="POST" style="display:inline;">
                                <button type="submit" class="btn btn-delete" onclick="return confirm('Delete this employee?');">Delete</button>
                            </g:form>
                        </div>
                    </g:if>
                </div>
            </g:each>
        </g:if>
        <g:else>
            <div style="grid-column: 1/-1; text-align: center; color: #5669d6; font-size: 1.2rem; margin-top: 32px;">
                No employees found.
            </div>
        </g:else>
    </div>
</div>
<a href="${createLink(controller:'employee', action:'pieChart')}"
   class="floating-chart-btn"
   title="View Employee Department Pie Chart">
    <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#fff" class="me-2" viewBox="0 0 16 16">
        <path d="M15.985 8.5A7.5 7.5 0 1 1 8 .015V8.5h7.485z"/>
        <path d="M8 1a7 7 0 1 0 7 7H8V1z" fill="#ffc463"/>
    </svg>
    View Department Chart
</a>
</body>
</html>
