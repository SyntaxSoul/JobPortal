<%@ page import="java.sql.*" %>
<%@ page import="com.jobportal.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Available Jobs (MyPortal)</title>
</head>
<body>
    <h2>Available Jobs (Curated by MyPortal)</h2>

<%
    try {
        Connection conn = DBConnection.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM jobs_portal ORDER BY id DESC");

        while (rs.next()) {
%>
            <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px;">
                <h3><%= rs.getString("title") %></h3>
                <p><strong>Company:</strong> <%= rs.getString("company") %></p>
                <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                <p><strong>Salary:</strong> <%= rs.getString("salary") %></p>
                <p><%= rs.getString("description") %></p>
                <a href="<%= rs.getString("apply_link") %>" target="_blank">
                    <button>Apply on Company Website</button>
                </a>
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
