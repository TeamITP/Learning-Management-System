package com.lms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ClassroomClick
 */
@WebServlet("/LessonClick")
public class LessonClick extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lessonId = request.getParameter("lessonId");
		HttpSession httpSession = request.getSession();
    	httpSession.setAttribute("lessonId", lessonId);
    	String userId = (String)httpSession.getAttribute("userId");
    	
    	if(userId.charAt(0) == 'T') {
    	response.sendRedirect("teacherLesson.jsp");
    	} else {
    		response.sendRedirect("studentLesson.jsp");
    	}
	}

}
