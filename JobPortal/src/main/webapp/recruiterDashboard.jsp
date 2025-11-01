
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Recruiter Dashboard | JobPortal</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <%@ include file="includes/navbarRecruiter.jsp" %>

  <div class="container">
    <div class="box">
      <h2>Welcome, Recruiter!</h2>
      <p>Manage job listings, review applications, and connect with top talent.</p>

      <div class="dashboard-actions">
        <a href="post_job.jsp" class="action-btn dashboard-btn">Post New Job</a>
        <a href="manageJobs.jsp" class="action-btn dashboard-btn">Manage Jobs</a>
      </div>
    </div>
  </div>

  <div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
  </div>
</body>
</html>
