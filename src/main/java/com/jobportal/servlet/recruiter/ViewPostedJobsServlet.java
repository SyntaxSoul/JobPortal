package com.jobportal.servlet.recruiter;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.jobportal.util.DBConnection;

public class ViewPostedJobsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recruiterEmail = (String) request.getSession().getAttribute("email");

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM jobs_company WHERE posted_by = ?");
            stmt.setString(1, recruiterEmail);
            ResultSet rs = stmt.executeQuery();

            request.setAttribute("jobList", rs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/recruiter/view-posted-jobs.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
