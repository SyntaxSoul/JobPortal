package com.jobportal.servlet.user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.*;
import com.jobportal.util.DBConnection;

@WebServlet("/CompanyJobsServlet")
public class CompanyJobsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String company = request.getParameter("company");
        List<Map<String, String>> jobs = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM jobs_company WHERE company = ? ORDER BY posted_on DESC"
            );
            stmt.setString(1, company);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, String> job = new HashMap<>();
                job.put("title", rs.getString("title"));
                job.put("location", rs.getString("location"));
                job.put("description", rs.getString("description"));
                job.put("id", String.valueOf(rs.getInt("id")));
                job.put("posted_at", rs.getString("posted_on"));
                jobs.add(job);
            }

            request.setAttribute("jobs", jobs);
            request.setAttribute("company", company);
            RequestDispatcher rd = request.getRequestDispatcher("user/company-jobs.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
