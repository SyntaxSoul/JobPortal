<%@ page import="java.sql.*" %>
<%@ page import="com.jobportal.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add External Job (MyPortal)</title>
</head>
<body>
    <h2>Add a Job Listing (External Apply Link)</h2>
    <form method="post">
        <input type="text" name="title" placeholder="Job Title" required /><br><br>
        <input type="text" name="company" placeholder="Company Name" required /><br><br>
        <input type="text" name="location" placeholder="Location" required /><br><br>
        <input type="text" name="salary" placeholder="Salary (optional)" /><br><br>
        <textarea name="description" rows="5" cols="30" placeholder="Job Description" required></textarea><br><br>
        <input type="text" name="apply_link" placeholder="Application Link" required /><br><br>
        <input type="submit" value="Add Job" />
    </form>

<%
    String title = request.getParameter("title");
    String company = request.getParameter("company");
    String location = request.getParameter("location");
    String salary = request.getParameter("salary");
    String description = request.getParameter("description");
    String applyLink = request.getParameter("apply_link");

    if (title != null) {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO jobs_portal (title, company, location, salary, description, apply_link) VALUES (?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, title);
            ps.setString(2, company);
            ps.setString(3, location);
            ps.setString(4, salary);
            ps.setString(5, description);
            ps.setString(6, applyLink);

            int rows = ps.executeUpdate();

            if (rows > 0) {
%>
                <p style="color:green;">✅ Job added successfully!</p>
<%
            } else {
%>
                <p style="color:red;">❌ Failed to add job.</p>
<%
            }
            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
%>

</body>
</html>
