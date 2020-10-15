package com.lms.servlet;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.LessonMaterialServImple;
import com.lms.service.LessonMaterialsService;

/**
 * Servlet implementation class ReadingClick
 */
@WebServlet("/ReadingClick")
public class ReadingClick extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LessonMaterialsService lessonMaterialsService = new LessonMaterialServImple();
		lessonMaterialsService.updateViewCount(request.getParameter("materialId"));
		
		String fileName = request.getParameter("link");
		ByteArrayOutputStream byteArrayOutputStream = lessonMaterialsService.downloadFromBlob(fileName);
		
		final String path = getServletContext().getRealPath("/UploadedFiles/Readings");
	    
	    OutputStream out = null;
	    
	    File file = new File(path + File.separator + fileName);
	    
	    try {
	    	
	        out = new FileOutputStream(file);
	        
	        byteArrayOutputStream.writeTo(out);
	        
	    } catch (Exception e) {
			e.printStackTrace();
		}
	    
	    response.sendRedirect("UploadedFiles/Readings/" + fileName);
	}

}
