package com.jobportal.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.jobportal.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("user_type");

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "INSERT INTO users (full_name, email, password, user_type, created_at) VALUES (?, ?, ?, ?, NOW())";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, userType);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("register.jsp?msg=success");
            } else {
                response.sendRedirect("register.jsp?msg=error");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?msg=error");
        }
    }
}
