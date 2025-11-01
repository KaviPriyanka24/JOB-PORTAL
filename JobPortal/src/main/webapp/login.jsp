<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login | Smart Job Portal</title>

<link rel="stylesheet" href="css/style.css">

<style>
    body { background-color:#f4f6f8; }

    .page-wrapper {
        padding-top: 20px;
        padding-bottom: 80px;
        display:flex;
        justify-content:center;
    }

    .login-container {
        width: 400px;
        background:#fff;
        padding:40px 35px;
        border-radius:16px;
        box-shadow:0 8px 35px rgba(0,0,0,0.12);
        text-align:center;
        animation:fadeIn 0.7s ease-in-out;
    }

    h2 { color:#0a2540; margin-bottom:25px; }

    label {
        display:block;
        text-align:left;
        font-weight:500;
        margin-bottom:6px;
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

    .message { margin-top:15px; }
    .message a { font-weight:600; color:#0a2540; text-decoration:none; }

    /* Popup fade */
    .popup {
        padding:12px;
        border-radius:8px;
        font-weight:500;
        margin-top:20px;
        text-align:center;
        animation:fadeOut 4s forwards;
    }
    .error { background:#f8d7da; color:#721c24; }

    @keyframes fadeOut {
        0% {opacity:1;}
        70% {opacity:1;}
        100% {opacity:0;}
    }
</style>
</head>

<body>

<!-- ✅ Navbar -->
<%@ include file="includes/navbar.jsp" %>

<div class="page-wrapper">

<div class="login-container">

    <h2>Welcome Back</h2>

    <form action="LoginServlet" method="post">

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

        <button type="submit">Login</button>

        <div class="message">
            Don’t have an account?
            <a href="register.jsp">Register</a>
        </div>
    </form>

    <% if ("error".equals(request.getParameter("msg"))) { %>
        <div class="popup error">❌ Invalid email, password, or user type!</div>
    <% } %>

</div>
</div>

<!-- ✅ Footer -->
<div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
</div>

</body>
</html>
