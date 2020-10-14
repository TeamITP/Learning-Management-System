package com.lms.servlet;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
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
 * Servlet implementation class Teacher_Profile_Delete
 */
@WebServlet("/Teacher_Profile_Delete")
public class Teacher_Profile_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teacherId = request.getParameter("userId");

		//EmployeeServices employeeServices = new EmployeeServicesImpl();
		Teacher_Managment_Services teacher_managment1 = new Teacher_Managment_ServicesImple();
		int status = teacher_managment1.deleteTeacher(teacherId );
		
		if(status == 1) {
			//request.setAttribute("message", "Delete Successful");
			//HttpSession session=request.getSession();  
	       // session.invalidate();
	        //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			//response.sendRedirect("index.jsp");
			//RequestDispatcher dis = request.getRequestDispatcher("teacherClassroom.jsp");
		    //dis.forward(request, response);
			request.setAttribute("message", "Successfully Deleted");
			request.setAttribute("link", "index.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Delete Failed");
			//request.setAttribute("message", "Student Assigning Failed");
			request.setAttribute("link", "Teacher_profile.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
	}

	}
}
