package com.jobportal.dao;

import com.jobportal.model.User;
import com.jobportal.util.DBConnection;

import java.sql.*;

public class UserDAO {

    // ✅ Get user by ID
    public User getUserById(int id) {
        User user = null;

        String sql = "SELECT * FROM users WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setUserType(rs.getString("user_type"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
 // ✅ Update personal info (name + email)
    public boolean updateInfo(User user) {
        String sql = "UPDATE users SET full_name=?, email=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setInt(3, user.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Update password only
    public boolean updatePassword(int id, String newPass) {
        String sql = "UPDATE users SET password=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newPass);
            ps.setInt(2, id);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // ✅ Update user profile
    public boolean updateUser(User user) {

        String sql;

        if (user.getPassword() != null && !user.getPassword().trim().isEmpty()) {
            sql = "UPDATE users SET full_name=?, email=?, password=? WHERE id=?";
        } else {
            sql = "UPDATE users SET full_name=?, email=? WHERE id=?";
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());

            if (user.getPassword() != null && !user.getPassword().trim().isEmpty()) {
                ps.setString(3, user.getPassword());
                ps.setInt(4, user.getId());
            } else {
                ps.setInt(3, user.getId());
            }

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
