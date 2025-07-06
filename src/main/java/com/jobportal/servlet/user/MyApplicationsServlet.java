package com.jobportal.servlet.user;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.jobportal.util.DBConnection;

public class MyApplicationsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        List<Map<String, String>> applications = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT a.id, a.job_id, a.message, a.applied_on, j.title, j.company, j.location " +
                "FROM applications a JOIN jobs_company j ON a.job_id = j.id " +
                "WHERE a.applicant_email = ? ORDER BY a.applied_on DESC"
            );
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, String> app = new HashMap<>();
                app.put("title", rs.getString("title"));
                app.put("company", rs.getString("company"));
                app.put("location", rs.getString("location"));
                app.put("message", rs.getString("message"));
                app.put("applied_on", rs.getString("applied_on"));
                applications.add(app);
            }

            request.setAttribute("applications", applications);
            RequestDispatcher rd = request.getRequestDispatcher("user/my-applications.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
