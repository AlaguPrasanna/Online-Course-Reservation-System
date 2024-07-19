<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.entity.Course" %>
<%@ page import="com.system.courseDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@page import="com.teacher.servlet.teacherLogin" %>


<% 
    // Retrieve the teacher's ID from the session
    //int teacherId = (int) session.getAttribute("teacherId");

          // Retrieve the teacher object from the session
     /*User teacher = (User) session.getAttribute("teacherObj");
     int teacherId = teacher.getId();
     String teacherName=teacher.getFullname();*/

    // Initialize DAO and retrieve courses for the current teacher
    
    User teacher = (User) session.getAttribute("teacherObj");
    int teacherId1 = teacher.getId();
    String teacherName1=teacher.getFullname();
                             
    courseDao dao = new courseDao(DbConnect.getConn());
    List<Course> courseList = dao.getCoursesByTeacherId(teacherId1);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Page</title>
    <%@include file="../component/allCss.jsp" %>
    
</head>
<body>
    <%@include file="../teacher/navbarTeacher.jsp" %>

     <div class="container p-5">
        <div class="row">
            <% for (Course course : courseList) { %>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                       
                                                  
                            <h4 class="card-title text-center"><%= course.getCourseName() %></h4><br>
                            <p class="card-text"> <b>CourseCode: </b><%= course.getCourseCode() %></p>
                            <p class="card-text">
                            
                            </p>
                             <p class="card-text"><b>Handled by:</b> <%=teacher.getFullname() %> </p>
                            <p class="card-text"><b>Description:</b> <%= course.getCourseDescription() %></p>
                            <p class="card-text"><b>Duration:</b> <%= course.getCourseDuration() %> weeks</p>
                            
                            
                            
                            
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
