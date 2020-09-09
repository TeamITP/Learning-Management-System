package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Assignment;
import com.lms.service.AssignmentServiceImpl;

/**
 * Servlet implementation class AddAssignment
 */
@WebServlet("/AddAssignment")
public class AddAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Assignment assignment = new Assignment();
		
		assignment.setClass_ID(request.getParameter("classroomId"));
		assignment.setDate(request.getParameter("deadline"));
		assignment.setQuestion(request.getParameter("question"));
		
		AssignmentServiceImpl assignmentServiceImpl = new AssignmentServiceImpl();
		
		int status = assignmentServiceImpl.createAssignment(assignment);
		
		if(status == 1) {
			request.setAttribute("message", "Insert Succesful");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("teacherAssignments.jsp");
		    dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		    dis.forward(request, response);
		}
	}

}
