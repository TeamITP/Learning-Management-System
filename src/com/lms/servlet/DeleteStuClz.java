package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.StudentServices;
import com.lms.service.StudentServicesImple;

/**
 * Servlet implementation class DeleteStuClz
 */
@WebServlet("/DeleteStuClz")
public class DeleteStuClz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStuClz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classroomId = request.getParameter("classroomId");
		String studentId = request.getParameter("studentId");
		
		StudentServices studentServices = new StudentServicesImple();
		int status = studentServices.removeStudentClassroom(studentId, classroomId);
		
		if(status == 1) {
			request.setAttribute("message", "Delete Succesful");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("teacherClassroom.jsp");
			//RequestDispatcher dis = request.getRequestDispatcher("teacherClassroom.jsp");
		    //dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Delete Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("teacherClassroom.jsp");
		    dis.forward(request, response);
		}
	}

}
