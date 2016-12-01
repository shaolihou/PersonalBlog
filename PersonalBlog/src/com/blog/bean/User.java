package com.blog.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	private int userID;
	private String userName;
	private String password;
	private String realName;
	private String role;
	private String sex;
	private String email;
	private String telephone;
	private int photoID;
	private Timestamp registerDate;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int userID, String userName, String password, String realName, String role, String sex, String email,
			String telephone, int photoID, Timestamp registerDate) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.role = role;
		this.sex = sex;
		this.email = email;
		this.telephone = telephone;
		this.photoID = photoID;
		this.registerDate = registerDate;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public int getPhotoID() {
		return photoID;
	}
	public void setPhotoID(int photoID) {
		this.photoID = photoID;
	}
	public Timestamp getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}
}
