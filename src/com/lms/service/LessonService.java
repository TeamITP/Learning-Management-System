package com.lms.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.Lesson;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */
public interface LessonService {
	// Initializing logger
	public static final Logger logger = Logger.getLogger(UserService.class.getName());

	/**
	 * Create Lesson
	 * @return int
	 * @param Classroom
	 */
	public int createLesson(Lesson lesson);
	
	/**
	 * Get list of Lessons
	 * @return ArrayList<Lesson>
	 * @param Classroom
	 */
	public ArrayList<Lesson> getListLessons(String classId);
	
	
}
