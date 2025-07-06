<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ include file="../auth/user-auth.jsp" %> <%--I created auth file and added user-auth.jsp for code reusability i.e checking user type --%>

<%
    List<Map<String, String>> jobs = (List<Map<String, String>>) request.getAttribute("jobs");
    String company = (String) request.getAttribute("company");
%>

<html>
<head><title><%= company %> - Job Listings</title></head>
<body>
    <h2>Jobs at <%= company %></h2>
    <ul>
        <%
            for (Map<String, String> job : jobs) {
        %>
            <li>
                <b><%= job.get("title") %></b> | <%= job.get("location") %> | Posted on <%= job.get("posted_at") %><br/>
                <i><%= job.get("description") %></i><br/>
                <form action="user/apply-job.jsp" method="post" style="margin-top: 5px;">
                    <input type="hidden" name="job_id" value="<%= job.get("id") %>"/>
                    <input type="submit" value="Apply"/>
                </form>
                <hr>
            </li>
        <%
            }
        %>
    </ul>
</body>
</html>
