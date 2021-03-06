package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.AssignmentServiceImpl;
import com.lms.service.AssignmentServices;

/**
 * Servlet implementation class deleteAssignment
 */
@WebServlet("/deleteAssignment")
public class deleteAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteAssignment() {
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
		String A_ID = request.getParameter("A_ID");
		
		AssignmentServices assignmentservices = new AssignmentServiceImpl();
		
		int status = assignmentservices.DeleteAssignment(A_ID);
		 if(status == 1)
		    {
		    	request.setAttribute("message", "delete Successful");
		    	RequestDispatcher dis = request.getRequestDispatcher("teacherAssignments.jsp");
		    	dis.forward(request, response);    	
		    }
		    else if(status == 0)
		    {
		    	request.setAttribute("message", "deleteFailed");
		    }
	}

}

