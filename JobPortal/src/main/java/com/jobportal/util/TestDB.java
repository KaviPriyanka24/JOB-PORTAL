package com.jobportal.util;

import java.sql.Connection;

public class TestDB {

    public static void main(String[] args) {  // ✅ this must be exactly like this
        Connection con = DBConnection.getConnection();
        if (con != null) {
            System.out.println("✅ Connection Test Successful!");
        } else {
            System.out.println("❌ Connection Test Failed!");
        }
    }
}
