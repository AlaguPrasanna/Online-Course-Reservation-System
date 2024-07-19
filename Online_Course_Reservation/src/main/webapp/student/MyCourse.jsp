<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.entity.Course" %>
<%@ page import="com.system.courseDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Courses</title>
    <%@include file="../component/allCss.jsp" %>
</head>
<body>

<%@include file="../student/navbarStudent.jsp" %>
      
<div class="container p-5">
    <h2 class="text-center">My Registered Courses</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Course Name</th>
                <th>Course Code</th>
                <th>Duration (weeks)</th>
                <th>Amount</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
    // Retrieve the student's ID from the session
    User student = (User) session.getAttribute("userObj");
    int studentId = student.getId();

    // Initialize DAO and retrieve registered courses for the current student
    courseDao dao = new courseDao(DbConnect.getConn());
    List<Course> registeredCourses = dao.getRegisteredCoursesByStudentId(studentId);
    		
    for (Course course : registeredCourses){
        %>
            <tr>
                <td><%= course.getCourseName() %></td>
                <td><%= course.getCourseCode() %></td>
               
                <td><%= course.getCourseDuration() %></td>
                <td><%= course.getCourseAmount() %></td>
                <td>
                    <a href="#" class="btn btn-sm btn-primary">Edit</a>
                    <a href="#" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr>
        <%}
        
      %>
      
      
      

            
        </tbody>
    </table>
</div>

</body>
</html>
