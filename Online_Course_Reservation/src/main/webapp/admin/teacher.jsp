<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 
<%@ page import="com.system.teacherDao" %>
<%@ page import="com.db.DbConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher details</title>

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
          <p class="fs-3 text-center">Teacher Details</p>
          

          <table class="table">
            <thead>
              <tr>
                <th scope="col">Full Name</th>
                <th scope="col">Email</th>
                <th scope="col">Dob</th>
                <th scope="col">Gender</th>
                <th scope="col">Educational Background</th>
                <th scope="col">Action</th>
              </tr>
            </thead>
            
            <tbody>
            
            
            <%
            
            teacherDao dao3 = new teacherDao(DbConnect.getConn());
            List<User> teacherList = dao3.getAllTeachers();
            for (User teacher : teacherList) {
            %>
                <tr>
                    <td><%= teacher.getFullname() %></td>
                    <td><%= teacher.getEmail() %></td>
                    <td><%= teacher.getDob() %></td>
                    <td><%= teacher.getGender() %></td>
                    <td><%= teacher.getEduback() %></td>
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
      </div>
    </div>
  </div>
</div>

</body>
</html>
