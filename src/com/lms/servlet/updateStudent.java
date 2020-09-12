package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lms.model.Student;
import com.lms.service.StudentServices;
import com.lms.service.StudentServicesImple;
/**
 * Servlet implementation class updateStudent
 */
@WebServlet("/updateStudent")
public class updateStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Student student = new Student();
		
		student.setStudent_ID(request.getParameter("Student_ID"));
		student.setFristName(request.getParameter("firstName"));
		student.setLastName(request.getParameter("lastName"));
		student.setAddress(request.getParameter("address"));
		student.setPhone(request.getParameter("phone"));
		student.setGuardian(request.getParameter("Guardian"));
		student.setPassword(request.getParameter("password"));
		
		StudentServices studentServices = new StudentServicesImple();
		
		int status = studentServices.updateStudent(student);
		
		if(status == 1) {
			request.setAttribute("message", "Insert Successful");
			request.setAttribute("Student_ID", student.getStudent_ID());
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("studentprofile.jsp");
		    dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			request.setAttribute("Student_ID", student.getStudent_ID());
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("studentprofile.jsp");
		    dis.forward(request, response);
		}
	}

}
