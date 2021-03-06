package com.lms.service;

/**
 *  Imbulana Liyanage D.S.I.
 * IT19134772
 */

import java.sql.Date;
import java.util.ArrayList;

/**
 * Imbulana Liyanage D.S.I.
 * IT19134772
 */

import java.util.logging.Logger;

import com.lms.model.Classroom;
import com.lms.model.Student;
 

public interface StudentServices {
	// Initializing logger
		public static final Logger logger = Logger.getLogger(UserService.class.getName());


		 
		public int StudentRegistration(Student student);
		
		 
		public Student getStudent(String Student_ID);
		
		public int deleteStudent(String Student_ID);
		
		 
		public int updateStudent(Student student);
		
		/**
		 * Get list of Lessons
		 * @return ArrayList<Lesson>
		 * @param Class Id
		 */
 
		public Student getStudentById(String studentId);
		
		public int removeStudentClassroom(String studentId, String classroomId);
		
		public int addStudentClassroom(String studentId, String classroomId);
		
		public String studentgenerateReport(String classroomId, String root);
		
		public ArrayList<Student> getStudentList();


		public int removeStudent(String Student_ID);


		public Student CountStudent();
		
		ArrayList<Student> getStudentArrayList(String classroomId);


		ArrayList<Student> getStudentArrayListbyDate(String classroomId, java.util.Date startDate, java.util.Date endDate);


}
