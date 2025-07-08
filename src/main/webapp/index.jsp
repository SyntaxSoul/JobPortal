<!DOCTYPE html>
<html>
<head>
  <title>Welcome to HireHub</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      text-align: center;
      padding-top: 50px;
      background-color: #f4f4f4;
    }
    h2 {
      font-size: 28px;
      margin-bottom: 30px;
    }
    .btn {
      display: inline-block;
      padding: 14px 28px;
      margin: 20px;
      border-radius: 8px;
      text-decoration: none;
      color: white;
      font-size: 18px;
    }
    .jobseeker {
      background-color: #007bff;
    }
    .recruiter {
      background-color: #28a745;
    }
  </style>
</head>
<body>

  <h2>Welcome to HireHub</h2>
  <p>Select how you'd like to get started:</p>

  <!-- ✅ Corrected type values to match ENUM -->
  <a href="register.jsp?type=jobseeker" class="btn jobseeker">I am a Job Seeker</a>
  <a href="register.jsp?type=recruiter" class="btn recruiter">I am a Recruiter</a>

</body>
</html>
