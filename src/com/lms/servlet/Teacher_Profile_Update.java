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

import com.lms.model.Teacher;
import com.lms.service.Teacher_Managment_Services;
import com.lms.service.Teacher_Managment_ServicesImple;

/**
 * Servlet implementation class Teacher_Profile_Update
 */
@WebServlet("/Teacher_Profile_Update")
public class Teacher_Profile_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Teacher teacher = new Teacher();
		teacher.setTeacherId(request.getParameter("Teacher_ID"));
		teacher.setName(request.getParameter("name"));
		teacher.setTitle(request.getParameter("title"));
		teacher.setSubject(request.getParameter("subject"));
	    teacher.setContact(request.getParameter("contact"));
		teacher.setBirthdate(request.getParameter("birthday"));
		teacher.setpw(request.getParameter("pass"));
		
	Teacher_Managment_Services teacher_managment1 = new Teacher_Managment_ServicesImple();
		
		int status = teacher_managment1.updateTeacher(teacher);
		
		if(status == 1) {
			request.setAttribute("message", "Successfully Updated");
			request.setAttribute("link", "Teacher_profile.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", " Failed! Try again");
			request.setAttribute("link", "teacherClassroom.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);	
		}
	}
	

}
