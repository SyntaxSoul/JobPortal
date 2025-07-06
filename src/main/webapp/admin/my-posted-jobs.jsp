<%@ page import="java.sql.*" %>
<%@ page import="com.jobportal.util.DBConnection" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../auth/admin-auth.jsp" %><%--I created auth file and added admin-auth.jsp for code reusability i.e checking user type --%>
<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<html>
<head>
    <title>My Posted Jobs</title>
</head>
<body>
    <h2>Jobs You Have Posted</h2>

<%
    try {
        Connection conn = DBConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(
            "SELECT * FROM jobs_company WHERE posted_by = ? ORDER BY posted_on DESC"
        );
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        boolean found = false;
        while (rs.next()) {
            found = true;
%>
            <div style="border: 1px solid #aaa; padding: 15px; margin-bottom: 20px;">
                <h3><%= rs.getString("title") %></h3>
                <p><strong>Company:</strong> <%= rs.getString("company") %></p>
                <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                <p><strong>Salary:</strong> <%= rs.getString("salary") %></p>
                <p><%= rs.getString("description") %></p>
                <p><strong>Posted On:</strong> <%= rs.getTimestamp("posted_on") %></p>
            </div>
<%
        }

        if (!found) {
%>
            <p>You haven't posted any jobs yet.</p>
<%
        }

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

</body>
</html>
