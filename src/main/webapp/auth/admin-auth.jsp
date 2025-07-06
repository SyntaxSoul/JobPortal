<%@ page session="true" %>
<%
    String type = (String) session.getAttribute("user_type");
    if (type == null || !type.equals("admin")) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
