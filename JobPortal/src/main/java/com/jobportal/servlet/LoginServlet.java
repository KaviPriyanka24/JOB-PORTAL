package com.jobportal.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.jobportal.util.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String userType = rs.getString("user_type");

                // ✅ Create session and store all required values
                HttpSession session = request.getSession();
                session.setAttribute("id", rs.getInt("id")); // <-- ADD THIS LINE
                session.setAttribute("full_name", rs.getString("full_name"));
                session.setAttribute("user_type", userType);
                session.setAttribute("email", email);

                // ✅ Redirect based on user type
                if ("seeker".equalsIgnoreCase(userType)) {
                    response.sendRedirect("seekerDashboard.jsp");
                } else {
                    response.sendRedirect("recruiterDashboard.jsp");
                }

            } else {
                // ❌ Invalid credentials
                request.setAttribute("error", "Invalid email or password!");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
