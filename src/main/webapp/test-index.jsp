<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<section id="hero" class="hero d-flex align-items-center">
  <div class="container text-center">
    <h1>Welcome to HireHUB</h1>
    <h2>Connecting talent with opportunity.</h2>
    <a href="#role-options" id="get-started-btn" class="btn-get-started">Get Started</a>
    
    <div id="role-options" class="mt-4">
    	<h4>Choose Your Role</h4>
		<div class="d-flex justify-content-center gap-3 mt-3 flex-wrap">
			<a href="register.jsp?role=jobseeker" class="btn btn-primary glow-hover">I'm a Job Seeker</a>
			<a href="register.jsp?role=recruiter" class="btn btn-success glow-hover">I'm a Recruiter</a>
		</div>
	</div>

  
  </div>
</section>


<section id="features" class="features">
  <div class="container">
    <div class="row gy-4">
      <div class="col-lg-4">
        <div class="feature-card p-4">
          <i class="bi bi-search fs-1 text-primary"></i>
          <h5 class="mt-3">Search Jobs</h5>
          <p>Browse from thousands of job listings.</p>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="feature-card p-4">
          <i class="bi bi-people fs-1 text-primary"></i>
          <h5 class="mt-3">Apply Easily</h5>
          <p>Submit applications with a couple of clicks.</p>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="feature-card p-4">
          <i class="bi bi-cash-stack fs-1 text-primary"></i>
          <h5 class="mt-3">Get Hired</h5>
          <p>Let employers find and offer you great opportunities.</p>
        </div>
      </div>
    </div>
  </div>
  
</section>

<%@ include file="footer.jsp" %>
