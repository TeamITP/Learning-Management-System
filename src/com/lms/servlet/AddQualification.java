package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Certification;
import com.lms.model.Teacher_Qualification;
import com.lms.service.Teacher_Managment_Services;
import com.lms.service.Teacher_Managment_ServicesImple;

/**
 * Servlet implementation class AddQualification
 */
@WebServlet("/AddQualification")
public class AddQualification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Teacher_Qualification que = new Teacher_Qualification();
		
		que.setTeacher_id(request.getParameter("teacherId"));
		que.setDescription(request.getParameter("que"));
		
		
	     Teacher_Managment_Services teacher_managment1 = new Teacher_Managment_ServicesImple();
	     
		int status = teacher_managment1.addQue(que);
		
		if(status == 1) {
			request.setAttribute("message", "New Record was added");
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
