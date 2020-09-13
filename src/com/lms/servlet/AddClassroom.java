package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Classroom;
import com.lms.service.ClassroomServices;
import com.lms.service.ClassroomServicesImpl;

/**
 * Servlet implementation class AddClassroom
 */
@WebServlet("/AddClassroom")
public class AddClassroom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		Classroom classroom = new Classroom();
		
		/*
		 * Initialize values for classroom object
		 * */
		
		classroom.setSubject(request.getParameter("subject"));
		classroom.setGrade(Integer.parseInt(request.getParameter("grade")));
		classroom.setDescription(request.getParameter("description"));
		classroom.setClassTime(request.getParameter("clzTime"));
		classroom.setTeacherId(request.getParameter("teacherId"));
		
		ClassroomServices classroomServices = new ClassroomServicesImpl();
		int status = classroomServices.createClass(classroom);
		
		if(status == 1) {
			request.setAttribute("message", "Classroom Inserted Successfully");
			request.setAttribute("link", "classroomsTeacher.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Classroom Inserting Failed");
			request.setAttribute("link", "classroomsTeacher.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
