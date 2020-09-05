package com.lms.model;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */

public class VideoMaterial {
	private String videoMatId;
	private String lessonId;
	private String classroomId;
	private String url;
	private String name;
	private String description;
	
	public VideoMaterial() {
		// TODO Auto-generated constructor stub
	}

	public VideoMaterial(String videoMatId, String lessonId, String classroomId, String url, String name,
			String description) {
		super();
		this.videoMatId = videoMatId;
		this.lessonId = lessonId;
		this.classroomId = classroomId;
		this.url = url;
		this.name = name;
		this.description = description;
	}

	public String getVideoMatId() {
		return videoMatId;
	}

	public void setVideoMatId(String videoMatId) {
		this.videoMatId = videoMatId;
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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
