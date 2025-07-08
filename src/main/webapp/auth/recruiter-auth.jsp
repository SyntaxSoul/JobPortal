<%@ page session="true" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equalsIgnoreCase("recruiter")) {
    	
    	response.sendRedirect("../login.jsp");
        return;
    }
%>
