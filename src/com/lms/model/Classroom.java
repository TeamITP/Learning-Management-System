package com.lms.model;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */

public class Classroom {
	private String classrooId;
	private int grade;
	private String subject;
	private String teacherId;
	private String description;
	private String classTime;

	public Classroom() {
		// TODO Auto-generated constructor stub
	}

	//Overloaded Constructor
	public Classroom(String classrooId, int grade, String subject, String teacherId, String description,
			String classTime) {
		super();
		this.classrooId = classrooId;
		this.grade = grade;
		this.subject = subject;
		this.teacherId = teacherId;
		this.description = description;
		this.classTime = classTime;
	}
	
	

	public Classroom(int grade, String subject, String teacherId, String description, String classTime) {
		super();
		this.grade = grade;
		this.subject = subject;
		this.teacherId = teacherId;
		this.description = description;
		this.classTime = classTime;
	}

	//Setters and Getters
	public String getClassrooId() {
		return classrooId;
	}

	public void setClassrooId(String classrooId) {
		this.classrooId = classrooId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getClassTime() {
		return classTime;
	}

	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	
	
	
}
