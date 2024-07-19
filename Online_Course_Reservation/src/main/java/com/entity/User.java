package com.entity;

import java.sql.Date;

public class User {
	private int id;
	private String fullname;
	private String email;
	private String password;
	private String dob;
	private String gender;
	private String eduback;
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User (String fullname, String email, String password, String dob2, String gender, String eduback) {
		super();
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.dob = dob2;
		this.gender = gender;
		this.eduback = eduback;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEduback() {
		return eduback;
	}
	public void setEduback(String eduback) {
		this.eduback = eduback;
	}
	
	public String toString() {
        return "User [fullname=" + fullname + "]";
    }

}
