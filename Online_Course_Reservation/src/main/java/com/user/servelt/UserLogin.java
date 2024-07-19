package com.user.servelt;

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

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();
		
        
		UserDao dao =new UserDao(DbConnect.getConn());
		User user = dao.login(email, password);
		
		if (user !=null) {
			//System.out.println(user.getId());
			session.setAttribute("userObj", user);
			resp.sendRedirect("student/indexStudent.jsp");
		} else {
			session.setAttribute("errorMsg", "invalid email & password");
			resp.sendRedirect("studentLogin.jsp");
		}
		
		
	}
	
	
	

}
