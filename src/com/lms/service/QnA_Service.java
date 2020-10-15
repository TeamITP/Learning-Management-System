package com.lms.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.QnA;

public interface QnA_Service {
	
	// Initializing logger
	public static final Logger logger = Logger.getLogger(QnA_Service.class.getName());
		
	public int addQuestion(QnA qnA);
	
	public int updateQuestion(QnA qnA);
	
	public int deleteQuestion(String id);
	
	public int addReply(QnA qnA);
	
	public int updateReply(QnA qnA);
	
	public int deleteReply(String id);
	
	public ArrayList<QnA> getReliedQuestions(String clzId);
	
	public ArrayList<QnA> getUnRepliedQuestions(String clzId);
	
	public ArrayList<QnA> getStudentQuestionAnswered(String clzId, String stuId);
	
	public ArrayList<QnA> getStudentQuestionNotAnswered(String clzId, String stuId);
}
