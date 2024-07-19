package com.teacher.servlet;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DbConnect;
import com.entity.Course;
import com.sun.tools.javac.parser.ReferenceParser.ParseException;
import com.system.courseDao;


@WebServlet("/create_Course")
@MultipartConfig
public class CreateCourse extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			String CourseName=null;
			String CourseCode=null;
			String CourseDescription=null;
			String CourseDuration=null;
			int CourseDuration1=0;
			String CourseAmount=null;
			double CourseAmount1=0.0;
			String TeacherId=null;
			int TeacherId1=0;
			
			 CourseName=req.getParameter("courseName");
			 CourseCode=req.getParameter("courseCode");
			 CourseDescription=req.getParameter("courseDescription");
			 CourseDuration=req.getParameter("courseDuration");
			 CourseDuration1 = Integer.parseInt(CourseDuration);
			 CourseAmount=req.getParameter("courseAmount");
			 CourseAmount1= Double.parseDouble(CourseAmount);
			 TeacherId=req.getParameter("teacherId");
			 TeacherId1=Integer.parseInt(TeacherId);
			 //Part part = req.getPart("courseImage");
			 //String CourseImage = part.getSubmittedFileName();
			 
			Course c =new Course(CourseName,CourseCode,CourseDescription,CourseDuration1,CourseAmount1,TeacherId1);
			courseDao dao = new courseDao(DbConnect.getConn());
				
				HttpSession session =req.getSession();
				boolean f= dao.addCourse(c);
				if(f)
				{
					
					//System.out.println(Path);
					//String Path = getServletContext().getRealPath("")+"course_img";
					//System.out.println(Path);
					
					//File file = new File(Path);
					//part.write(Path+File.separator+CourseImage);

					//File file = new File(Path);
					//part.write(Path+File.separator+CourseImage);
					//session.setAttribute("sucMsg","course created Successfully" );
					resp.sendRedirect("teacher/indexTeacher.jsp");
				}
				else
				{
				
						session.setAttribute("errorMsg","Something wrong on server" );
						resp.sendRedirect("courseTeacher.jsp");
					
				}
			 
		}
		catch (Exception e) {
		    
		    e.printStackTrace();
		}
		
		
		
		
	}
	
	

}
