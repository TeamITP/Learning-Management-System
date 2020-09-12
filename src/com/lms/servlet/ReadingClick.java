package com.lms.servlet;

import java.io.IOException;
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
		
		response.sendRedirect(request.getParameter("link"));
	}

}
