package com.lms.service;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.http.Part;

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
		
		/**
		 * Upload reading materials to blob storage
		 * 
		 * @param Part
		 */
		public String uploadToBlob(Part part);
		
		/**
		 * Delete reading materials from blob storage
		 * 
		 * @param Part
		 */
		public void deleteFromBlob(String fileName);
		
		/**
		 * Download reading from Blob Storage
		 * 
		 * @param Part
		 */
		public ByteArrayOutputStream downloadFromBlob(String id);
		
		
		
}
