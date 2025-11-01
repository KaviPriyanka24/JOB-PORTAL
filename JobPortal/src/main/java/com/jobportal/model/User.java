package com.jobportal.model;

public class User {

    private int id;
    private String fullName;
    private String email;
    private String password;
    private String userType;   // seeker or recruiter
    private String company;    // only for recruiter

    // ===== GETTERS & SETTERS =====

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }
    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getCompany() {
        return company;
    }
    public void setCompany(String company) {
        this.company = company;
    }
}
