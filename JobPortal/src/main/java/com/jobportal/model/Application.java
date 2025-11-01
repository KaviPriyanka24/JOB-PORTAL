package com.jobportal.model;

import java.sql.Timestamp;

public class Application {

    private int appId;
    private int jobId;
    private int seekerId;
    private Timestamp appliedAt;

    private String jobTitle;
    private String company;
    private String location;
    private String salary;

    
    private String seekerName;
    private String seekerEmail;

    public String getSeekerName() {
        return seekerName;
    }
    public void setSeekerName(String seekerName) {
        this.seekerName = seekerName;
    }

    public String getSeekerEmail() {
        return seekerEmail;
    }
    public void setSeekerEmail(String seekerEmail) {
        this.seekerEmail = seekerEmail;
    }

    // ===== Getters & Setters =====
    public int getAppId() {
        return appId;
    }
    public void setAppId(int appId) {
        this.appId = appId;
    }

    public int getJobId() {
        return jobId;
    }
    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getSeekerId() {
        return seekerId;
    }
    public void setSeekerId(int seekerId) {
        this.seekerId = seekerId;
    }

    public Timestamp getAppliedAt() {
        return appliedAt;
    }
    public void setAppliedAt(Timestamp appliedAt) {
        this.appliedAt = appliedAt;
    }

    public String getJobTitle() {
        return jobTitle;
    }
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
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

    public String getSalary() {
        return salary;
    }
    public void setSalary(String salary) {
        this.salary = salary;
    }
}
