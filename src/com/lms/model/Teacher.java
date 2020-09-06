package com.lms.model;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public class Teacher {
	private String TeacherId;
	private String Email;
	private String Name;
	private String Contact;
	private String Birthdate;
	private String Title;
	private String Subject;
	
	
	public Teacher(String teacherId, String email, String name, String contact, String birthdate, String title,
			String subject) {
		super();
		TeacherId = teacherId;
		Email = email;
		Name = name;
		Contact = contact;
		Birthdate = birthdate;
		Title = title;
		Subject = subject;
	}


	public String getTeacherId() {
		return TeacherId;
	}


	public void setTeacherId(String teacherId) {
		TeacherId = teacherId;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
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
