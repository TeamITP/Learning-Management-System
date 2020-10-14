package com.lms.servlet;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.lms.service.LessonMaterialServImple;
import com.lms.service.LessonMaterialsService;

/**
 * Servlet implementation class downloadReading
 */
@WebServlet("/downloadReading")
public class downloadReading extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public downloadReading() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("link");
		LessonMaterialsService lessonMaterialsService = new LessonMaterialServImple();
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
	    
	    file.deleteOnExit();
	    response.sendRedirect("UploadedFiles/Readings/" + fileName);
	}

}
