<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%@ include file="../auth/recruiter-auth.jsp" %>

<%
    String jobId = request.getParameter("job_id");
    List<Map<String, String>> applications = new ArrayList<>();

    try {
        Connection conn = com.jobportal.util.DBConnection.getConnection();
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM applications WHERE job_id = ?");
        stmt.setString(1, jobId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Map<String, String> app = new HashMap<>();
            app.put("name", rs.getString("applicant_name"));
            app.put("email", rs.getString("applicant_email"));
            app.put("message", rs.getString("message"));
            app.put("applied_on", rs.getString("applied_on"));
            applications.add(app);
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<html>
<head><title>Applications for Job ID: <%= jobId %></title></head>
<body>
    <h2>Applications for Job ID: <%= jobId %></h2>

    <%
        if (applications.isEmpty()) {
    %>
        <p>No applications found.</p>
    <%
        } else {
    %>
        <ul>
            <%
                for (Map<String, String> app : applications) {
            %>
                <li>
                    <b>Name:</b> <%= app.get("name") %><br>
                    <b>Email:</b> <%= app.get("email") %><br>
                    <b>Message:</b> <%= app.get("message") %><br>
                    <b>Applied On:</b> <%= app.get("applied_on") %>
                    <hr>
                </li>
            <%
                }
            %>
        </ul>
    <%
        }
    %>
</body>
</html>
