<%@ page import="java.util.*" %>
<%@ include file="../auth/user-auth.jsp" %>

<%
    List<Map<String, String>> applications = (List<Map<String, String>>) request.getAttribute("applications");
%>

<html>
<head><title>My Applications</title></head>
<body>
    <h2>My Job Applications</h2>
    <hr/>
    <%
        if (applications != null && !applications.isEmpty()) {
            for (Map<String, String> app : applications) {
    %>
        <div>
            <h4><%= app.get("title") %> at <%= app.get("company") %></h4>
            <p> <%= app.get("location") %><br>
                Applied on: <%= app.get("applied_on") %></p>
            <p><b>Message:</b> <%= app.get("message") %></p>
            <hr>
        </div>
    <%
            }
        } else {
    %>
        <p>No applications found.</p>
    <%
        }
    %>
</body>
</html>
