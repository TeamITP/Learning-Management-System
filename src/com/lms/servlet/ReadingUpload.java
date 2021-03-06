package com.lms.servlet;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.lms.model.ReadingMaterial;
import com.lms.service.LessonMaterialServImple;
import com.lms.service.LessonMaterialsService;
import com.lms.service.UserService;
import com.sun.tools.javac.util.Log;

/**
 * Servlet implementation class ReadingUpload
 */
@WebServlet("/ReadingUpload")
@MultipartConfig
public class ReadingUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadingUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		
		 // Create path components to save the file
	    final String path = getServletContext().getRealPath("/UploadedFiles/Readings");
	    final Part filePart = request.getPart("file");
	    final String fileName = filePart.getSubmittedFileName();
	    
	    OutputStream out = null;
	    InputStream filecontent = null;
	    int status = 0;
	    /*final PrintWriter writer = response.getWriter();
	    

	    try {
	        out = new FileOutputStream(new File(path + File.separator
	                + fileName));
	        filecontent = filePart.getInputStream();
	        
	        String newFile = "UploadedFiles/Readings/"  + fileName;

	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1) {
	            out.write(bytes, 0, read);
	        }
	        */
	        LessonMaterialsService lessonMaterialsService = new LessonMaterialServImple();
	        String newFile = lessonMaterialsService.uploadToBlob(filePart);
	        
	        ReadingMaterial readingMaterial = new ReadingMaterial();
	        readingMaterial.setPathLink(newFile);
	        HttpSession session = request.getSession();
			readingMaterial.setClassroomId((String) session.getAttribute("classroomId"));
	        
	        status = lessonMaterialsService.insertPDFtoReading(readingMaterial);
	        if(status == 1) {
				request.setAttribute("message", "Insert Succesful");
				response.sendRedirect("insertStepThree.jsp");
			} else if (status == 0) {
				request.setAttribute("message", "Insert Failed");
				//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
				//dispatcher.forward(request, response);
				response.sendRedirect("insetAcStepTwo.jsp");
			}
	    } 
	    
	}
	