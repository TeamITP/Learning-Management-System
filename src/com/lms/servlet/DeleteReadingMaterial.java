package com.lms.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.LessonMaterialServImple;
import com.lms.service.LessonMaterialsService;

/**
 * Servlet implementation class DeleteReadingMaterial
 */
@WebServlet("/DeleteReadingMaterial")
public class DeleteReadingMaterial extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String path = getServletContext().getRealPath(request.getParameter("path"));
		
		LessonMaterialsService lessonMaterialsService = new LessonMaterialServImple();
		
		int status = lessonMaterialsService.deleteReadingMaterial(request.getParameter("materialId"));
		
		if(status == 1) {
			request.setAttribute("message", "Reading Material Deleted Successfully");
			request.setAttribute("link", "teacherLesson.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Reading Material Deleting Failed");
			request.setAttribute("link", "teacherLesson.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
