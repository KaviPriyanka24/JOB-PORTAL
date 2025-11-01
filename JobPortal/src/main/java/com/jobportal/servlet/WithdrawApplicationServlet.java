package com.jobportal.servlet;

import com.jobportal.dao.ApplicationDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;

@WebServlet("/WithdrawApplicationServlet")
public class WithdrawApplicationServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int appId = Integer.parseInt(req.getParameter("appId"));
        ApplicationDAO dao = new ApplicationDAO();

        boolean deleted = dao.deleteApplication(appId);

        if (deleted) {
            res.sendRedirect("myApplications.jsp?status=deleted");
        } else {
            res.sendRedirect("myApplications.jsp?status=error");
        }
    }
}
