package com.lms.service;

import java.util.logging.Logger;

import com.lms.model.Employee;

/*Anuththara K.G.S.N*/
/*IT19142692*/
public interface EmployeeServices {
	// Initializing logger
		public static final Logger logger = Logger.getLogger(UserService.class.getName());
		
		//Register Employee
		public int insertEmployee(Employee employee);
		
		//Get EmployeeById
		public Employee getEmployee(String empid);
		
		//Delete Employee Profile
		public int deleteEmployee(String empId);
		
		//Update Employee Profile
		public int updateEmployee(Employee employee);
}
