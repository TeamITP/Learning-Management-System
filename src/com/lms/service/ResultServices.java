package com.lms.service;

import java.util.logging.Logger;

import com.lms.model.Result;

/**
 * Imbulana Liyanage D.S.I.
 * IT19134772
 */

public interface ResultServices {
	// Initializing logger
			public static final Logger logger = Logger.getLogger(UserService.class.getName());


			/**
			 * Create Result
			 * 
			 * @param Result
			 */
			public int enterstudentresult(Result result);

}
