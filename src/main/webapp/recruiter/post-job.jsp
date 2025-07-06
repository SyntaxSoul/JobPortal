<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../auth/recruiter-auth.jsp" %><%--I created auth file and added recruiter-auth.jsp for code reusability i.e checking user type --%>

<%
String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Post New Job</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 40px;
        }
        form {
            background: white;
            padding: 30px;
            width: 400px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        input, textarea {
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            padding: 10px 20px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form action="../PostJobServlet" method="post">
        <h2>Post a New Job</h2>
        <input type="text" name="title" placeholder="Job Title" required />
        <input type="text" name="company" placeholder="Company Name" required />
        <input type="text" name="location" placeholder="Location" required />
        <textarea name="description" placeholder="Job Description" rows="5" required></textarea>
        <button type="submit">Post Job</button>
    </form>
</body>
</html>
