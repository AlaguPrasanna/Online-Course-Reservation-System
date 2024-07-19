<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 
<%@ page import="com.entity.Course" %>
<%@ page import="com.system.courseDao" %>
<%@ page import="com.system.teacherDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@page import="com.teacher.servlet.teacherLogin" %>
<%@page import="com.user.servelt.UserLogin" %>


<%
    /* User student = (User) session.getAttribute("userObj");
    
     Integer studentId = (Integer) session.getAttribute("id");
     if (studentId != null) {
         int studentIdValue = studentId.intValue();
         System.out.println(studentIdValue);
         // Now you can use studentIdValue
     } else {
    	 System.out.println("null");
         // Handle the case where studentId is null
     }*/
     User student = (User) session.getAttribute("userObj");
     int studentId = student.getId();
    // System.out.println(studentId);
   
    courseDao dao = new courseDao(DbConnect.getConn());
    List<Course> courseList = dao.getAllCourses();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student</title>

<%@include file="../component/allCss.jsp" %>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.3);
	margin-bottom: 50px; 
}
</style>
</head>
<body>

<%@include file="../student/navbarStudent.jsp" %>
      
      <div class="container p-5">
    <div class="row">
        <% for (Course course : courseList) { %>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body paint-card">
                       
                     
                                          
                        <h4 class="card-title text-center"><%= course.getCourseName() %></h4><br>
                         <h6 class="card-text">Course code: <%= course.getCourseCode() %></h6>
                        <%
                            // Fetch the teacher's name from the course object
                              int teacherId = course.getTeacherId(); 

                             teacherDao tdao = new teacherDao(DbConnect.getConn());
                            String teacherName = tdao.getTeacherNameById(teacherId); // Replace teacherDao with the appropriate instance of your teacherDao class
                        %>
                        <p class="card-text">Handled by: <%= teacherName %></p>
                        <p class="card-text">Description: <%= course.getCourseDescription() %></p>
                        <p class="card-text">Duration: <%= course.getCourseDuration() %> weeks</p>
                        <h6 class="card-text">₹<%=course.getCourseAmount() %></h6>
                         <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#courseModal<%= course.getId() %>">Register</button>
                </div>
            </div>
        </div>
       				 <!-- Modal popup for course details and payment -->
        <div class="modal fade" id="courseModal<%= course.getId() %>" tabindex="-1" aria-labelledby="courseModalLabel<%= course.getId() %>" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="courseModalLabel<%= course.getId() %>"><%= course.getCourseName() %><% course.getCourseAmount(); %></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Course details -->
                        <p><%= course.getCourseDescription() %></p>
                        <!-- Payment button -->
                        <p>₹<%= course.getCourseAmount() %></p>
                        <a href="payment.jsp?course_id=<%= course.getId() %>&course_amount=<%= course.getCourseAmount() %>&teacher_id=<%=teacherId %>&student_id=<%=studentId %>" class="btn btn-warning">Make Payment</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>    
        </div>
</div>


</body>
</html>
