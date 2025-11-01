
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Post Job | JobPortal</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <%@ include file="includes/navbarRecruiter.jsp" %>

 <div class="form-container">
  <div class="form-box">
    <h2>Post a New Job</h2>

    <form action="PostJobServlet" method="post" class="job-form">

      <label>Job Title:</label>
      <input type="text" name="title" required>

      <label>Company:</label>
      <input type="text" name="company" required>

      <label>Location:</label>
      <input type="text" name="location">

      <label>Skills Required:</label>
      <input type="text" name="skillsRequired">

      <label>Job Description:</label>
      <textarea name="description" rows="4" required></textarea>

      <label>Salary Range:</label>
      <input type="text" name="salary">

      <div class="form-buttons">
        <button type="submit" class="btn-submit">💾 Post Job</button>
        <a href="recruiterDashboard.jsp" class="btn-cancel">Cancel</a>
      </div>

    </form>
  </div>
</div>

  <div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
  </div>
</body>
</html>
