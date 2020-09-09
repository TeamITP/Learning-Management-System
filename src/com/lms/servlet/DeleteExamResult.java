package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.ExamResultServices;
import com.lms.service.ExamResultServicesImp;

/**
 * Servlet implementation class DeleteExamResult
 */
@WebServlet("/DeleteExamResult")
public class DeleteExamResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteExamResult() {
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
		
		
		String ResultId = request.getParameter("resultId");
		
		ExamResultServices examresultservices = new ExamResultServicesImp();
		
		int status = examresultservices.DeleteResult(ResultId);
		 if(status == 1)
		    {
		    	request.setAttribute("message", "delete Successful");
		    	RequestDispatcher dis = request.getRequestDispatcher("ResultTeacherView.jsp");
		    	dis.forward(request, response);    	
		    }
		    else if(status == 0)
		    {
		    	request.setAttribute("message", "deleteFailed");
		    }
	}

}
