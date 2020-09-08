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
import javax.servlet.http.Part;

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
		
		/*try(PrintWriter printWriter = response.getWriter()) {
			//Fetch form data
			Part part  = request.getPart("file");
			
			String fileName = part.getSubmittedFileName();
			//String path = "C:\\Users\\yasir\\git\\Learning-Management-System\\WebContent\\UploadedFiles\\Readings" + File.separator + fileName;
			
			String path = getServletContext().getRealPath("/UploadedFiles/Readings" + File.separator + fileName);
			
			InputStream inputStream = part.getInputStream();
			boolean status = uploadFile(inputStream, path);
			
			if(status == true) {
				System.out.println(path);
			}
		}*/
		
		
		
		 // Create path components to save the file
	    final String path = getServletContext().getRealPath("/UploadedFiles/Readings");
	    final Part filePart = request.getPart("file");
	    final String fileName = filePart.getSubmittedFileName();

	    OutputStream out = null;
	    InputStream filecontent = null;
	    final PrintWriter writer = response.getWriter();

	    try {
	        out = new FileOutputStream(new File(path + File.separator
	                + fileName));
	        filecontent = filePart.getInputStream();
	        
	        String newFile = path + File.separator  + fileName;

	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1) {
	            out.write(bytes, 0, read);
	        }
	        writer.println("New file " + fileName + " created at " + path);
	        System.out.println( "File" + fileName + "being uploaded to" + path);
	    } catch (FileNotFoundException fne) {
	        writer.println("You either did not specify a file to upload or are "
	                + "trying to upload a file to a protected or nonexistent "
	                + "location.");
	        writer.println("<br/> ERROR: " + fne.getMessage());

	        System.out.println("Problems during file upload. Error: " +fne.getMessage());
	    } finally {
	        if (out != null) {
	            out.close();
	        }
	        if (filecontent != null) {
	            filecontent.close();
	        }
	        if (writer != null) {
	            writer.close();
	        }
	    }
	}
	

}
