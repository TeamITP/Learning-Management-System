package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.ClassroomServices;
import com.lms.service.ClassroomServicesImpl;

/**
 * Servlet implementation class DeleteClz
 */
@WebServlet("/DeleteClz")
public class DeleteClz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteClz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clzId = request.getParameter("classroomId");
		
		ClassroomServices classroomServices = new ClassroomServicesImpl();
		int status = classroomServices.deleteClassroom(clzId);
		
		if(status == 1) {
			request.setAttribute("message", "Classroom Deleted Successfully");
			request.setAttribute("link", "classroomsTeacher.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Classroom Deleting Failed");
			request.setAttribute("link", "classroomsTeacher.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
