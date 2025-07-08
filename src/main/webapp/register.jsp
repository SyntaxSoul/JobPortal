<%
String userType = request.getParameter("type");
if (userType == null) userType = "jobseeker";  // Set sensible default
%>

<!DOCTYPE html>
<html>
<head>
  <title>Register - HireHub</title>
</head>
<body>

<h2>Register as <%= userType %></h2>

<form method="post" action="register">
  <input type="hidden" name="user_type" value="<%= userType %>">

  Name: <input type="text" name="name" placeholder="Full Name" required /><br/>
  Email: <input type="email" name="email" placeholder="you@example.com" required /><br/>
  Password: <input type="password" name="password" placeholder="Create a password" required /><br/>

  <input type="submit" value="Register" />
</form>

</body>
</html>
