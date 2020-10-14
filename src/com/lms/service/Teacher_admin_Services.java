package com.lms.service;
/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */

import java.util.logging.Logger;

public interface Teacher_admin_Services {
	
	public static final Logger logger = Logger.getLogger(UserService.class.getName());

	public String generateReport(String teacherId, String root);
}
