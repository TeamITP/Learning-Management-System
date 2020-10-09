package com.lms.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.Classroom;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */

public interface ClassroomServices {

	// Initializing logger
	public static final Logger logger = Logger.getLogger(UserService.class.getName());

	/**
	 * Create classroom
	 * 
	 * @param Classroom
	 */
	public int createClass(Classroom classrom);
	
	/**
	 * Get List of classroom
	 * 
	 * @param teacherId
	 */
	public ArrayList<Classroom> getClassroomList(String teacherId);
	
	/**
	 * Get List of classroom for Students
	 * 
	 * @param teacherId
	 */
	public ArrayList<Classroom> getClassroomListStudent(String studentId);
	
	/**
	 * Get ClassroomById
	 * 
	 * @param classroomId
	 */
	public Classroom getClassroom(String classroomId);
	
	/**
	 *Update Classroom
	 * 
	 * @param classroomId
	 */
	public int updateClassroom(Classroom classroom);
	
	public String generateReport(String classroomId, String startDate, String endDate, String string);
	
	public int deleteClassroom(String classroomId);
}
