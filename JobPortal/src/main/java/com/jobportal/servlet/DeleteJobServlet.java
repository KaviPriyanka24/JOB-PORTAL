package com.jobportal.servlet;

import com.jobportal.dao.JobDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = -6313548380527577493L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String jobIdParam = request.getParameter("id");

        if (jobIdParam != null) {
            try {
                int jobId = Integer.parseInt(jobIdParam);
                JobDAO jobDAO = new JobDAO();

                boolean deleted = jobDAO.deleteJob(jobId);

                if (deleted) {
                    response.sendRedirect("manageJobs.jsp?status=deleted");
                } else {
                    response.sendRedirect("manageJobs.jsp?status=error");
                }

            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("manageJobs.jsp?status=error");
            }
        } else {
            response.sendRedirect("manageJobs.jsp?status=error");
        }
    }
}
