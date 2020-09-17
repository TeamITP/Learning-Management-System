package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Education;
import com.lms.model.Teacher;
import com.lms.service.Teacher_Managment_Services;
import com.lms.service.Teacher_Managment_ServicesImple;

/**
 * Servlet implementation class Teacher_Profile_Education_Update
 */
@WebServlet("/Teacher_Profile_Education_Update")
public class Teacher_Profile_Education_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Education education = new Education();
		education.setTeacherId(request.getParameter("Teacher_ID"));
		education.setEducation(request.getParameter("edu"));
		
		
	Teacher_Managment_Services teacher_managment1 = new Teacher_Managment_ServicesImple();
		
		int status = teacher_managment1.updateTeacherEducation( education );
		
		if(status == 1) {
			request.setAttribute("message", "Insert Successful");
			request.setAttribute("Teacher_ID",  education .getTeacherId());
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("Teacher_profile_update.jsp");
		    dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			request.setAttribute("Teacher_ID",  education.getTeacherId());
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		    dis.forward(request, response);
		}
	}

}
