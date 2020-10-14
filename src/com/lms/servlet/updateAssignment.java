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
import com.lms.service.AssignmentServices;
/**
 * Servlet implementation class updateAssignment
 */
@WebServlet("/updateAssignment")
public class updateAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    Assignment assignment = new Assignment();
		
		/*
		 * Initialize values for classroom object
		 * */
    
	    assignment.setA_ID(request.getParameter("aId"));
		assignment.setDate(request.getParameter("deadline"));
		assignment.setQuestion(request.getParameter("question"));
		
		AssignmentServices assignmentServices = new AssignmentServiceImpl();
		int status = assignmentServices.UpdateAssignment(assignment);
		
		if(status == 1) {
			request.setAttribute("message", "Question Update Successfully");
			request.setAttribute("link", "teacherAssignments.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		    dis.forward(request, response);
		}
	}

}