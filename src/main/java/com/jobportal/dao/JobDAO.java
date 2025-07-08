package com.jobportal.dao;

import java.sql.*;
import java.util.*;

import com.jobportal.util.DBConnection;

public class JobDAO {

    public List<Map<String, String>> getJobsByCompany(String company) {
        List<Map<String, String>> jobs = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM jobs_company WHERE company = ? ORDER BY posted_on DESC"
            );
            stmt.setString(1, company);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, String> job = new HashMap<>();
                job.put("title", rs.getString("title"));
                job.put("location", rs.getString("location"));
                job.put("description", rs.getString("description"));
                job.put("id", String.valueOf(rs.getInt("id")));
                job.put("posted_at", rs.getString("posted_on"));
                jobs.add(job);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jobs;
    }
}
