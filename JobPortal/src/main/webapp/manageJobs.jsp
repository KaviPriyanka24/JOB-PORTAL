
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page
	import="java.util.*, com.jobportal.dao.JobDAO, com.jobportal.model.Job"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Jobs | JobPortal</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@ include file="includes/navbarRecruiter.jsp"%>

	<div class="container">
		<div class="box">
			<h2>Manage Your Job Listings</h2>
			<p>View, edit, or delete the jobs you’ve posted.</p>

			<%
            String status = request.getParameter("status");
            if ("updated".equals(status)) {
        %>
			<p style="color: green;">✅ Job updated successfully!</p>
			<%
            } else if ("deleted".equals(status)) {
        %>
			<p style="color: green;">✅ Job deleted successfully!</p>
			<%
            } else if ("error".equals(status)) {
        %>
			<p style="color: red;">❌ Error occurred. Please try again.</p>
			<%
            }
        %>

			<table border="1" cellpadding="10" cellspacing="0"
				style="width: 100%; margin-top: 20px;">
				<tr style="background-color: #0a192f; color: white;">
					<th>ID</th>
					<th>Title</th>
					<th>Company</th>
					<th>Location</th>
					<th>Salary Range</th>
					<th>Actions</th>
				</tr>

				<%
                JobDAO jobDAO = new JobDAO();
                List<Job> jobList = jobDAO.getAllJobs();
                if (jobList != null && !jobList.isEmpty()) {
                    for (Job job : jobList) {
            %>
				<tr>
					<td><%= job.getJobId() %></td>
					<td><%= job.getTitle() %></td>
					<td><%= job.getCompany() %></td>
					<td><%= job.getLocation() %></td>
					<td><%= job.getSalaryRange() %></td>
					<td>
						<div class="action-group">
							<a href="editJob.jsp?id=<%=job.getJobId()%>"
								class="action-btn edit-btn">Edit</a> <a
								href="DeleteJobServlet?id=<%=job.getJobId()%>"
								class="action-btn delete-btn"
								onclick="return confirm('Are you sure you want to delete this job?');">Delete</a>
							<a href="viewApplicants.jsp?jobId=<%=job.getJobId()%>"
								class="action-btn edit-btn">Applicants</a>
						</div>
					</td>

				</tr>
				<%
                    }
                } else {
            %>
				<tr>
					<td colspan="6" style="text-align: center;">No jobs found.</td>
				</tr>
				<%
                }
            %>
			</table>

			<div style="margin-top: 20px;">
				<a href="recruiterDashboard.jsp" class="btn">Back to Dashboard</a>
			</div>
		</div>
	</div>

	<div class="footer">© Kavi Priyanka. All Rights Reserved.</div>
</body>
</html>
