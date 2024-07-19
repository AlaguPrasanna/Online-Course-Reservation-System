<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.system.teacherDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.db.DbConnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Course</title>
<%@include file="../component/allCss.jsp" %>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
 <%@include file="../teacher/navbarTeacher.jsp" %>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">Create New Course</p>
                        
                        <form action="../create_Course" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label class="form-label">Course Name</label>
                                <input required name="courseName" type="text" class="form-control">
                            </div>
                           <div class="mb-3">
                                <label class="form-label">Course Code</label>
                                <input name="courseCode" type="text" class="form-control">
                            </div>
                             <div class="mb-3">
                                <label class="form-label">Course Description</label>
                                <textarea name="courseDescription" rows="4" cols="50" class="form-control"></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Course Duration (weeks)</label>
                                <input name="courseDuration" type="number" class="form-control" min="1">
                            </div>
                            
                            <!-- <div class="mb-3">
                                <label class="form-label">Course Image</label>
                                 <input name="courseImage" type="file" class="form-control">
                            </div>   -->
                            
                           <div class="mb-3">
                                <label class="form-label">Course Amount</label>
                                <input name="courseAmount" type="number" class="form-control" min="0">
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Select Teacher</label>
                                <select name="teacherId" class="form-control">
                                    <% teacherDao dao = new teacherDao(DbConnect.getConn());
                                    List<User> teacherList = dao.getAllTeachers();
                                    for (User teacher : teacherList) { %>
                                        <option value="<%= teacher.getId() %>"><%= teacher.getFullname() %></option>
                                    <% } %>
                                </select>
                            </div>
                            
                            <button type="submit" class="btn bg-primary text-white col-md-12">Create Course</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
