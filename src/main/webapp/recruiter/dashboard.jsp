<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../auth/recruiter-auth.jsp" %><%--I created auth file and added recruiter-auth.jsp for code reusability i.e checking user type --%>

<%
String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Recruiter Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 50px;
            text-align: center;
        }
        .box {
            background: white;
            width: 500px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #aaa;
        }
        a {
            display: block;
            margin: 15px 0;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Welcome, <%= email %></h2>
        <h3>Recruiter Dashboard</h3>
        <a href="post-job.jsp">➕ Post New Job</a>
        <a href="../ViewPostedJobsServlet">📋 View My Jobs</a>
        <a href="../logout.jsp" style="background-color: #dc3545;">🚪 Logout</a>
    </div>
</body>
</html>
