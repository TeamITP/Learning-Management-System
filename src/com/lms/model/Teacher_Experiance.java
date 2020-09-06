package com.lms.model;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public class Teacher_Experiance {
	
	private String q_id;
	private String teacher_ID;
	private String year;
	private String description;
	private String place;
	private String place_contact;
	
	
	public Teacher_Experiance(String q_id, String teacher_ID, String year, String description, String place,
			String place_contact) {
		super();
		this.q_id = q_id;
		this.teacher_ID = teacher_ID;
		this.year = year;
		this.description = description;
		this.place = place;
		this.place_contact = place_contact;
	}


	public String getQ_id() {
		return q_id;
	}


	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}


	public String getTeacher_ID() {
		return teacher_ID;
	}


	public void setTeacher_ID(String teacher_ID) {
		this.teacher_ID = teacher_ID;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getPlace() {
		return place;
	}


	public void setPlace(String place) {
		this.place = place;
	}


	public String getPlace_contact() {
		return place_contact;
	}


	public void setPlace_contact(String place_contact) {
		this.place_contact = place_contact;
	}

	
	
	

}
