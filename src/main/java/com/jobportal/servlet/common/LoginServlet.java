package com.jobportal.servlet.common;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import com.jobportal.util.DBConnection;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT login_id, role FROM login WHERE email = ? AND password = ?"
            );
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int loginId = rs.getInt("login_id");
                String role = rs.getString("role");

                // Optionally fetch name from user_profile (if role is jobseeker)
                String fullName = "";
                if (role.equals("jobseeker")) {
                    PreparedStatement ps2 = conn.prepareStatement("SELECT full_name FROM user_profile WHERE login_id = ?");
                    ps2.setInt(1, loginId);
                    ResultSet rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        fullName = rs2.getString("full_name");
                    }
                }

                // Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("login_id", loginId);
                session.setAttribute("email", email);
                session.setAttribute("role", role);
                session.setAttribute("full_name", fullName);
                // Redirect based on role
                if (role.equals("jobseeker")) {
                    response.sendRedirect(request.getContextPath() + "/user/dashboard.jsp");
                } else if (role.equals("recruiter")) {
                    response.sendRedirect(request.getContextPath() + "/recruiter/dashboard.jsp");
                } else if (role.equals("admin")) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                } else {
                    response.getWriter().println("Unknown role.");
                }

            } else {
                response.getWriter().println("Invalid email or password.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
