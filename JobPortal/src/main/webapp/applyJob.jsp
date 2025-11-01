<%@ page import="com.jobportal.dao.JobDAO, com.jobportal.model.Job" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Apply Job | JobPortal</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
   .box {
	text-align: center;
    }
  .box p {
     margin: 8px 0;
    font-size: 16px;
    }

.popup {
	width: 90%;
	margin: 10px auto;
	padding: 12px;
	border-radius: 8px;
	font-weight: 500;
	text-align: center;
	transition: opacity 1s ease-out;
}

.success {
	background: #d4edda;
	color: #155724;
}

.error {
	background: #f8d7da;
	color: #721c24;
}

.decision-buttons {
	display: flex;
	justify-content: center;
	gap: 20px;
	margin-top: 25px;
}

.btn-submit, .btn-cancel {
	padding: 12px;
	text-align: center;
	border-radius: 8px;
	cursor: pointer;
	font-weight: 500;
}

.btn-submit {
	background-color: #0a2540;
	color: white;
}

.btn-submit:hover {
	background-color: #4ea8de;
}

.btn-cancel {
	background-color: #e63946;
	color: white;
	text-decoration: none;
}

.btn-cancel:hover {
	background-color: #112a52;
}


.details-box {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;     /* centers the block */
    justify-content: center;
    margin-bottom: 20px;
}

.details-box p {
    width: 60%;              /* controls alignment width */
    text-align: center;        /* keeps text left aligned */
    font-size: 16px;
    margin: 8px 0;
}

</style>
</head>
<body>

<%@ include file="includes/navbarSeeker.jsp" %>

<%
    String jobIdParam = request.getParameter("jobId");
    Job job = null;

    if (jobIdParam != null) {
        int jobId = Integer.parseInt(jobIdParam);
        JobDAO jobDAO = new JobDAO();
        job = jobDAO.getJobById(jobId);
    }

    if (job == null) {
%>
        <div class="popup error">❌ Invalid Job or Job Not Found!</div>
<%
        return;
    }
%>

<div class="container">
    <div class="box">

			<div class="details-box">
			     <h2>Confirm Job Application</h2>
				<p>
					<b>Are you sure you want to apply for:</b>
					<%=job.getTitle()%></p>
				<p>
					<b>Company:</b>
					<%=job.getCompany()%></p>
				<p>
					<b>Location:</b>
					<%=job.getLocation()%></p>
			</div>
			<!-- ✅ Popup will be inserted here by JavaScript -->

        <div class="decision-buttons">
            <!-- ✅ AJAX Apply -->
            <button type="button" class="btn-submit" onclick="submitApplication(<%= job.getJobId() %>)">
                Confirm Apply
            </button>

            <!-- ✅ Cancel -->
            <a href="viewJobs.jsp" class="btn-cancel">Cancel</a>
        </div>

    </div>
</div>

<div class="footer">
    © 2025 Kavi Priyanka. All Rights Reserved.
</div>

<!-- ✅ AJAX SCRIPT -->
<script>
function submitApplication(jobId) {

    fetch("ApplyJobServlet", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "jobId=" + jobId
    })
    .then(response => response.json())
    .then(data => {

        // ✅ Create popup
        let popup = document.createElement("div");
        popup.classList.add("popup");

        if (data.status === "success") {
            popup.classList.add("success");
        } else {
            popup.classList.add("error");
        }

        popup.innerText = data.message;
        popup.style.opacity = "1";

        // ✅ Insert popup above buttons
        document.querySelector(".box").prepend(popup);

        // ✅ Fade out after 2 sec
        setTimeout(() => {
            popup.style.opacity = "0";
        }, 2000);

        // ✅ Remove after fade (3 sec total)
        setTimeout(() => {
            popup.remove();
        }, 3000);
    });
}
</script>

</body>
</html>
