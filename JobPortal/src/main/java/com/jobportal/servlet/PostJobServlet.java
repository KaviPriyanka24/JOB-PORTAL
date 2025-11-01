package com.jobportal.servlet;

import com.jobportal.dao.JobDAO;
import com.jobportal.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String salary = request.getParameter("salary");

        Job job = new Job();
        job.setTitle(title);
        job.setCompany(company);
        job.setLocation(location);
        job.setDescription(description);
        job.setSalaryRange(salary);
        job.setRecruiterId(1); // for now, hardcoded; later from session

        JobDAO dao = new JobDAO();
        boolean isPosted = dao.addJob(job);

        if (isPosted) {
            response.sendRedirect("manageJobs.jsp");
        } else {
            response.sendRedirect("post_job.jsp?error=1");
        }
    }
}
