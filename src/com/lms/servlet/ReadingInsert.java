package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.model.ReadingMaterial;
import com.lms.service.LessonMaterialServImple;
import com.lms.service.LessonMaterialsService;

/**
 * Servlet implementation class ReadingInsert
 */
@WebServlet("/ReadingInsert")
public class ReadingInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadingInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReadingMaterial readingMaterial = new ReadingMaterial();
		
		HttpSession session = request.getSession();
		readingMaterial.setClassroomId((String) session.getAttribute("classroomId"));
		readingMaterial.setLessonId((String) session.getAttribute("lessonId"));
		readingMaterial.setName(request.getParameter("title"));
		readingMaterial.setDescription(request.getParameter("description"));
		
		LessonMaterialsService lessonMaterialsService = new LessonMaterialServImple();
		int status = lessonMaterialsService.createReading(readingMaterial);
		
		if(status == 1) {
			request.setAttribute("message", "Insert Succesful");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			//RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		    //dis.forward(request, response);
			request.setAttribute("status", "OK");
			response.sendRedirect("insetAcStepTwo.jsp");
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("insetAcStepOne.jsp");
		}
	}

}
