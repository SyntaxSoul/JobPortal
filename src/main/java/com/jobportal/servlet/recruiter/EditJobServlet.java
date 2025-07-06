package com.jobportal.servlet.recruiter;
import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.jobportal.util.DBConnection;

@WebServlet("/EditJobServlet")
public class EditJobServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int jobId = Integer.parseInt(request.getParameter("id"));

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM jobs_company WHERE id = ?");
            stmt.setInt(1, jobId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("job", rs);
                RequestDispatcher rd = request.getRequestDispatcher("recruiter/edit-job.jsp");
                rd.forward(request, response);
            } else {
                response.getWriter().println("Job not found.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
