package com.lms.service;
import java.util.ArrayList;
import com.lms.model.Assignment;
import com.lms.model.Classroom;

public interface AssignmentServices {
	
	public int createAssignment(Assignment assignment);

	public ArrayList<Assignment> getAssignmentList(String Class_ID);

	public Assignment getAssignment(String A_ID);
}
