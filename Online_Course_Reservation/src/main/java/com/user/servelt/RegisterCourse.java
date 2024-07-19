package com.user.servelt;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import com.system.courseDao;
import com.entity.User;
import com.entity.Course;
import com.db.DbConnect;
@WebServlet("/RegisterCourse")
public class RegisterCourse extends HttpServlet{
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Retrieve student id, teacher id, and course id from request parameters
	        int studentId = Integer.parseInt(request.getParameter("student_id"));
	        int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
	        int courseId = Integer.parseInt(request.getParameter("course_id"));
	        
	        // Instantiate DAO object
	        courseDao dao = new courseDao(DbConnect.getConn());
	        
	        // Insert registration details into the database
	        boolean registrationSuccess = dao.registerCourse(studentId, teacherId, courseId);
	        
	        if (registrationSuccess) {
	            // Registration successful
	            response.sendRedirect("student/indexStudent.jsp");
	        } else {
	            // Registration failed
	            response.sendRedirect("payment.jsp");
	        }
	    }
	}


