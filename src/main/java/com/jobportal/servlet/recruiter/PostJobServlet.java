package com.jobportal.servlet.recruiter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.jobportal.util.DBConnection;
import java.sql.*;


public class PostJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        // Get recruiter email from session
        HttpSession session = request.getSession();
        String recruiterEmail = (String) session.getAttribute("email");

        // Get job details from form
        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO jobs_company (title, company, location, description, posted_by, posted_on) VALUES (?, ?, ?, ?, ?, NOW())");
            stmt.setString(1, title);
            stmt.setString(2, company);
            stmt.setString(3, location);
            stmt.setString(4, description);
            stmt.setString(5, recruiterEmail);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("recruiter/dashboard.jsp");
            } else {
                response.getWriter().println("Failed to post job.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
