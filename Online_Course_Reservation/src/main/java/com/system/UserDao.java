package com.system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDao {
	
	private static Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
     public boolean register(User u)
     { 
    	 boolean f= false;
    	 
    	 try {
    		 String sql="insert into student_details(full_name,email,password ,dob,gender,edu_back) values(?,?,?,?,?,?)";
    		 
    		PreparedStatement ps = conn.prepareStatement(sql);
 			ps.setString(1, u.getFullname());
 			ps.setString(2, u.getEmail());
 			ps.setString(3, u.getPassword());
 			ps.setString(4, u.getDob());
 			ps.setString(5, u.getGender());
 			ps.setString(6, u.getEduback());
 			
 			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		}
    	 
    	 catch (Exception e) {
 			e.printStackTrace();
 		}

 		return f;	
    		 
    	 }
     
     
     public User login(String em,String psw)
     {
    	 User u=null;
    	 try 
    	 {
    		 String sql="select * from student_details where email=? and password=? ";
    		 PreparedStatement ps= conn.prepareStatement(sql);
    		 ps.setString(1, em);
    		 ps.setString(2, psw);
    		 
    		 ResultSet rs= ps.executeQuery();
    		 
    		 while(rs.next()) 
    		 {
    			 u=new User();
    			 u.setId(rs.getInt(1));
    			 u.setFullname(rs.getString(2));
    			 u.setEmail(rs.getString(3));
    			 u.setPassword(rs.getString(4));
    			 u.setDob(rs.getString(5));
    			 u.setGender(rs.getString(6));
    			 u.setEduback(rs.getString(7));
    			 
    		 }
    		 
    	 }
    	 
    	 catch(Exception e)
    	 {
    		 e.printStackTrace();
    	 }
    	 
    	 return u;
     }
    	
     public List<User> getAllStudents() {
    	    List<User> studentList = new ArrayList<>();
    	    PreparedStatement ps = null;
    	    ResultSet rs = null;

    	    try {
    	        String sql = "select id, full_name, email, dob, gender, edu_back from student_details "; 
    	        ps = conn.prepareStatement(sql);
    	        rs = ps.executeQuery();

    	        while (rs.next()) {
    	            User student = new User();
    	            student.setId(rs.getInt(1)); 
    	            student.setFullname(rs.getString(2));
    	            student.setEmail(rs.getString(3));
    	            student.setDob(rs.getString(4)); // Correct the index for DOB
    	            student.setGender(rs.getString(5)); // Correct the index for Gender
    	            student.setEduback(rs.getString(6)); // Correct the index for Education Background
    	            studentList.add(student);
    	        }

    	        // Print debug messages outside the loop
    	       // System.out.println("Executing SQL query to fetch all students: SELECT * FROM student_details");
    	       // System.out.println("Total number of students retrieved: " + studentList.size());

    	    } catch (SQLException e) {
    	        e.printStackTrace();
    	        // Handle exception
    	    } finally {
    	        // Close PreparedStatement and ResultSet in finally block
    	        try {
    	            if (rs != null) {
    	                rs.close();
    	            }
    	            if (ps != null) {
    	                ps.close();
    	            }
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	        }
    	    }
    	    
    	    return studentList;
    	}

     }
	

 