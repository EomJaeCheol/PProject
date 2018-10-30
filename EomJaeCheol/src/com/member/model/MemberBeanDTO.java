package com.member.model;

public class MemberBeanDTO {
	//데이터 전송 객체(DTO)
	private String id;
	private String pass;
	private String name;
	private String year;
	private String month;
	private String day;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	//이메일 인증을 위한 부분
	private String userEmailHash;
	private boolean userEmailChecked;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	//이메일 인증 부분
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	//이메일 인증부분
	
	
	
	
	
	/*public MemberBeanDTO(String id, String pass, String email,String userEmailHash, boolean userEmailChecked) {
		this.id = id;
		this.pass = pass;
		this.email = email;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
	}*/
	/*
	public UserDTO(String userID, String userPassword, String userEmail,

			String userEmailHash, boolean userEmailChecked) {

		this.userID = userID;

		this.userPassword = userPassword;

		this.userEmail = userEmail;

		this.userEmailHash = userEmailHash;

		this.userEmailChecked = userEmailChecked;

	}*/
}
