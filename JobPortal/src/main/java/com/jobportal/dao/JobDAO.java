package com.jobportal.dao;

import com.jobportal.model.Job;
import com.jobportal.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JobDAO {

    // 1️⃣ ADD JOB
    public boolean addJob(Job job) {
        String sql = "INSERT INTO jobs (recruiter_id, title, company, location, description, salary_range, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, job.getRecruiterId());
            ps.setString(2, job.getTitle());
            ps.setString(3, job.getCompany());
            ps.setString(4, job.getLocation());
            ps.setString(5, job.getDescription());
            ps.setString(6, job.getSalaryRange());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 2️⃣ GET JOBS BY RECRUITER
    public List<Job> getJobsByRecruiter(int recruiterId) {
        List<Job> jobs = new ArrayList<>();
        String sql = "SELECT * FROM jobs WHERE recruiter_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, recruiterId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setRecruiterId(rs.getInt("recruiter_id"));
                job.setTitle(rs.getString("title"));
                job.setCompany(rs.getString("company"));
                job.setLocation(rs.getString("location"));
                job.setDescription(rs.getString("description"));
                job.setSalaryRange(rs.getString("salary_range"));
                job.setCreatedAt(rs.getTimestamp("created_at"));
                jobs.add(job);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobs;
    }

    // 3️⃣ GET ALL JOBS
    public List<Job> getAllJobs() {
        List<Job> jobs = new ArrayList<>();
        String sql = "SELECT * FROM jobs ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setRecruiterId(rs.getInt("recruiter_id"));
                job.setTitle(rs.getString("title"));
                job.setCompany(rs.getString("company"));
                job.setLocation(rs.getString("location"));
                job.setDescription(rs.getString("description"));
                job.setSalaryRange(rs.getString("salary_range"));
                job.setCreatedAt(rs.getTimestamp("created_at"));
                jobs.add(job);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobs;
    }

    // 4️⃣ DELETE JOB
    public boolean deleteJob(int jobId) {
        String sql = "DELETE FROM jobs WHERE job_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, jobId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public Job getJobById(int jobId) {
        Job job = null;
        String sql = "SELECT * FROM jobs WHERE job_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, jobId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setRecruiterId(rs.getInt("recruiter_id"));
                job.setTitle(rs.getString("title"));
                job.setCompany(rs.getString("company"));
                job.setLocation(rs.getString("location"));
                job.setDescription(rs.getString("description"));
                job.setSalaryRange(rs.getString("salary_range"));
                job.setCreatedAt(rs.getTimestamp("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return job;
    }
 // ✅ Update job details (MATCHING your table structure)
    public boolean updateJob(Job job) {
        String sql = "UPDATE jobs SET title=?, company=?, location=?, description=?, salary_range=? WHERE job_id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, job.getTitle());
            stmt.setString(2, job.getCompany());
            stmt.setString(3, job.getLocation());
            stmt.setString(4, job.getDescription());
            stmt.setString(5, job.getSalaryRange());
            stmt.setInt(6, job.getJobId());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
