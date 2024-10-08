<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.db.DbConnect" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<title>EduVista</title>
<%@include file="component/allCss.jsp" %>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<% Connection conn=DbConnect.getConn();%>

<div class="container">
<div id="carouselExampleIndicators" class="carousel slide custom-caro" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="images/caro4.png" class="d-block w-100" alt="..." height="650px" ">
    </div>
    <div class="carousel-item">
      <img src="images/caro2.png" class="d-block w-100" alt="..." height="650px">
    </div>
    <div class="carousel-item">
      <img src="images/caro5.png" class="d-block w-100" alt="..." height="650px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>
</div>

	<div class="container p-3">
		<p class="text-center fs-2 ">Key Features</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Personalized Learning Paths</p>
								<p>Provide users with personalized learning journeys based on their interests, skills, and learning preferences</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Interactive Assessments and Feedback</p>
								<p>Enhance the learning experience with interactive assessments, quizzes, and assignments. </p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Live Virtual Classes and Collaboration Tools</p>
								<p>Integrate live virtual classes or webinars, allowing students to interact with instructors in real-time</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Career Readiness and Job Placement Services</p>
								<p>Offer career-focused features, including guidance on career paths, skill development, and integrated job placement services</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="images/key1.png" width="500px" >
			</div>

		</div>
	</div>
	
	<div class="container p-2">
		<p class="text-center fs-2 "> Meet Our Teachers</p>
		
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="images/Ap.jpeg" width="250px" height="300px">
						<p class="fw-bold fs-5">Alagu Prasanna M</p>
						<p class="fs-7">Software Development</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="images/Tj.png" width="250px" height="300px">
						<p class="fw-bold fs-5">Manoj T</p>
						<p class="fs-7">Cybersecurity</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="images/Bs.png" width="250px" height="300px">
						<p class="fw-bold fs-5">Balasubramanian K</p>
						<p class="fs-7"> Data Science and Analytics</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="images/EM.png" width="250px" height="300px">
						<p class="fw-bold fs-5">Manikandan E</p>
						<p class="fs-7">Web Development and Design</p>
					</div>
				</div>
			</div>

		</div>

	</div>

<%@include file="component/footer.jsp" %>
	
</body>
</html>
