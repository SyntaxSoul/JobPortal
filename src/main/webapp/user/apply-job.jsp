<%@ include file="../auth/user-auth.jsp" %>
<%
    String email = (String) session.getAttribute("email");
    String name = (String) session.getAttribute("name");
    String jobId = request.getParameter("job_id"); // comes from URL
%>

<html>
<head><title>Apply for Job</title></head>
<body>
    <h2>Apply for Job</h2>
    <form method="post" action="<%= request.getContextPath() %>/ApplyJobServlet"> 

        <input type="hidden" name="job_id" value="<%= jobId %>" />
        <input type="text" name="applicant_name" value="<%= name %>" /><br>
        <input type="email" name="applicant_email" value="<%= email %>" /><br>

        <label for="message">Message (optional):</label><br>
        <textarea name="message" rows="5" cols="40"></textarea><br><br>

        <input type="submit" value="Apply Now" />
    </form>
</body>
</html>
