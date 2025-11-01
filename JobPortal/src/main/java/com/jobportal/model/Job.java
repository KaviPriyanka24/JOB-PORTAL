package com.jobportal.model;

import java.sql.Timestamp;

public class Job {
    private int jobId;
    private int recruiterId;
    private String title;
    private String company;
    private String location;
    private String description;
    private String salaryRange;
    private String skillsRequired;
    private String postedBy;
    private Timestamp createdAt;

    // ====== GETTERS AND SETTERS ======
    public int getJobId() {
        return jobId;
    }
    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getRecruiterId() {
        return recruiterId;
    }
    public void setRecruiterId(int recruiterId) {
        this.recruiterId = recruiterId;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getCompany() {
        return company;
    }
    public void setCompany(String company) {
        this.company = company;
    }

    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getSalaryRange() {
        return salaryRange;
    }
    public void setSalaryRange(String salaryRange) {
        this.salaryRange = salaryRange;
    }

    public String getSkillsRequired() {
        return skillsRequired;
    }
    public void setSkillsRequired(String skillsRequired) {
        this.skillsRequired = skillsRequired;
    }

    public String getPostedBy() {
        return postedBy;
    }
    public void setPostedBy(String postedBy) {
        this.postedBy = postedBy;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
