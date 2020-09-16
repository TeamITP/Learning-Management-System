package com.lms.model;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */

public class ReadingMaterial {
	private String readingMatId;
	private String lessonId;
	private String classroomId;
	private String name;
	private String description;
	private String pathLink;
	private int views;
	
	public ReadingMaterial() {
		// TODO Auto-generated constructor stub
	}

	//Overloaded Constructor
	public ReadingMaterial(String readingMatId, String lessonId, String classroomId, String name, String description,
			String pathLink) {
		super();
		this.readingMatId = readingMatId;
		this.lessonId = lessonId;
		this.classroomId = classroomId;
		this.name = name;
		this.description = description;
		this.pathLink = pathLink;
	}
	
	//Setters and Getters

	public String getReadingMatId() {
		return readingMatId;
	}

	public void setReadingMatId(String readingMatId) {
		this.readingMatId = readingMatId;
	}

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

	public String getPathLink() {
		return pathLink;
	}

	public void setPathLink(String pathLink) {
		this.pathLink = pathLink;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}
	
	
}
