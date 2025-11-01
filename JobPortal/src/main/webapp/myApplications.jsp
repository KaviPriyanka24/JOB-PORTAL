<%@ page import="java.util.*, com.jobportal.dao.ApplicationDAO, com.jobportal.model.Application" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Applications | JobPortal</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        .popup-success {
            background: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 6px;
            width: 80%;
            margin: 10px auto;
            text-align: center;
            animation: fadeOut 4s forwards;
        }
        .popup-error {
            background: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 6px;
            width: 80%;
            margin: 10px auto;
            text-align: center;
            animation: fadeOut 4s forwards;
        }
        @keyframes fadeOut {
            0% {opacity: 1;}
            70% {opacity: 1;}
            100% {opacity: 0;}
        }
    </style>

</head>
<body>

<%@ include file="includes/navbarSeeker.jsp" %>

<div class="container">
    <div class="box" style="width:90%; max-width:1000px;">

        <h2>My Applications</h2>
        <p>Track all jobs you have applied for.</p>

        <!-- ✅ Popup Messages -->
        <%
            String status = request.getParameter("status");
            if ("deleted".equals(status)) {
        %>
            <div class="popup-success">✅ Application Withdrawn Successfully!</div>
        <% } else if ("error".equals(status)) { %>
            <div class="popup-error">❌ Something went wrong!</div>
        <% } %>

        <%
            Integer seekerId = (Integer) session.getAttribute("id");
            ApplicationDAO appDAO = new ApplicationDAO();
            List<Application> list = appDAO.getApplicationsBySeeker(seekerId);

            if (list.isEmpty()) {
        %>
            <p style="text-align:center;">You have not applied for any jobs yet.</p>
        <%
            } else {
        %>

        <table border="1" cellpadding="10" cellspacing="0" style="width:100%; margin-top:20px;">
            <tr style="background-color:#0a192f; color:white;">
                <th>Job Title</th>
                <th>Company</th>
                <th>Location</th>
                <th>Salary</th>
                <th>Applied On</th>
                <th>Action</th>
            </tr>

            <% for (Application app : list) { %>
            <tr>
                <td><%= app.getJobTitle() %></td>
                <td><%= app.getCompany() %></td>
                <td><%= app.getLocation() %></td>
                <td><%= app.getSalary() %></td>
                <td><%= app.getAppliedAt() %></td>
                <td style="text-align:center;">
                    <a href="WithdrawApplicationServlet?appId=<%= app.getAppId() %>"
                       class="action-btn delete-btn">
                    Withdraw</a>
                </td>
            </tr>
            <% } %>
        </table>

        <% } %>

    </div>
</div>

<div class="footer">© 2025 Kavi Priyanka. All Rights Reserved.</div>

</body>
</html>
