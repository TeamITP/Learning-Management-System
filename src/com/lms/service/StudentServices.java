package com.lms.service;



/**
 * Imbulana Liyanage D.S.I.
 * IT19134772
 */

import java.util.logging.Logger;

 
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
		public ArrayList<Student> getListStudent(String Student_ID);
		
		public ArrayList<Student> getStudentArrayList(String classroomId);
		
		public Student getStudentById(String studentId);
		
		public int removeStudentClassroom(String studentId, String classroomId);
		
		public int addStudentClassroom(String studentId, String classroomId);


}
