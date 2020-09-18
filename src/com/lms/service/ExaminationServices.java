package com.lms.service;

import java.util.ArrayList;

import com.lms.model.Examination;

public interface ExaminationServices {
	
	//insert Data
	public int InsertExamination(Examination examination);


   public ArrayList<Examination> getExaminationList(String classroomid);

   
   public Examination getExamination(String examId);

   
   public String generateReport(String examId, String root);

}