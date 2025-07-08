<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equalsIgnoreCase("jobseeker")) {
        response.sendRedirect("../login.jsp?authentication failed!");
        return;
    }
%>
