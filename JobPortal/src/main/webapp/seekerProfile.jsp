<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jobportal.dao.UserDAO, com.jobportal.model.User" %>

<%
    Integer userId = (Integer) session.getAttribute("id");

    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Job Seeker Profile | JobPortal</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        .profile-section {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            margin-bottom: 35px;
            width: 500px;
            margin-left: auto;
            margin-right: auto;
        }

        .section-title {
            font-size: 22px;
            font-weight: bold;
            color: #0a2540;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }

        /* ✅ Popup auto fade */
        .popup {
            width: 80%;
            margin: 15px auto;
            padding: 12px;
            text-align: center;
            border-radius: 8px;
            animation: fadeOut 4s forwards;
        }

        .success-popup {
            background: #d4edda;
            color: #155724;
        }

        .error-popup {
            background: #f8d7da;
            color: #721c24;
        }

        @keyframes fadeOut {
            0% { opacity: 1; }
            70% { opacity: 1; }
            100% { opacity: 0; display:none; }
        }
    </style>
</head>

<body>

<%@ include file="includes/navbarSeeker.jsp" %>

<div class="container">
    <div>

        <% String status = request.getParameter("status"); %>

        <% if ("infoUpdated".equals(status)) { %>
            <div class="popup success-popup">✅ Profile Information Updated!</div>
        <% } else if ("passwordUpdated".equals(status)) { %>
            <div class="popup success-popup">✅ Password Changed Successfully!</div>
        <% } else if ("error".equals(status)) { %>
            <div class="popup error-popup">❌ Something went wrong. Try again.</div>
        <% } %>

        <!-- ✅ Section 1 — Update Info -->
        <div class="profile-section">
            <div class="section-title">Update Personal Information</div>

            <form action="UpdateInfoServlet" method="post">
                <input type="hidden" name="id" value="<%= user.getId() %>">

                <label>Full Name:</label>
                <input type="text" name="full_name" value="<%= user.getFullName() %>" required>

                <label>Email:</label>
                <input type="email" name="email" value="<%= user.getEmail() %>" required>

                <button type="submit" class="btn">Save Changes</button>
            </form>
        </div>

        <!-- ✅ Section 2 — Change Password -->
        <div class="profile-section">
            <div class="section-title">Change Password</div>

            <form action="ChangePasswordServlet" method="post">
                <input type="hidden" name="id" value="<%= user.getId() %>">

                <label>New Password:</label>
                <input type="password" name="new_password" required>

                <label>Confirm Password:</label>
                <input type="password" name="confirm_password" required>

                <button type="submit" class="btn">🔐 Update Password</button>
                <a href="seekerDashboard.jsp" class="btn">Cancel</a>
            </form>
        </div>

    </div>
</div>

<div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
</div>

</body>
</html>
