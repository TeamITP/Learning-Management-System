package com.lms.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
		
		try(PrintWriter printWriter = response.getWriter()) {
			//Fetch form data
			Part part  = request.getPart("file");
			
			String fileName = part.getSubmittedFileName();
			//String path = "C:\\Users\\yasir\\git\\Learning-Management-System\\WebContent\\UploadedFiles\\Readings" + File.separator + fileName;
			
			String path = getServletContext().getRealPath("\\WebContent\\UploadedFiles\\Readings" + File.separator + fileName);
			
			InputStream inputStream = part.getInputStream();
			boolean status = uploadFile(inputStream, path);
			
			System.out.println(status + " path ->" + path);
		}
	}
	
	public boolean uploadFile(InputStream inputStream, String path) {
		boolean test = false;
		try {
			byte[]  byt = new byte[inputStream.available()];
			inputStream.read();
			
			FileOutputStream fileOutputStream = new FileOutputStream(path);
			fileOutputStream.write(byt);
			fileOutputStream.flush();
			fileOutputStream.close();
			
			test = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return test;
	}

}
