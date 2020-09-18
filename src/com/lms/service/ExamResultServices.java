package com.lms.service;

import java.util.ArrayList;

import com.lms.model.ExamResult;

public interface ExamResultServices {
	
	
	public  int InsertResult(ExamResult examresult);
	
	
	public ArrayList<ExamResult> getExamResultList(String ExamID);
	
	
	
	public int UpdateResult(String resultId,int marks);
	
	
	public int DeleteResult(String resultid);
	
	
	public ExamResult getstudentmarks(String studentid,String examid);
	
	
	public ExamResult getResult(String Resultid);
	
	
	

}
