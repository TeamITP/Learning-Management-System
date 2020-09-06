package com.lms.service;

import java.util.logging.Logger;

import com.lms.model.Student;

/**
 * Imbulana Liyanage D.S.I.
 * IT19134772
 */

public interface StudentServices {
	// Initializing logger
		public static final Logger logger = Logger.getLogger(UserService.class.getName());

		/**
		 * Create student
		 * 
		 * @param student
		 */
		public int StudentRegistration(Student student);
}
