<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Account | Smart Job Portal</title>

<link rel="stylesheet" href="css/style.css">

<style>
    body { background-color:#f4f6f8; }

    .page-wrapper {
        padding-top:20px;
        padding-bottom:80px;
        display:flex;
        justify-content:center;
    }

    .register-container {
        width:420px;
        background:#fff;
        padding:40px 35px;
        border-radius:16px;
        box-shadow:0 8px 35px rgba(0,0,0,0.12);
        text-align:center;
        animation:fadeIn 0.7s ease-in-out;
    }

    h2 { color:#0a2540; margin-bottom:25px; }

    label { 
        text-align:left; 
        display:block; 
        margin-bottom:6px; 
        font-weight:500; 
        color:#333;
    }

    input, select {
        width:100%;
        padding:12px;
        border-radius:8px;
        border:1px solid #ccc;
        margin-bottom:18px;
        transition:0.3s;
    }

    input:focus, select:focus {
        border-color:#0a2540;
        box-shadow:0 0 6px rgba(10,37,64,0.3);
    }

    button {
        width:100%;
        padding:12px;
        background:#0a2540;
        color:white;
        border:none;
        border-radius:8px;
        font-size:16px;
        font-weight:600;
        cursor:pointer;
        transition:0.3s;
    }
    button:hover { background:#4ea8de; }

    .message { margin-top:10px; }
    .message a { font-weight:600; color:#0a2540; }

    .popup {
        padding:12px;
        margin-top:15px;
        border-radius:8px;
        animation:fadeOut 4s forwards;
        font-weight:500;
    }

    .success { background:#d4edda; color:#155724; }
    .error { background:#f8d7da; color:#721c24; }

</style>
</head>

<body>

<!-- ✅ Navbar -->
<%@ include file="includes/navbarRegister.jsp" %>

<div class="page-wrapper">

<div class="register-container">

    <h2>Create Your Account</h2>

    <form action="RegisterServlet" method="post">

        <label>Full Name</label>
        <input type="text" name="full_name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>User Type</label>
        <select name="user_type" required>
            <option value="">-- Select User Type --</option>
            <option value="seeker">Job Seeker</option>
            <option value="recruiter">Recruiter</option>
        </select>

        <button type="submit">Register</button>

        <div class="message">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </form>

    <!-- ✅ Popup -->
    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
    %>
        <div class="popup success">✅ Registration Successful! Please Login.</div>
    <% } else if ("error".equals(msg)) { %>
        <div class="popup error">❌ Registration Failed! Try again.</div>
    <% } %>

</div>

</div>

<!-- ✅ Footer -->
<div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
</div>


</body>
</html>
