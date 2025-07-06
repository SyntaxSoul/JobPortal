<!DOCTYPE html>
<html>
<head>
    <title>Admin Access - JobPortal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eee;
            text-align: center;
            padding-top: 100px;
        }
        .box {
            background: white;
            padding: 30px;
            margin: auto;
            width: 400px;
            border-radius: 10px;
            box-shadow: 0px 0px 8px #999;
        }
        a {
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Admin Portal Access</h2>
        <p>Restricted Area – Admin Only</p>
        <form action="login.jsp" method="get">
            <input type="hidden" name="type" value="admin">
            <button type="submit" style="padding: 10px 20px;">Go to Admin Login</button>
        </form>
    </div>
</body>
</html>
