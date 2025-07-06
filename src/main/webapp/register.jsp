<%
String userType = request.getParameter("type");
if (userType == null) userType = "user";  // Default fallback
%>

<html>
<head><title>Register</title></head>
<body>
<h2>Register</h2>
<form method="post" action="register">
	<input type="hidden" name="user_type" value="<%= userType %>">
  Name: <input type="text" name="name" /><br/>
  Email: <input type="text" name="email" /><br/>
  Password: <input type="password" name="password" /><br/>
  <input type="submit" value="Register"/>
</form>
</body>
</html>
