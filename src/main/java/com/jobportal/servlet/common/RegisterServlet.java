package com.jobportal.servlet.common;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import com.jobportal.util.DBConnection;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("user_type");  // 'jobseeker' or 'recruiter'

        try {
            Connection conn = DBConnection.getConnection();

            // Step 1: Insert into login table
            String loginQuery = "INSERT INTO login (email, password, role) VALUES (?, ?, ?)";
            PreparedStatement loginStmt = conn.prepareStatement(loginQuery, Statement.RETURN_GENERATED_KEYS);
            loginStmt.setString(1, email);
            loginStmt.setString(2, password);
            loginStmt.setString(3, role);
            int loginResult = loginStmt.executeUpdate();

            if (loginResult > 0) {
                ResultSet rs = loginStmt.getGeneratedKeys();
                if (rs.next()) {
                    int loginId = rs.getInt(1); // Get generated login_id

                    // Step 2: Insert into user_profile (partially filled)
                    String profileQuery = "INSERT INTO user_profile (login_id, full_name) VALUES (?, ?)";
                    PreparedStatement profileStmt = conn.prepareStatement(profileQuery);
                    profileStmt.setInt(1, loginId);
                    profileStmt.setString(2, name);  // Optionally leave empty

                    profileStmt.executeUpdate();

                    // Step 3: Redirect
                    response.sendRedirect("login.jsp?type=" + role);
                }
            } else {
                response.getWriter().println("Registration failed.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
