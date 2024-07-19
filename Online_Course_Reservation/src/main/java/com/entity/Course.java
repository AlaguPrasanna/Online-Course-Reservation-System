package com.entity;
	public class Course {
	    private int id;
	    private String courseName;
	    private String courseCode;
	    private  String courseDescription;
	    private int courseDuration;
	    private double courseAmount;
	   //private String courseImage; // Assuming course image is stored as a byte array
	    private int teacherId;

	    // Constructors, getters, and setters

	    public Course() {
	    }

	    public Course( String courseName, String courseCode,String courseDescription,int courseDuration,double courseAmount,int teacherId) {
	        this.id = id;
	        this.courseName = courseName;
	        this.courseCode = courseCode;
	        this.courseDescription = courseDescription;
	        this.courseDuration = courseDuration;
	        this.courseAmount = courseAmount;
	        //this.courseImage = courseImage;
	        this.teacherId = teacherId;
	    }

	    // Getters and setters for all fields

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getCourseName() {
	        return courseName;
	    }

	    public void setCourseName(String courseName) {
	        this.courseName = courseName;
	    }

	  public String getCourseCode() {
	        return courseCode;
	    }

	    public void setCourseCode(String courseCode) {
	        this.courseCode = courseCode;
	    }

	    public String getCourseDescription() {
	        return courseDescription;
	    }

	    public void setCourseDescription(String courseDescription) {
	        this.courseDescription = courseDescription;
	    }

	      public int getCourseDuration() {
	        return courseDuration;
	    }

	    public void setCourseDuration(int courseDuration) {
	        this.courseDuration = courseDuration;
	    }

	    public double getCourseAmount() {
	        return courseAmount;
	    }

	    public void setCourseAmount(double courseAmount) {
	        this.courseAmount = courseAmount;
	    }

	   /* public String getCourseImage() {
	        return courseImage;
	    }

	    public void setCourseImage(String courseImage) {
	        this.courseImage = courseImage;
	    }*/

	    public int getTeacherId() {
	        return teacherId;
	    }

	    public void setTeacherId(int teacherId) {
	        this.teacherId = teacherId;
	    }
	}


