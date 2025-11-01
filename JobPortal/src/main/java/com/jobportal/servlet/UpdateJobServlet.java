package com.jobportal.servlet;

import com.jobportal.dao.JobDAO;
import com.jobportal.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateJobServlet")
public class UpdateJobServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("jobId"));
        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
        String salaryRange = request.getParameter("salaryRange");
        String description = request.getParameter("description");

        Job job = new Job();
        job.setJobId(jobId);
        job.setTitle(title);
        job.setCompany(company);
        job.setLocation(location);
        job.setSalaryRange(salaryRange);
        job.setDescription(description);

        JobDAO jobDAO = new JobDAO();
        boolean updated = jobDAO.updateJob(job);

        if (updated) {
            response.sendRedirect("editJob.jsp?id=" + jobId + "&status=updated");
        } else {
            response.sendRedirect("editJob.jsp?id=" + jobId + "&status=error");
        }
    }
}
