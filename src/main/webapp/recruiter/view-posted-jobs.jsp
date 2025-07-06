<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    ResultSet rs = (ResultSet) request.getAttribute("jobList");
%>

<html>
<head>
    <title>My Posted Jobs</title>
</head>
<body>
    <h2>🗂️ My Posted Jobs</h2>
    <hr>
    <table border="1" cellpadding="10">
        <tr>
            <th>Job Title</th>
            <th>Description</th>
            <th>Category</th>
            <th>Location</th>
            <th>Posted On</th>
        </tr>

        <%
            if (rs != null) {
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getString("company") %></td>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getTimestamp("posted_on") %></td>
            <td>
    			<a href="EditJobServlet?id=<%= rs.getInt("id") %>">Edit</a> |
    			<a href="/DeleteJobServlet?id=<%= rs.getInt("id") %>" onclick="return confirm('Delete this job?');">Delete</a>
    			<form action="recruiter/view-applications.jsp" method="get" style="display:inline;">
        			<input type="hidden" name="job_id" value="<%= rs.getInt("id") %>" />
        			<input type="submit" value="View Applications" />
    			</form>
			</td>
        <%
                }
            } else {
        %>
        <tr><td colspan="5">No jobs found.</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>
