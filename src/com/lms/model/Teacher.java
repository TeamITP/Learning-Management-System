package com.lms.model;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public class Teacher {
	private String TeacherId;
	private int count;
	
	private String Name;
	private String Contact;
	private String Birthdate;
	private String Title;
	private String Subject;
	private String pw;
	
	
	
	public Teacher(String teacherId, String name, String contact, String birthdate, String title,
			String subject,String pw1) {
		super();
		TeacherId = teacherId;
		
		Name = name;
		Contact = contact;
		Birthdate = birthdate;
		Title = title;
		Subject = subject;
		pw=pw1;
	}


	public Teacher() {
		super();
	}


	public String getTeacherId() {
		return TeacherId;
	}


	public void setTeacherId(String teacherId) {
		TeacherId = teacherId;
	}
	public int getcount() {
		return count;
	}


	public void setcount(int count1) {
		count = count1;
	}


	public String getpw() {
		return pw;
	}


	public void setpw(String pw1) {
		pw =pw1;
	}


	public String getName() {
		return Name;
	}


	public void setName(String name) {
		Name = name;
	}


	public String getContact() {
		return Contact;
	}


	public void setContact(String contact) {
		Contact = contact;
	}


	public String getBirthdate() {
		return Birthdate;
	}


	public void setBirthdate(String birthdate) {
		Birthdate = birthdate;
	}


	public String getTitle() {
		return Title;
	}


	public void setTitle(String title) {
		Title = title;
	}


	public String getSubject() {
		return Subject;
	}


	public void setSubject(String subject) {
		Subject = subject;
	}


	
	


}
