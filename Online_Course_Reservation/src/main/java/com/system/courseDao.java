package com.system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Course;
import com.db.DbConnect;

public class courseDao {

    private Connection conn;

   
    public courseDao(Connection conn) {
    	super();
    	this.conn=conn;
		// TODO Auto-generated constructor stub
	}

	// Method to insert a new course into the database
    public boolean addCourse(Course course) {
        String sql = "INSERT INTO course (course_name,course_code,course_description,course_duration,course_amount,teacher_id) VALUES (?,?,?,?,?,?)";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, course.getCourseName());
            statement.setString(2, course.getCourseCode());
            statement.setString(3, course.getCourseDescription());
            statement.setInt(4, course.getCourseDuration());
            statement.setDouble(5, course.getCourseAmount());
            statement.setInt(6, course.getTeacherId());
            //statement.setString(7, course.getCourseImage());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    // Method to retrieve all courses from the database
    public List<Course> getAllCourses() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM course";
        try (PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCourseName(rs.getString("course_name"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseDescription(rs.getString("course_description"));
                course.setCourseDuration(rs.getInt("course_duration"));
               course.setCourseAmount(rs.getDouble("course_amount"));
                course.setTeacherId(rs.getInt("teacher_id"));
                //course.setCourseImage(rs.getString("course_image"));
                courses.add(course);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return courses;
    }

    public List<Course> getCoursesByTeacherId(int teacherId) {
        List<Course> courses = new ArrayList<>();
        try (Connection conn = DbConnect.getConn()) {
            String sql = "SELECT * FROM course WHERE teacher_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, teacherId);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setCourseName(rs.getString("course_name"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseDescription(rs.getString("course_description"));
                course.setCourseDuration(rs.getInt("course_duration"));
                course.setCourseAmount(rs.getDouble("course_amount"));
                course.setTeacherId(rs.getInt("teacher_id"));
               // course.setCourseImage(rs.getString("course_image"));

                courses.add(course);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return courses;
    }
    
    public boolean registerCourse(int studentId, int teacherId, int courseId) {
        boolean isSuccess = false;
        PreparedStatement stmt = null;

        try {
            // Prepare SQL statement to insert registration details
            String sql = "INSERT INTO registration (student_id, teacher_id, course_id) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            stmt.setInt(2, teacherId);
            stmt.setInt(3, courseId);

            // Execute the SQL statement
            int rowsAffected = stmt.executeUpdate();

            // If registration is successful, rowsAffected will be greater than 0
            isSuccess = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }
    
    public List<Course> getRegisteredCoursesByStudentId(int studentId) {
        List<Course> registeredCourses = new ArrayList<>();
        try {
            String sql = "SELECT * FROM registration WHERE student_id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, studentId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("course_id");
                Course course = getCourseById(courseId);
                if (course != null) {
                    registeredCourses.add(course);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return registeredCourses;
    }

    public Course getCourseById(int courseId) {
        Course course = null;
        try {
            String sql = "SELECT * FROM course WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, courseId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                course = new Course();
                course.setId(rs.getInt("id"));
                course.setCourseName(rs.getString("course_name"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseDescription(rs.getString("course_description"));
                course.setCourseDuration(rs.getInt("course_duration"));
                course.setCourseAmount(rs.getDouble("course_amount"));
                course.setTeacherId(rs.getInt("teacher_id"));
               // course.setCourseImage(rs.getString("course_image"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return course;
    }


}
