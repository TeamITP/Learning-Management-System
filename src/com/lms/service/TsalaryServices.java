package com.lms.service;

/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */
import java.util.ArrayList;


import java.util.logging.Logger;

import java.util.logging.Logger;

import com.lms.model.Classfees;
import com.lms.model.Classroom;
import com.lms.model.Employee;


/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */

import com.lms.model.Tsalary;

public interface TsalaryServices {
	
	// Initializing logger
		public static final Logger logger = Logger.getLogger(UserService.class.getName());
		
		//Insert Salry
	int insertTsalary(Tsalary tsalary);

	ArrayList<Tsalary> getTsalaryList();

	Tsalary getTsalary(String Payment_ID);

	
}
