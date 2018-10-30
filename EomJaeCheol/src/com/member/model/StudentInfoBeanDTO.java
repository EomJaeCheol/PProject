package com.member.model;

public class StudentInfoBeanDTO {
	
	private int No;  //구분하기 위한 번호
 	private String department; //소속  1
	private String grade; //학년  2
 	private String majorin; //전공  3
 	private int StuNumber; //학번  4
	private String pass; //비번 5
 	private String name; //이름  6
 	private String jumin; //주민 앞자리만  7
 	private String gender; //성별  8
 	private String phone; //휴대폰 번호  9
	private String email; //이메일 주소  10
 	private String filename; //학생 이미지  11
 	private long filesize; //학생 이미지 사이즈  12
 	private String post;
 	
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMajorin() {
		return majorin;
	}
	public void setMajorin(String majorin) {
		this.majorin = majorin;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public int getNo() {
		return No;
	}
	public void setNo(int no) {
		No = no;
	}
 	public int getStuNumber() {
		return StuNumber;
	}
	public void setStuNumber(int stuNumber) {
		StuNumber = stuNumber;
	}
	
}
