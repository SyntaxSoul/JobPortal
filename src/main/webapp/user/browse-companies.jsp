<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dao.CompanyDAO" %>
<%@ page session="true" %>
<%@ include file="../auth/user-auth.jsp" %>

<%
    CompanyDAO dao = new CompanyDAO();
    List<String> companies = dao.getAllCompanies();
%>

<!DOCTYPE html>
<html>
<head>
  <title>Browse Companies</title>
</head>
<body>
  <h2>Companies Hiring</h2>
  <ul>
    <%
      for (String company : companies) {
    %>
      <li><a href="../CompanyJobsServlet?company=<%= company %>"><%= company %></a></li>
    <%
      }
    %>
  </ul>
</body>
</html>
