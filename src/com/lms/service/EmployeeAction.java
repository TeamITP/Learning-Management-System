package com.lms.service;

import java.util.logging.Logger;

import com.lms.model.Classroom;
import com.lms.model.Employee;

/*Anuththara K.G.S.N*/
/*IT19142692*/

public interface EmployeeAction {
	// Initializing logger
	public static final Logger logger = Logger.getLogger(UserService.class.getName());
	
	public int insertEmployee(Employee employee);
	
}
