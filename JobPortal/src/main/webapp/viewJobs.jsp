<%@ page import="java.util.*, com.jobportal.model.Job, com.jobportal.dao.JobDAO, com.jobportal.dao.ApplicationDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Available Jobs | JobPortal</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%@ include file="includes/navbarSeeker.jsp" %>

<div class="container">
    <div class="box" style="width: 80%; max-width: 900px; text-align: left;">

        <h2 style="text-align:center;">Available Job Listings</h2>
        <br>

        <!-- ✅ POPUP: Applied or Already Applied -->
        <%
            String status = request.getParameter("status");
            if ("success".equals(status)) {
        %>
                <div class="popup success">✅ Job Applied Successfully!</div>
        <%
            } else if ("exists".equals(status)) {
        %>
                <div class="popup error">⚠ You have already applied for this job.</div>
        <%
            }
        %>

        <%
            JobDAO jobDAO = new JobDAO();
            ApplicationDAO appDAO = new ApplicationDAO();

            Integer seekerId = (Integer) session.getAttribute("id");
            List<Job> jobList = jobDAO.getAllJobs();
        %>

        <% if (jobList != null && !jobList.isEmpty()) { %>

            <table border="1" cellpadding="10" cellspacing="0" style="width: 100%; margin-top: 20px;">
                <tr style="background-color: #0a192f; color: white;">
                    <th>Title</th>
                    <th>Company</th>
                    <th>Location</th>
                    <th>Salary</th>
                    <th>Action</th>
                </tr>

                <% for (Job job : jobList) { 

                       boolean applied = appDAO.hasApplied(job.getJobId(), seekerId);
                %>

                <tr>
                    <td><%= job.getTitle() %></td>
                    <td><%= job.getCompany() %></td>
                    <td><%= job.getLocation() %></td>
                    <td><%= job.getSalaryRange() %></td>

                    <td style="text-align:center;">

                        <% if (applied) { %>

                            <!-- ✅ Already applied -->
                            <span style="color: gray; font-weight: bold;">Applied</span>

                        <% } else { %>

                            <!-- ✅ Apply button -->
                            <a href="applyJob.jsp?jobId=<%= job.getJobId() %>"
                               class="action-btn edit-btn">Apply</a>

                        <% } %>

                    </td>
                </tr>

                <% } %>

            </table>

        <% } else { %>

            <p style="text-align:center;">No jobs available right now. Please check back later!</p>

        <% } %>

    </div>
</div>

<div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
</div>

</body>
</html>
