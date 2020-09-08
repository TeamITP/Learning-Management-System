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
 * Servlet implementation class UpdateClassroom
 */
@WebServlet("/UpdateClassroom")
public class UpdateClassroom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClassroom() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Classroom classroom = new Classroom();
		
		/*
		 * Initialize values for classroom object
		 * */
		
		classroom.setSubject(request.getParameter("subject"));
		classroom.setGrade(Integer.parseInt(request.getParameter("grade")));
		classroom.setDescription(request.getParameter("description"));
		classroom.setClassTime(request.getParameter("clzTime"));
		classroom.setClassrooId(request.getParameter("classroomId"));
		
		ClassroomServices classroomServices = new ClassroomServicesImpl();
		int status = classroomServices.updateClassroom(classroom);
		
		if(status == 1) {
			request.setAttribute("message", "Insert Succesful");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("teacherClassroom.jsp");
			//RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		    //dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		    dis.forward(request, response);
		}
	}

}
