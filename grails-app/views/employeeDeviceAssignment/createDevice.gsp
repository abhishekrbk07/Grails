<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Assign Device to Employee</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Poppins:wght@500&display=swap" rel="stylesheet" />

    <style>
    body {
        font-family: 'Inter', sans-serif;
        background-color: #f4f7fa;
        margin: 0;
        padding: 40px 15px;
        display: flex;
        justify-content: center;
    }

    .container {
        background: white;
        max-width: 480px;
        width: 100%;
        padding: 36px 48px;
        border-radius: 16px;
        box-shadow: 0 16px 40px rgb(0 0 0 / 0.1);
    }

    h2 {
        font-family: 'Poppins', sans-serif;
        font-weight: 600;
        font-size: 1.9rem;
        color: #4e5bf2;
        margin-bottom: 24px;
        text-align: center;
    }

    label {
        display: block;
        font-weight: 600;
        color: #3a3f58;
        margin-bottom: 8px;
        font-size: 1rem;
    }

    select, button {
        width: 100%;
        padding: 12px 16px;
        border-radius: 12px;
        border: 1.8px solid #d1d9e6;
        font-size: 1rem;
        font-family: 'Inter', sans-serif;
        color: #2b2f48;
        transition: border-color 0.3s ease;
        box-sizing: border-box;
    }

    select:focus {
        border-color: #4e5bf2;
        box-shadow: 0 0 8px rgba(78, 91, 242, 0.3);
        outline: none;
    }

    button {
        background: linear-gradient(90deg, #4e5bf2 0%, #5a8dee 100%);
        color: white;
        font-weight: 600;
        border: none;
        margin-top: 30px;
        cursor: pointer;
        box-shadow: 0 6px 14px rgba(78, 91, 242, 0.35);
        transition: background 0.4s ease;
    }

    button:hover {
        background: linear-gradient(90deg, #5a8dee 0%, #4e5bf2 100%);
        box-shadow: 0 8px 24px rgba(78, 91, 242, 0.55);
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 28px;
        font-family: 'Poppins', sans-serif;
        color: #4e5bf2;
        font-weight: 600;
        text-decoration: none;
        letter-spacing: 0.02em;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #2b2f48;
    }

    .form-group {
        margin-bottom: 24px;
    }
    </style>
</head>
<body>
<div class="container">
    <h2>Assign Device to Employee</h2>

    <g:form controller="employeeDeviceAssignment" action="save" method="POST">
        <div class="form-group">
            <label for="employeeId">Employee:</label>
            <g:select name="employeeId" from="${employees}" optionKey="id" optionValue="name" noSelection="['':'-- Select Employee --']" required="true"/>
        </div>

        <div class="form-group">
            <label for="deviceType">Device Type:</label>
            <select name="deviceType" id="deviceType" required>
                <option value="" disabled selected>-- Select Device Type --</option>
                <option value="Laptop">Laptop</option>
                <option value="Monitor">Monitor</option>
                <option value="Mouse">Mouse</option>
                <option value="Headphone">Headphone</option>
            </select>
        </div>

        <button type="submit">Assign Device</button>
    </g:form>

    <g:link action="index" class="back-link">← Back to Assignments</g:link>
</div>
</body>
</html>
