package com.lms.model;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */

public class Lesson {
	private String lessonId;
	private String classroomId;
	private String name;
	private String description;
	
	public Lesson() {
		// TODO Auto-generated constructor stub
	}
	
	//Overloaded Constructor
	public Lesson(String lessonId, String classroomId, String name, String description) {
		super();
		this.lessonId = lessonId;
		this.classroomId = classroomId;
		this.name = name;
		this.description = description;
	}

	//Setters and Getters
	public String getLessonId() {
		return lessonId;
	}

	public void setLessonId(String lessonId) {
		this.lessonId = lessonId;
	}

	public String getClassroomId() {
		return classroomId;
	}

	public void setClassroomId(String classroomId) {
		this.classroomId = classroomId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	

}
