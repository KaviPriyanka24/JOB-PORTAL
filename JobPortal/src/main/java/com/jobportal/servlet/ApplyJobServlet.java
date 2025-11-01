package com.jobportal.servlet;

import com.jobportal.dao.ApplicationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ApplyJobServlet")
public class ApplyJobServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Integer seekerId = (Integer) session.getAttribute("id");

        if (seekerId == null) {
            res.getWriter().write("{\"status\":\"error\", \"message\":\"Please login to apply for jobs.\"}");
            return;
        }

        try {
            int jobId = Integer.parseInt(req.getParameter("jobId"));
            ApplicationDAO appDAO = new ApplicationDAO();

            // ✅ Check if already applied
            if (appDAO.hasApplied(jobId, seekerId)) {
                res.getWriter().write("{\"status\":\"error\", \"message\":\"⚠ You already applied for this job.\"}");
                return;
            }

            // ✅ Apply job
            boolean applied = appDAO.applyJob(jobId, seekerId);

            if (applied) {
                res.getWriter().write("{\"status\":\"success\", \"message\":\"✅ Application Submitted Successfully!\"}");
            } else {
                res.getWriter().write("{\"status\":\"error\", \"message\":\"❌ Something went wrong. Try again!\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("{\"status\":\"error\", \"message\":\"❌ Error processing request.\"}");
        }
    }
}
