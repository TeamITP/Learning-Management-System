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
@WebServlet("/ClassroomClick")
public class ClassroomClick extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classroomId = request.getParameter("classId");
		HttpSession httpSession = request.getSession();
    	httpSession.setAttribute("classroomId", classroomId);
    	System.out.println(httpSession.getAttribute("classroomId"));
    	response.sendRedirect("teacherClassroom.jsp");
	}

}
