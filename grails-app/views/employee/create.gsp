<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Employee</title>

    <!-- Bootstrap and Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@500&display=swap" rel="stylesheet"/>

    <style>
    body {
        font-family: 'Inter', sans-serif;
        background-color: #f0f4fa;
        min-height: 100vh;
        padding: 40px 15px;
    }

    .header-bar {
        background: linear-gradient(135deg, #5a8dee, #4e5bf2);
        color: #fff;
        border-radius: 16px;
        padding: 28px 36px;
        box-shadow: 0 12px 30px rgb(78 91 242 / 0.25);
        margin-bottom: 40px;
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
        font-size: 1.8rem;
        letter-spacing: 0.02em;
    }

    .btn-back {
        background: rgba(255 255 255 / 0.25);
        color: #fff;
        border: 1.5px solid rgba(255 255 255 / 0.6);
        font-weight: 500;
        border-radius: 10px;
        padding: 6px 14px;
        transition: all 0.3s ease;
        text-decoration: none;
        font-size: 0.9rem;
    }

    .btn-back:hover {
        background: rgba(255 255 255 / 0.45);
        border-color: #fff;
        text-decoration: none;
    }

    .card-container {
        max-width: 480px;
        margin: 0 auto;
        background: #fff;
        border-radius: 20px;
        padding: 40px 48px;
        box-shadow: 0 16px 40px rgb(0 0 0 / 0.08);
    }

    label.form-label {
        font-weight: 600;
        color: #3a3f58;
        font-size: 1.05rem;
        margin-bottom: 10px;
        display: block;
        letter-spacing: 0.01em;
    }

    .form-control-lg {
        font-size: 1.05rem;
        padding: 12px 18px;
        border-radius: 12px;
        border: 1.8px solid #d1d9e6;
        transition: border-color 0.3s ease;
        font-family: 'Inter', sans-serif;
        color: #2b2f48;
    }

    .form-control-lg:focus {
        border-color: #4e5bf2;
        box-shadow: 0 0 8px rgb(78 91 242 / 0.3);
        outline: none;
    }

    .text-end {
        margin-top: 30px;
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
        transition: background 0.4s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        box-shadow: 0 6px 14px rgb(78 91 242 / 0.35);
        font-family: 'Poppins', sans-serif;
    }

    .btn-gradient:hover {
        background: linear-gradient(90deg, #5a8dee 0%, #4e5bf2 100%);
        box-shadow: 0 8px 24px rgb(78 91 242 / 0.55);
    }

    .btn-gradient svg {
        width: 20px;
        height: 20px;
        fill: white;
    }
    </style>
</head>

<body>
<div class="container">

    <!-- Header Bar -->
    <div class="header-bar d-flex justify-content-between align-items-center">
        <span>Add New Employee</span>
        <a href="${createLink(controller: 'employee', action: 'index')}" class="btn-back">← Back to List</a>
    </div>

    <!-- Form Card -->
    <div class="card-container">
        <g:form controller="employee" action="save" method="POST">

            <div class="mb-4">
                <label for="name" class="form-label">Full Name</label>
                <g:textField name="name" id="name" class="form-control form-control-lg" required="true" placeholder="John Doe" value="${employee?.name ?: ''}"/>

                <g:hasErrors bean="${employee}" field="name">
                    <div class="text-danger mt-1 small">
                        <g:eachError bean="${employee}" field="name">
                            ${it.defaultMessage}<br/>
                        </g:eachError>
                    </div>
                </g:hasErrors>
            </div>

            <div class="mb-4">
                <label for="email" class="form-label">Email Address</label>
                <g:textField name="email" id="email" class="form-control form-control-lg" required="true" type="email" placeholder="example@mail.com" value="${employee?.email ?: ''}"/>

                <g:hasErrors bean="${employee}" field="email">
                    <div class="text-danger mt-1 small">
                        <g:eachError bean="${employee}" field="email">
                            ${it.defaultMessage}<br/>
                        </g:eachError>
                    </div>
                </g:hasErrors>
            </div>

            <div class="mb-4">
                <label for="department" class="form-label">Department</label>
                <g:select
                        name="department"
                        id="department"
                        from="${['Senior Software Engineer', 'Marketing', 'IT', 'HR', 'Finance' ,'Admin','Manager']}"
                        noSelection="['':'-- Select Department --']"
                        class="form-control form-control-lg"
                        required="true"
                        value="${employee?.department ?: ''}"
                />
            </div>


            <div class="text-end">
                <button type="submit" class="btn btn-gradient">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M19 7v4H5V7H3v10h18V7h-2zM9 14h6v-2H9v2z"/>
                    </svg>
                    Save Employee
                </button>
            </div>

        </g:form>
    </div>
</div>
</body>
</html>
