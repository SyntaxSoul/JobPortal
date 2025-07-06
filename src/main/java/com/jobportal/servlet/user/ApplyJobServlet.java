package com.jobportal.servlet.user;

import java.io.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.*;
import javax.servlet.http.*;

import com.jobportal.util.DBConnection;

public class ApplyJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String jobId = request.getParameter("job_id");
        String name = request.getParameter("applicant_name");
        String email = request.getParameter("applicant_email");
        String message = request.getParameter("message");

        // Current timestamp
        String appliedOn = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        try {
            Connection conn = DBConnection.getConnection();

            // ❗ Step 1: Check if the user has already applied for this job
            PreparedStatement checkStmt = conn.prepareStatement(
                "SELECT id FROM applications WHERE job_id = ? AND applicant_email = ?"
            );
            checkStmt.setString(1, jobId);
            checkStmt.setString(2, email);
            ResultSet checkRs = checkStmt.executeQuery();

            if (checkRs.next()) {
                // Already applied
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('You have already applied for this job.'); window.history.back();</script>");
                return;
            }

            // ❗ Step 2: Proceed with inserting new application
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO applications (job_id, applicant_name, applicant_email, message, applied_on) " +
                "VALUES (?, ?, ?, ?, ?)"
            );

            stmt.setString(1, jobId);
            stmt.setString(2, name);
            stmt.setString(3, email);
            stmt.setString(4, message);
            stmt.setString(5, appliedOn);

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("user/my-applications.jsp");
            } else {
                response.getWriter().println("Failed to apply. Try again.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
