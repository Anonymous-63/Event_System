package com.Event_System.Entity;

import java.sql.Timestamp;

public class User {
	private int id;
	private String uname;
	private String tel;
	private String email;
	private String password;
	private Timestamp dateTime;
	private String profile;
	private String name;
	private String gender;

	public User(int id, String uname, String tel, String email, String password, Timestamp dateTime, String profile,String name,String gender) {
		super();
		this.id = id;
		this.uname = uname;
		this.tel = tel;
		this.email = email;
		this.password = password;
		this.dateTime = dateTime;
		this.profile = profile;
		this.name = name;
		this.gender = gender;
	}

	public User(String uname, String tel, String email, String password, String profile, String name, String gender) {
		super();
		this.uname = uname;
		this.tel = tel;
		this.email = email;
		this.password = password;
		this.profile = profile;
		this.name = name;
		this.gender = gender;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
