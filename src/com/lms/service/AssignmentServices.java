package com.lms.service;
import java.util.ArrayList;
import com.lms.model.Assignment;
import com.lms.model.Classroom;

public interface AssignmentServices {
	
	public int createAssignment(Assignment assignment);

	public ArrayList<Assignment> getAssignmentList(String Class_ID);

	public Assignment getAssignment(String A_ID);
	
	public int UpdateAssignment(Assignment assignment);
	
	public int DeleteAssignment(String A_ID);
	
	public String generateReport(String Class_ID, String root);

}
