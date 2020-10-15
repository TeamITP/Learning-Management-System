package com.lms.model;

public class Certification {
	
	private String TeacherId;
	private String cer;
	
	public String getTeacherId() {
		return TeacherId;
	}

	public void setTeacherId(String teacherId) {
		TeacherId = teacherId;
	}

	public String getCer() {
		System.out.println("");
		return cer;
	}

	public void setCer(String cer) {
		System.out.println("");
		this.cer = cer;
	}

	public Certification(String teacherId, String cer) {
		super();
		TeacherId = teacherId;
		this.cer = cer;
	}
	public Certification() {
		
	}
}
