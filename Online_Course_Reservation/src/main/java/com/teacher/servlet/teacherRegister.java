package com.teacher.servlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;

	import java.sql.Date;
	import java.text.ParseException;
	import java.text.SimpleDateFormat;

	import com.db.DbConnect;
	import com.entity.User;
	import com.system.UserDao;
    import com.system.teacherDao;

import java.io.IOException;

	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;

	@WebServlet("/teacher_register")
	public class teacherRegister<Date> extends HttpServlet {

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			 
			try {
				String fullName = req.getParameter("fullname");
				String email = req.getParameter("email");
				String password = req.getParameter("password");
				String dob = req.getParameter("dob");
				String gender = req.getParameter("gender");
				String eduBackground = req.getParameter("eduBackground");
				
				

				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsedDate;
				try {
				    parsedDate = sdf.parse(dob);
				    
				    java.sql.Date dob1 = new java.sql.Date(parsedDate.getTime());

				    
				} catch (ParseException e) {
				    
				    e.printStackTrace();
				}
				
				User u =new User(fullName,email,password,dob,gender,eduBackground);
				
				teacherDao dao =new teacherDao(DbConnect.getConn());
				
				HttpSession session= req.getSession();
				
				boolean f=dao.register(u);
				
				if(f)
				{
					session.setAttribute("sucMsg","Register Succesfully" );
					resp.sendRedirect("teacherSignUp.jsp");
					
				}
				else
				{
					session.setAttribute("errorMsg","Something wrong on server" );
					resp.sendRedirect("teacherSignUp.jsp");
				}
				
				
			}
			
			
			catch (Exception e) {
				
			}
		}
		

	}


