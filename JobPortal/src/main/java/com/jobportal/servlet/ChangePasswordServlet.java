package com.jobportal.servlet;

import com.jobportal.dao.UserDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String newPass = request.getParameter("new_password");
        String confirmPass = request.getParameter("confirm_password");

        if (!newPass.equals(confirmPass)) {
            response.sendRedirect("profile.jsp?status=error");
            return;
        }

        UserDAO dao = new UserDAO();
        boolean updated = dao.updatePassword(id, newPass);

        if (updated) {
            response.sendRedirect("profile.jsp?status=passwordUpdated");
        } else {
            response.sendRedirect("profile.jsp?status=error");
        }
    }
}
