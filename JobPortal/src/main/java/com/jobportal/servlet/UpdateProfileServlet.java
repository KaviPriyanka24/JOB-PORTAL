package com.jobportal.servlet;

import com.jobportal.dao.UserDAO;
import com.jobportal.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setId(id);
        user.setFullName(fullName);
        user.setEmail(email);

        if (password != null && !password.trim().isEmpty()) {
            user.setPassword(password);
        }

        UserDAO dao = new UserDAO();
        boolean updated = dao.updateUser(user);

        if (updated) {
            // ✅ update session values too
            HttpSession session = request.getSession();
            session.setAttribute("full_name", fullName);
            session.setAttribute("email", email);

            response.sendRedirect("profile.jsp?status=updated");
        } else {
            response.sendRedirect("profile.jsp?status=error");
        }
    }
}
