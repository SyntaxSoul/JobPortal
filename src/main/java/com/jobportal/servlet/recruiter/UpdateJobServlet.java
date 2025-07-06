package com.jobportal.servlet.recruiter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import com.jobportal.util.DBConnection;

@WebServlet("/UpdateJobServlet")
public class UpdateJobServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String company = request.getParameter("company");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE jobs_company SET title=?, company=?, location=?, description=? WHERE id=?"
            );
            stmt.setString(1, title);
            stmt.setString(2, company);
            stmt.setString(3, location);
            stmt.setString(4, description);
            stmt.setInt(5, id);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("ViewPostedJobsServlet");
            } else {
                response.getWriter().println("Update failed. Job not found.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
