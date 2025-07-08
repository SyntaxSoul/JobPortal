package com.jobportal.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jobportal.util.DBConnection;


public class ApplicationDAO {

    public boolean hasAlreadyApplied(int jobId, String email) {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT id FROM applications WHERE job_id = ? AND applicant_email = ?"
            );
            stmt.setInt(1, jobId);
            stmt.setString(2, email);

            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return true; // safe fallback: assume already applied
        }
    }

    public boolean applyToJob(int jobId, String name, String email, String message, String appliedOn) {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO applications (job_id, applicant_name, applicant_email, message, applied_on) " +
                "VALUES (?, ?, ?, ?, ?)"
            );
            stmt.setInt(1, jobId);
            stmt.setString(2, name);
            stmt.setString(3, email);
            stmt.setString(4, message);
            stmt.setString(5, appliedOn);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Map<String, String>> getApplicationsByEmail(String email) {
        List<Map<String, String>> applications = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT a.id, a.job_id, a.message, a.applied_on, j.title, j.company, j.location " +
                "FROM applications a JOIN jobs_company j ON a.job_id = j.id " +
                "WHERE a.applicant_email = ? ORDER BY a.applied_on DESC"
            );
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, String> app = new HashMap<>();
                app.put("title", rs.getString("title"));
                app.put("company", rs.getString("company"));
                app.put("location", rs.getString("location"));
                app.put("message", rs.getString("message"));
                app.put("applied_on", rs.getString("applied_on"));
                applications.add(app);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return applications;
    }

}
