<%@ page import="java.util.*" %>
<%@ include file="../auth/user-auth.jsp" %>

<%
    Map<String, String> profile = (Map<String, String>) request.getAttribute("profile");
    String fullName = profile.getOrDefault("full_name", "");
    String phone = profile.getOrDefault("phone", "");
    String city = profile.getOrDefault("city", "");
    String education = profile.getOrDefault("education", "");
%>

<html>
<head>
    <title>My Profile</title>
    <style>
        .label { font-weight: bold; }
        .field-view { margin-bottom: 15px; }
        .edit-btn, .save-btn, .cancel-btn {
            margin-top: 20px;
            padding: 8px 15px;
            font-size: 14px;
        }
        .hidden { display: none; }
    </style>
</head>
<body>
    <h2>My Profile</h2>

    <!-- Read Mode -->
    <div id="profile-view">
        <div class="field-view"><span class="label">Full Name:</span> <%= fullName %></div>
        <div class="field-view"><span class="label">Phone:</span> <%= phone %></div>
        <div class="field-view"><span class="label">City:</span> <%= city %></div>
        <div class="field-view"><span class="label">Education:</span><br/><pre><%= education %></pre></div>

        <button class="edit-btn" onclick="enableEdit()"> Edit Profile</button>
    </div>

    <!-- Edit Mode -->
    <form id="profile-form" class="hidden" method="post" action="UserProfileServlet">
        <div class="field-view">
            <span class="label">Full Name:</span><br/>
            <input type="text" name="full_name" value="<%= fullName %>" />
        </div>
        <div class="field-view">
            <span class="label">Phone:</span><br/>
            <input type="text" name="phone" value="<%= phone %>" />
        </div>
        <div class="field-view">
            <span class="label">City:</span><br/>
            <input type="text" name="city" value="<%= city %>" />
        </div>
        <div class="field-view">
            <span class="label">Education:</span><br/>
            <textarea name="education" rows="4" cols="40"><%= education %></textarea>
        </div>

        <button type="submit" class="save-btn"> Save</button>
        <button type="button" class="cancel-btn" onclick="cancelEdit()"> Cancel</button>
    </form>

    <script>
        function enableEdit() {
            document.getElementById('profile-view').classList.add('hidden');
            document.getElementById('profile-form').classList.remove('hidden');
        }

        function cancelEdit() {
            document.getElementById('profile-form').classList.add('hidden');
            document.getElementById('profile-view').classList.remove('hidden');
        }
    </script>
</body>
</html>
