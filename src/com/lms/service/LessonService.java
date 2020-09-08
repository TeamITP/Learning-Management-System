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
	 * @param Lesson
	 */
	public int createLesson(Lesson lesson);
	
	/**
	 * Get list of Lessons
	 * @return ArrayList<Lesson>
	 * @param Class Id
	 */
	public ArrayList<Lesson> getListLessons(String classId);
	
	/**
	 * Get the lesson By Id
	 * @return Lesson
	 * @param Lesson Id
	 */
	public Lesson getLessonById(String lessonId);
	
	/**
	 * delete Lesson
	 * @return int
	 * @param Lesson id
	 */
	public int deleteLesson(String lessonId);
	
	/**
	 * Update Lesson
	 * @return int
	 * @param Lesson Id
	 */
	public int updateLesson(Lesson lesson);
	
	/**
	 * Add Lesson
	 * @return int
	 * @param Lesson 
	 */
	public int insertLesson(Lesson lesson);
	
}
