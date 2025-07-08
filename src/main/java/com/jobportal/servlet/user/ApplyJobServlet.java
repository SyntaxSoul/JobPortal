package com.jobportal.servlet.user;

import java.io.*;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import com.jobportal.dao.ApplicationDAO;


public class ApplyJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("job_id"));
        String name = request.getParameter("applicant_name");
        String email = request.getParameter("applicant_email");
        String message = request.getParameter("message");

        String appliedOn = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        ApplicationDAO dao = new ApplicationDAO();

        if (dao.hasAlreadyApplied(jobId, email)) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('You have already applied for this job.'); window.history.back();</script>");
            return;
        }

        boolean success = dao.applyToJob(jobId, name, email, message, appliedOn);

        if (success) {
            response.sendRedirect("user/my-applications.jsp");
        } else {
            response.getWriter().println("Failed to apply. Please try again.");
        }
    }
}
