<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../auth/admin-auth.jsp" %><%--I created auth file and added admin-auth.jsp for code reusability i.e checking user type --%>
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
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            text-align: center;
            padding: 40px;
        }
        .box {
            background: white;
            width: 60%;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 10px #aaa;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Welcome Admin: <%= email %></h2>
        <p>🔢 Total Users: [Coming Soon]</p>
        <p>👤 Total Recruiters: [Coming Soon]</p>
        <p>📄 Total Jobs Posted: [Coming Soon]</p>
        <a href="../logout.jsp" style="color: red;">Logout</a>
    </div>
</body>
</html>
