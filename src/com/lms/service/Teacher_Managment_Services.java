package com.lms.service;

import java.util.logging.Logger;

import com.lms.model.Classroom;
import com.lms.model.Teacher;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public interface Teacher_Managment_Services {
	
	public static final Logger logger = Logger.getLogger(UserService.class.getName());
	
	public int registerTeacher(Teacher teacher);

}
