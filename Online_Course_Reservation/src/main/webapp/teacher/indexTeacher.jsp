<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher</title>

<%@include file="../component/allCss.jsp" %>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

<%@include file="../teacher/navbarTeacher.jsp" %>
      
      
<div class="paint-card text-center">
  <div class="card-header">
   Courses
  </div>
  <div class="card-body">
    <h5 class="card-title">Hello</h5> ${teacherObj.fullname}
    <p class="card-text">Do you need to create new courses?</p>
    <a href="courseTeacher.jsp" class="btn btn-primary">create courses</a>
  </div>
</div>

		
		
		




</body>
</html>
