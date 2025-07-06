package com.jobportal.servlet.common;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.jobportal.util.DBConnection;

import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM users WHERE email = ? AND password = ?"
            );
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String userType = rs.getString("user_type");

                // Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("user_type", userType);

                // Redirect based on role
                if (userType.equals("user")) {
                	response.sendRedirect(request.getContextPath() + "/user/dashboard.jsp");
                } else if (userType.equals("recruiter")) {
                	response.sendRedirect(request.getContextPath() + "/recruiter/dashboard.jsp");
                } else if (userType.equals("admin")) {
                	response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                } else {
                    response.getWriter().println("Unknown user type.");
                }

            } else {
                response.getWriter().println("Invalid email or password.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
