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
 * Servlet implementation class Teacher_Registration
 */
@WebServlet("/Teacher_Registration")
public class Teacher_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Teacher_Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String name = request.getParameter("name");
		//String email= request.getParameter("email");
		String contact = request.getParameter("contact");
		String birthdate =request.getParameter("birthday");
		String title =request.getParameter("title");
		String subject =request.getParameter("subject");
		
		
		boolean isTrue;
		isTrue = Teacher_Managment_ServicesImple.insertContact(name, contact,birthdate,title,subject);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Student_feedback.jsp");
			dis2.forward(request, response);
		}*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		response.setContentType("text/html");
		Teacher teacher = new Teacher();
		
		teacher.setName(request.getParameter("name"));
		//teacher.setEmail(request.getParameter("email"));
	    teacher.setContact(request.getParameter("contact"));
		teacher.setBirthdate(request.getParameter("birthday"));
		teacher.setTitle(request.getParameter("title"));
		teacher.setSubject(request.getParameter("subject"));
		
		
		
		 
		
		Teacher_Managment_Services teacher_managment1 = new Teacher_Managment_ServicesImple();
		
		int status = teacher_managment1.registerTeacher(teacher);
		
		if(status == 1) {
			//request.setAttribute("message", "Insert Succesful");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("Teacher_profile.jsp");
		    dis.forward(request, response);
		} else if (status == 0) {
			//request.setAttribute("message", "Insert Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("Teacher_registration.jsp");
		    dis.forward(request, response);
		}
		
		
	}

}
