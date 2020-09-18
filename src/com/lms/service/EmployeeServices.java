package com.lms.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.CommonNotice;
import com.lms.model.Employee;
import com.lms.model.Student;

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

		//Generate Report
		public String generateReport(String empId, String root);
		
		//Get a List
		public ArrayList<Employee> getEmployeeArrayList();
		
		//Remove Employee
		public int removeEmployee(String empId);
		
		//Count of employees
		public Employee CountEmployee();
}
