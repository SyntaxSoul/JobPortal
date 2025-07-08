package com.jobportal.dao;

import java.sql.*;
import java.util.*;

import com.jobportal.util.DBConnection;

public class CompanyDAO {

    public List<String> getAllCompanies() {
        List<String> companies = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT DISTINCT company FROM jobs_company ORDER BY company"
            );
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                companies.add(rs.getString("company"));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return companies;
    }
}
