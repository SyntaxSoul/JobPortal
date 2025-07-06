<%@ page import="java.sql.ResultSet" %>
<%@ page session="true" %>

<%
    ResultSet job = (ResultSet) request.getAttribute("job");
    if (job == null) {
        response.sendRedirect("ViewPostedJobsServlet");
        return;
    }
    //job.next(); // Move cursor to first row Don't do this
%>

<html>
<head>
    <title>Edit Job</title>
</head>
<body>
    <h2>Edit Job Posting</h2>
    <form action="UpdateJobServlet" method="post">
        <input type="hidden" name="id" value="<%= job.getInt("id") %>" />
        Title: <input type="text" name="title" value="<%= job.getString("title") %>" required /><br/><br/>
        Company: <input type="text" name="company" value="<%= job.getString("company") %>" required /><br/><br/>
        Location: <input type="text" name="location" value="<%= job.getString("location") %>" required /><br/><br/>
        Description:<br/>
        <textarea name="description" rows="5" cols="30" required><%= job.getString("description") %></textarea><br/><br/>
        <input type="submit" value="Update Job"/>
    </form>
</body>
</html>
