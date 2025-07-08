
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../auth/user-auth.jsp" %>
<%@ include file="../common/header.jsp" %>
<%
String email = (String) session.getAttribute("email");
if (email == null) {
    response.sendRedirect("../login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f7;
            padding: 40px;
            text-align: center;
        }
        .box {
            background: white;
            padding: 30px;
            margin: auto;
            width: 50%;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 15px 0;
        }
        a {
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Welcome, <%= email %>!</h2>
        <hr>
        <ul>
            <li><a href="external-jobs.jsp">🔎 View Curated Jobs</a></li>
            <li><a href="browse-companies.jsp">🏢 Browse Companies</a></li>
            
            <li><a href="../UserProfileServlet">📄 My Profile</a></li>
            <li><a href="<%= request.getContextPath() %>/MyApplicationsServlet">📄 My Applications</a></li>

            <li><a href="#">📊 Application Status</a></li>
            <li><a href="../logout.jsp" style="background-color: red;">🚪 Logout</a></li>
        </ul>
    </div>
</body>
</html>
<%@ include file="../common/footer.jsp" %>
