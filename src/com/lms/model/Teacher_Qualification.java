package com.lms.model;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public class Teacher_Qualification {

	private String q_id;
	private String teacher_id;
	private String description;
	
	public Teacher_Qualification(String q_id, String teacher_id, String description) {
		super();
		this.q_id = q_id;
		this.teacher_id = teacher_id;
		this.description = description;
	}
	public Teacher_Qualification() {}

	public String getQ_id() {
		return q_id;
	}

	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
}
