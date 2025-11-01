<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.jobportal.dao.ApplicationDAO, com.jobportal.model.Application" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Applicants | JobPortal</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<%@ include file="includes/navbarRecruiter.jsp" %>

<div class="container">
    <div class="box" style="width: 90%; max-width: 900px; text-align: left;">

        <%
            String jobIdParam = request.getParameter("jobId");
            if (jobIdParam == null) {
        %>
                <p style="color:red;">❌ Invalid Job ID</p>
                <a href="manageJobs.jsp" class="btn">Back</a>
        <%
                return;
            }

            int jobId = Integer.parseInt(jobIdParam);

            ApplicationDAO appDAO = new ApplicationDAO();
            List<Application> applicants = appDAO.getApplicantsByJob(jobId);
        %>

        <h2 style="text-align:center;">Applicants List</h2>
        <p style="text-align:center;">Total Applicants: <%= applicants.size() %></p>

        <%
            if (applicants.isEmpty()) {
        %>
                <p style="text-align:center;">No applicants yet for this job.</p>
                <a href="manageJobs.jsp" class="btn">Back to Jobs</a>
        <%
            } else {
        %>

        <table border="1" cellpadding="10" cellspacing="0" style="width:100%; margin-top:20px;">
            <tr style="background-color:#0a192f; color:white;">
                <th>Applicant Name</th>
                <th>Email</th>
                <th>Applied At</th>
            </tr>

            <% for (Application app : applicants) { %>
                <tr>
                    <td><%= app.getSeekerName() %></td>
                    <td><%= app.getSeekerEmail() %></td>
                    <td><%= app.getAppliedAt() %></td>
                </tr>
            <% } %>

        </table>

        <br>
        <a href="manageJobs.jsp" class="btn">Back to Manage Jobs</a>

        <% } %>

    </div>
</div>

<div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
</div>

</body>
</html>