<%@ page import="java.sql.*" %>
<%@ page import="com.jobportal.util.DBConnection" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Internal Jobs</title>
</head>
<body>
    <h2>Available Internal Jobs</h2>

<%
    try {
        Connection conn = DBConnection.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM jobs_company ORDER BY id DESC");

        while (rs.next()) {
            int jobId = rs.getInt("id");
%>
            <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px;">
                <h3><%= rs.getString("title") %></h3>
                <p><strong>Company:</strong> <%= rs.getString("company") %></p>
                <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                <p><strong>Salary:</strong> <%= rs.getString("salary") %></p>
                <p><%= rs.getString("description") %></p>
                <form action="apply-job.jsp" method="get">
                    <input type="hidden" name="jobId" value="<%= jobId %>"/>
                    <input type="submit" value="Apply Now"/>
                </form>
            </div>
<%
        }
        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

</body>
</html>
