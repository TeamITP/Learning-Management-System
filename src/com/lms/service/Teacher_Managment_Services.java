package com.lms.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.Certification;
import com.lms.model.Classroom;
import com.lms.model.Education;
import com.lms.model.Teacher;
import com.lms.model.Teacher_Experiance;
import com.lms.model.Teacher_Qualification;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public interface Teacher_Managment_Services {
	
	public static final Logger logger = Logger.getLogger(UserService.class.getName());
	
	public int registerTeacher(Teacher teacher);
	
	public Teacher getTeacher(String teacherId);
	//public Teacher getTeacher();
	public Teacher CountTeacher() ;
	public int addEdu(Education edu) ;
	public int addCer(Certification cer ) ;
	public int addQue(Teacher_Qualification que);
	public int addExp(Teacher_Experiance exp);
	public ArrayList<Education> getEducationList(String teacherId);
	public ArrayList<Certification> getCertificationList(String teacherId);
	public ArrayList<Teacher_Experiance> getTeacher_ExperianceList(String teacherId);
	public ArrayList<Teacher> getTeacherList();
	//public ArrayList<Teacher_Experiance> getTeacher_ExperianceList(String teacherId);
	public ArrayList<Teacher_Qualification> getTeacher_QualificationList(String teacherId);
	public int deleteTeacher(String empId);
	public int deleteTeacher1(String empId);
	public int updateTeacher(Teacher teacher);
	public int updateTeacherEducation( Education education );
	
	
	public String generateReport(String teacherId, String root);
}
