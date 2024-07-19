    package com.teacher.servlet;
	import java.io.IOException;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
	import com.db.DbConnect;
	import com.entity.User;
	import com.system.UserDao;
    import com.system.teacherDao;

	@WebServlet("/teacherLogin")
	public class teacherLogin extends HttpServlet{

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			HttpSession session = req.getSession();
	        
			teacherDao dao =new teacherDao(DbConnect.getConn());
			User user = dao.login(email, password);
			
			if (user !=null) {
				session.setAttribute("teacherObj", user);
				resp.sendRedirect("teacher/indexTeacher.jsp");
			} else {
				session.setAttribute("errorMsg", "invalid email & password");
				resp.sendRedirect("teacherLogin.jsp");
			}
		}
		
		
		

	}


