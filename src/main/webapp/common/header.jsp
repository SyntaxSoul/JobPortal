<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Job Portal</title>
    <style>
        body { font-family: Arial; background-color: #f5f5f5; margin: 0; padding: 0; }
        .header { background-color: #3f51b5; color: white; padding: 15px; text-align: center; }
        .nav { background-color: #eee; padding: 10px; text-align: right; }
        .nav a { margin: 0 10px; text-decoration: none; color: #333; }
    </style>
</head>
<body>
    <div class="header">
        <h2>Job Portal</h2>
    </div>
    <div class="nav">
        Welcome, <%= (user != null ? user : "Guest") %> |
        <a href="<%= request.getContextPath() %>/logout.jsp">Logout</a>
    </div>
