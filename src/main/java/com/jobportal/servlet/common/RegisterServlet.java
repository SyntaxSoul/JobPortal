package com.jobportal.servlet.common;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.jobportal.util.DBConnection;

import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("user_type"); // 👈 new

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO users (name, email, password, user_type) VALUES (?, ?, ?, ?)"
            );
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, userType); // 👈 set user_type

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("login.jsp?type=" + userType); // redirect based on role
            } else {
                response.getWriter().println("Registration failed.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
