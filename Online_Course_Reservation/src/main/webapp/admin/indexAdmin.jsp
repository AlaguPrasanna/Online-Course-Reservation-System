<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>

<%@include file="../component/allCss.jsp" %>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

<%@include file="../admin/navbarAdmin.jsp" %>
      
      

<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>
		
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="fa-solid fa-users-rectangle fa-3x"></i><br>
						<a  href="student.jsp" class="fs-4 text-center">
							Students <br>
						</a>
					</div>
				</div>
			</div>



			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
					<i class="fa-solid fa-person-chalkboard fa-3x"></i><br>
						<a  href="teacher.jsp" class="fs-4 text-center">
							Teachers <br>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<a  href="course.jsp" class="fs-4 text-center">
							Total Courses <br>
						</a>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2">

				<div class="card paint-card " data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-primary">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Placements <br>
						</p>
					</div>
				</div>

			</div>

		</div>
	</div>




</body>
</html>
