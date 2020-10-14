package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.service.Teacher_Managment_Services;
import com.lms.service.Teacher_Managment_ServicesImple;

/**
 * Servlet implementation class Teacher_Delete
 */
@WebServlet("/Teacher_Delete")
public class Teacher_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Teacher_Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String teacherId1 = request.getParameter("userId");

		//EmployeeServices employeeServices = new EmployeeServicesImpl();
		Teacher_Managment_Services teacher_managment2 = new Teacher_Managment_ServicesImple();
		int status = teacher_managment2.deleteTeacher1(teacherId1 );
		
		if(status == 1) {
			request.setAttribute("message", "Delete Successful");
			request.setAttribute("link", "adminTeacher.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
			
		} else if (status == 0) {
			request.setAttribute("message", "Delete Failed");
			//request.setAttribute("message", "Student Assigning Failed");
			request.setAttribute("link", "teacherClassroom.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
	}

	}

}
