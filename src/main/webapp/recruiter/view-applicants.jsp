<%@ page import="java.sql.*" %>
<%@ page import="com.jobportal.util.DBConnection" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../auth/recruiter-auth.jsp" %><%--I created auth file and added recruiter-auth.jsp for code reusability i.e checking user type --%>
<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<html>
<head>
    <title>View Applicants</title>
</head>
<body>
<h2>Applicants to Your Jobs</h2>

<%
    try {
        Connection conn = DBConnection.getConnection();

        String sql = "SELECT a.applicant_name, a.applicant_email, a.message, a.applied_on, " +
                     "j.title FROM applications a " +
                     "JOIN jobs_company j ON a.job_id = j.id " +
                     "WHERE j.posted_by = ? ORDER BY a.applied_on DESC";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        boolean found = false;
        while (rs.next()) {
            found = true;
%>
            <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px;">
                <p><strong>Job:</strong> <%= rs.getString("title") %></p>
                <p><strong>Name:</strong> <%= rs.getString("applicant_name") %></p>
                <p><strong>Email:</strong> <%= rs.getString("applicant_email") %></p>
                <p><strong>Message:</strong> <%= rs.getString("message") %></p>
                <p><strong>Applied On:</strong> <%= rs.getTimestamp("applied_on") %></p>
            </div>
<%
        }

        if (!found) {
%>
            <p style="color:gray;">No applicants yet.</p>
<%
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
</body>
</html>
