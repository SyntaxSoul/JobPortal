<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ include file="../auth/user-auth.jsp" %><%--I created auth file and added user-auth.jsp for code reusability i.e checking user type --%>

<%
    Connection conn = com.jobportal.util.DBConnection.getConnection();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT DISTINCT company FROM jobs_company ORDER BY company");
%>

<html>
<head><title>Browse Companies</title></head>
<body>
    <h2>Companies Hiring</h2>
    <ul>
        <%
            while (rs.next()) {
                String company = rs.getString("company");
        %>
            <li><a href="../CompanyJobsServlet?company=<%= company %>"><%= company %></a></li>
        <%
            }
        %>
    </ul>
</body>
</html>
