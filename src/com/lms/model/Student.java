package com.lms.model;


/**
 *  Imbulana Liyanage D.S.I.
 * IT19134772
 */

public class Student {
	private String Student_ID;
	private String fristName;
	private String lastName;
	private String address;
	private String phone;
	private String Guardian;
	private String password;
	
	public Student(String student_ID, String fristName, String lastName, String address, String phone, String guardian,
			String password) {
		super();
		Student_ID = student_ID;
		this.fristName = fristName;
		this.lastName = lastName;
		this.address = address;
		this.phone = phone;
		Guardian = guardian;
		this.password = password;
	}

	public Student() {
		// TODO Auto-generated constructor stub
	}
	public String getStudent_ID() {
		return Student_ID;
	}

	public String getFristName() {
		return fristName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getAddress() {
		return address;
	}

	public String getPhone() {
		return phone;
	}

	public String getGuardian() {
		return Guardian;
	}

	public String getPassword() {
		return password;
	}

	public void setStudent_ID(String student_ID) {
		Student_ID = student_ID;
	}

	public void setFristName(String fristName) {
		this.fristName = fristName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setGuardian(String guardian) {
		Guardian = guardian;
	}

	public void setPassword(String password) {
		this.password = password;
	}	
}
