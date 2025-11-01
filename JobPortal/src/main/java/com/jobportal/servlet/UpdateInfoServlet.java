package com.jobportal.servlet;

import com.jobportal.dao.UserDAO;
import com.jobportal.model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/UpdateInfoServlet")
public class UpdateInfoServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");

        User user = new User();
        user.setId(id);
        user.setFullName(fullName);
        user.setEmail(email);

        UserDAO dao = new UserDAO();
        boolean updated = dao.updateInfo(user);

        if (updated) {
            response.sendRedirect("profile.jsp?status=infoUpdated");
        } else {
            response.sendRedirect("profile.jsp?status=error");
        }
    }
}
