package com.jobportal.servlet.recruiter;
import javax.servlet.annotation.WebServlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jobportal.util.DBConnection;

import java.sql.*;

@WebServlet("/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int jobId = Integer.parseInt(request.getParameter("id"));

            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM jobs_company WHERE id = ?");
            stmt.setInt(1, jobId);
            int rowsDeleted = stmt.executeUpdate();

            if (rowsDeleted > 0) {
                response.sendRedirect("ViewPostedJobsServlet");
            } else {
                response.getWriter().println("Failed to delete job. ID may not exist.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
