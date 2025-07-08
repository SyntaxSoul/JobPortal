package com.jobportal.dao;

import java.sql.*;
import java.util.*;
import com.jobportal.util.DBConnection;

public class UserProfileDAO {

    public Map<String, String> getProfileByLoginId(int loginId) {
        Map<String, String> profile = new HashMap<>();
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT full_name, phone, city, education FROM user_profile WHERE login_id = ?"
            );
            stmt.setInt(1, loginId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                profile.put("full_name", rs.getString("full_name"));
                profile.put("phone", rs.getString("phone"));
                profile.put("city", rs.getString("city"));
                profile.put("education", rs.getString("education"));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return profile;
    }

    public boolean updateOrInsertProfile(int loginId, String fullName, String phone, String city, String education) {
        try {
            Connection conn = DBConnection.getConnection();

            // check if exists
            PreparedStatement check = conn.prepareStatement("SELECT id FROM user_profile WHERE login_id = ?");
            check.setInt(1, loginId);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                // update
                PreparedStatement update = conn.prepareStatement(
                    "UPDATE user_profile SET full_name = ?, phone = ?, city = ?, education = ? WHERE login_id = ?"
                );
                update.setString(1, fullName);
                update.setString(2, phone);
                update.setString(3, city);
                update.setString(4, education);
                update.setInt(5, loginId);
                return update.executeUpdate() > 0;

            } else {
                // insert
                PreparedStatement insert = conn.prepareStatement(
                    "INSERT INTO user_profile (login_id, full_name, phone, city, education) VALUES (?, ?, ?, ?, ?)"
                );
                insert.setInt(1, loginId);
                insert.setString(2, fullName);
                insert.setString(3, phone);
                insert.setString(4, city);
                insert.setString(5, education);
                return insert.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
