<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jobportal.dao.JobDAO, com.jobportal.model.Job" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Job | JobPortal</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        .popup {
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
            opacity: 1;
            transition: opacity 1s ease;
        }
        .success { background: #d4edda; color: #155724; }
        .error { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>

<%@ include file="includes/navbarRecruiter.jsp" %>

<div class="form-container">
    <div class="form-box">

        <h2>Edit Job Details</h2>
        <p>Update the job information below and click “Save Changes”.</p>

        <!-- ✅ POPUP MESSAGE -->
        <%
            String status = request.getParameter("status");
            if ("updated".equals(status)) {
        %>
            <div class="popup success" id="popupMsg">✅ Job updated successfully!</div>
        <% } else if ("error".equals(status)) { %>
            <div class="popup error" id="popupMsg">❌ Error updating job!</div>
        <% } %>

        <script>
            setTimeout(() => {
                let box = document.getElementById("popupMsg");
                if (box) {
                    box.style.opacity = "0";
                    setTimeout(() => box.remove(), 1000);
                }
            }, 2000);
        </script>

        <%
            String jobIdParam = request.getParameter("id");
            Job job = null;

            if (jobIdParam != null && !jobIdParam.isEmpty()) {
                int jobId = Integer.parseInt(jobIdParam);
                JobDAO jobDAO = new JobDAO();
                job = jobDAO.getJobById(jobId);
            }

            if (job == null) {
        %>
            <p style="color:red; text-align:center;">❌ Job not found or invalid ID.</p>
            <p style="text-align:center;"><a href="manageJobs.jsp" class="btn">← Back to Manage Jobs</a></p>
        <%
            return;
            }
        %>

        <form action="UpdateJobServlet" method="post" class="job-form">

            <input type="hidden" name="jobId" value="<%= job.getJobId() %>">

            <label>Job Title:</label>
            <input type="text" name="title" value="<%= job.getTitle() %>" required>

            <label>Company:</label>
            <input type="text" name="company" value="<%= job.getCompany() %>" required>

            <label>Location:</label>
            <input type="text" name="location" value="<%= job.getLocation() %>" required>

            <label>Salary Range:</label>
            <input type="text" name="salaryRange" value="<%= job.getSalaryRange() %>">

            <label>Description:</label>
            <textarea name="description" rows="4" required><%= job.getDescription() %></textarea>

            <div class="form-buttons">
                <button type="submit" class="btn-submit">💾 Save Changes</button>
                <a href="manageJobs.jsp" class="btn-cancel">Cancel</a>
            </div>

        </form>
    </div>
</div>

<div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
</div>

</body>
</html>
