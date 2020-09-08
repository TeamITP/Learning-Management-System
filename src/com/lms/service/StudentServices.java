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


		/**
		 * Create student
		 * 
		 * @param student
		 */
		public int StudentRegistration(Student student);
		
		/**
		 * Get Student_ID
		 * 
		 * @param Student_ID
		 */
		public Student getStudent(String Student_ID);

}
