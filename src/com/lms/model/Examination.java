package com.lms.model;

public class Examination {
	
	private String ExamID;
	private String Date;
	private String classroomid;
	public String getExamID() {
		return ExamID;
	}
	public void setExamID(String examID) {
		ExamID = examID;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		this.Date = date;
	}
	public String getClassroomid() {
		return classroomid;
	}
	public void setClassroomid(String classroomid) {
		this.classroomid = classroomid;
	}

}
