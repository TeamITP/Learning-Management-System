package com.lms.model;

// Tharusha

public class ExamResult {
	
	
	private String Result_ID;
	private String  Exam_ID;
	private  String Student_ID;
	private int Marks;
	private int Rank;
	
	
	public int getRank() {
		return Rank;
	}
	public void setRank(int rank) {
		Rank = rank;
	}
	public String getResult_ID() {
		return Result_ID;
	}
	public void setResult_ID(String result_ID) {
		Result_ID = result_ID;
	}
	public String getExam_ID() {
		return Exam_ID;
	}
	public void setExam_ID(String exam_ID) {
		Exam_ID = exam_ID;
	}
	public String getStudent_ID() {
		return Student_ID;
	}
	public void setStudent_ID(String student_ID) {
		Student_ID = student_ID;
	}
	public int getMarks() {
		return Marks;
	}
	public void setMarks(int marks) {
		Marks = marks;
	}
	public ExamResult() {
		
	}
	
	
	
	

}
