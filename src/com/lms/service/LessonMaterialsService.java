package com.lms.service;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.lms.model.ReadingMaterial;
import com.lms.model.VideoMaterial;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */
public interface LessonMaterialsService {
	// Initializing logger
		public static final Logger logger = Logger.getLogger(UserService.class.getName());

		/**
		 * Create Reading Material
		 * 
		 * @param ReadingMaterial
		 */
		public int createReading(ReadingMaterial readingMaterial);
		
		/**
		 * Insert pdf to reading material
		 * 
		 * @param pdf path
		 */
		public int insertPDFtoReading(ReadingMaterial readingMaterial);
		
		/**
		 * Get list of reading materials
		 * 
		 * @param lessonId
		 */
		public ArrayList<ReadingMaterial> getListReadingMaterials(String lessonId);
		
		/**
		 * Delete reading material
		 * 
		 * @param materialId
		 */
		public int deleteReadingMaterial(String materialId);
		
		/**
		 * Delete video material
		 * 
		 * @param materialId
		 */
		public int deleteVideo(String materialId);
		
		/**
		 *Insert Video 
		 * 
		 * @param Video
		 */
		public int insertVideo(VideoMaterial videoMaterial);
		
		/**
		 * Get list of video Materials
		 * 
		 * @param lessonId
		 */
		public ArrayList<VideoMaterial> getListVideo(String lessonId);
		
		/**
		 * Get list of video Materials
		 * 
		 * @param lessonId
		 */
		public int updateViewCount(String lessonId);
}
