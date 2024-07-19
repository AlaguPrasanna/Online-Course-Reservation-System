<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 
<%@ page import="com.system.teacherDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Course" %>
<%@ page import="com.system.courseDao" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>course details</title>

<%@include file="../component/allCss.jsp" %>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>

<%@include file="../admin/navbarAdmin.jsp" %>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-10">
      <div class="card paint-card">
        <div class="card-body">
          <p class="fs-3 text-center">Course Details</p>
          

          <table class="table">
            <thead>
              <tr>
                <th scope="col">Course Name</th>
                <th scope="col">Course Code</th>
                <th scope="col">Course Description</th>
                <th scope="col">Course Duration</th>
                <th scope="col">Course Amount</th>
                <th scope="col">Handled by(Teacher's ID)</th>
                <th scope="col">Action</th>
                
              </tr>
            </thead>
            
            <tbody>
            
            
            <%
            courseDao dao = new courseDao(DbConnect.getConn());
            List<Course> courseList = dao.getAllCourses();
            for (Course course : courseList){
            %>
                <tr>
                    <td><%= course.getCourseName() %></td>
                    <td><%= course.getCourseCode() %></td>
                    <td><%= course.getCourseDescription() %></td>
                    <td><%= course.getCourseDuration() %></td>
                    <td><%= course.getCourseAmount() %></td>
                    <td><%= course.getTeacherId() %></td>
                    <td>
                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
            <%}
            
            %>
            

      </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
