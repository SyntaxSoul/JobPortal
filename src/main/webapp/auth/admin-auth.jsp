<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equalsIgnoreCase("admin")) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
