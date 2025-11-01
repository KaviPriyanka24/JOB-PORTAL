package com.jobportal.servlet;

import com.jobportal.dao.JobDAO;
import com.jobportal.model.Job;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/EditJobServlet")
public class EditJobServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("manageJobs.jsp?status=invalid");
            return;
        }

        int jobId = Integer.parseInt(idParam);
        JobDAO jobDAO = new JobDAO();
        Job job = jobDAO.getJobById(jobId);

        if (job != null) {
            request.setAttribute("job", job);
            request.getRequestDispatcher("editJob.jsp").forward(request, response);
        } else {
            response.sendRedirect("manageJobs.jsp?status=notfound");
        }
    }
}
