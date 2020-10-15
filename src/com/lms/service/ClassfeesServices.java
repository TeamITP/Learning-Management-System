/**
 * 
 */
package com.lms.service;

import java.util.ArrayList;

/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */

import java.util.logging.Logger;

import com.lms.model.Classfees;
import com.lms.model.Classroom;
import com.lms.model.Employee;


/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */
public interface ClassfeesServices {
	
	
	

	// Initializing logger
	public static final Logger logger = Logger.getLogger(UserService.class.getName());
	
	
	//Insert Class Fees
	public int insertClassfees(Classfees classfees);
	
	
	//Get ClassFees
	
	
	//ArrayList
	public ArrayList<Classfees>  getClassfeesList();
	
	/**
	 * Get ClassFees
	 * 
	 * @param ClassFees
	 */
	public Classfees getClassfees(String Payment_ID);
	
	
	//Update ClassFees
			public int updateClassfees (Classfees classfees);

	//Delete ClassFees
			int deleteClassfee(String Payment_ID);
	
	
	

}

	


