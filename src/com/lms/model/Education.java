package com.lms.model;


/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public class Education {
		
	private String TeacherId;
	private String education;
	
	
	public Education() {
		// TODO Auto-generated constructor stub
	}
	public String getTeacherId() {
		return TeacherId;
	}

	public void setTeacherId(String teacherId) {
		TeacherId = teacherId;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	

	public Education(String teacherId, String education) {
		super();
		TeacherId = teacherId;
		this.education = education;
	}
}
