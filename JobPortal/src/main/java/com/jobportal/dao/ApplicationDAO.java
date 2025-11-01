package com.jobportal.dao;

import com.jobportal.model.Application;
import com.jobportal.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    // ✅ Check if already applied
    public boolean hasApplied(int jobId, int seekerId) {
        String sql = "SELECT * FROM applications WHERE job_id=? AND seeker_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ps.setInt(2, seekerId);

            return ps.executeQuery().next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Apply for job
    public boolean applyJob(int jobId, int seekerId) {
        String sql = "INSERT INTO applications (job_id, seeker_id, applied_at) VALUES (?, ?, NOW())";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ps.setInt(2, seekerId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // ✅ Get all applications for a seeker
    public List<Application> getApplicationsBySeeker(int seekerId) {
        List<Application> list = new ArrayList<>();

        String sql =
                "SELECT a.app_id, a.job_id, a.applied_at, " +
                "j.title, j.company, j.location, j.salary_range " +
                "FROM applications a " +
                "JOIN jobs j ON a.job_id = j.job_id " +
                "WHERE a.seeker_id = ? ORDER BY a.applied_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, seekerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Application app = new Application();

                app.setAppId(rs.getInt("app_id"));
                app.setJobId(rs.getInt("job_id"));
                app.setAppliedAt(rs.getTimestamp("applied_at"));

                app.setJobTitle(rs.getString("title"));
                app.setCompany(rs.getString("company"));
                app.setLocation(rs.getString("location"));
                app.setSalary(rs.getString("salary_range"));

                list.add(app);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Withdraw application
    public boolean deleteApplication(int appId) {
        String sql = "DELETE FROM applications WHERE app_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, appId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
 // ✅ Get all applicants for a specific job (Recruiter View)
    public List<Application> getApplicantsByJob(int jobId) {
        List<Application> list = new ArrayList<>();

        String sql =
            "SELECT a.app_id, a.applied_at, " +
            "u.full_name, u.email, " +
            "j.title " +
            "FROM applications a " +
            "JOIN users u ON a.seeker_id = u.id " +
            "JOIN jobs j ON a.job_id = j.job_id " +
            "WHERE a.job_id = ? ORDER BY a.applied_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, jobId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Application app = new Application();
                app.setAppId(rs.getInt("app_id"));
                app.setAppliedAt(rs.getTimestamp("applied_at"));
                app.setJobTitle(rs.getString("title"));

                // Extra fields from user table
                app.setSeekerName(rs.getString("full_name"));
                app.setSeekerEmail(rs.getString("email"));

                list.add(app);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
 
    
    
}




