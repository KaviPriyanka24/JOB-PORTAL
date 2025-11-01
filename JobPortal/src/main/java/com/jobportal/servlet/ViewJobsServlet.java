package com.jobportal.servlet;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.jobportal.dao.JobDAO;
import com.jobportal.model.Job;

@WebServlet("/ViewJobsServlet")
public class ViewJobsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        JobDAO jobDAO = new JobDAO();
        List<Job> jobs = jobDAO.getAllJobs();

        request.setAttribute("jobs", jobs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewJobs.jsp");
        dispatcher.forward(request, response);
    }
}
