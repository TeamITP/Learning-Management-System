package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.service.StudentServices;
import com.lms.service.StudentServicesImple;

/**
 * Servlet implementation class deleteStudent
 */
@WebServlet("/deleteStudent")
public class deleteStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Student_ID = request.getParameter("userId");

		StudentServices  studentServices = new StudentServicesImple();
		
		int status = studentServices.deleteStudent(Student_ID);
		
		if(status == 1) {
			request.setAttribute("message", "Delete Successful");
			HttpSession session=request.getSession();  
	        session.invalidate();
	        //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("studentprofile.jsp");
			//RequestDispatcher dis = request.getRequestDispatcher("teacherClassroom.jsp");
		    //dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Delete Failed");
			request.setAttribute("userId", Student_ID);
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("studentprofile.jsp");
		    dis.forward(request, response);
	}

}
}
