/**
 * 
 */
package com.lms.service;

/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */

import java.util.logging.Logger;

import com.lms.model.Classfees;


/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */
public interface ClassfeesServices {
	
	
	

	// Initializing logger
	public static final Logger logger = Logger.getLogger(UserService.class.getName());
	
	public int insertClassfees(Classfees classfees);

}

	


