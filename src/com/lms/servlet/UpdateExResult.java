package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.ExamResult;
import com.lms.service.ExamResultServices;
import com.lms.service.ExamResultServicesImp;

/**
 * Servlet implementation class UpdateResult
 */
@WebServlet("/UpdateExResult")
public class UpdateExResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateExResult() {
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
		
		int Marks  =Integer.parseInt(request.getParameter("marks"));
		String ResultId = request.getParameter("resultId");
		
		ExamResult examresult = new ExamResult();
		
		examresult.setMarks(Marks);
		
		
		ExamResultServices examresultservices = new ExamResultServicesImp();	
		
		int status = examresultservices.UpdateResult(ResultId, Marks);
		 if(status == 1)
		    {
			 request.setAttribute("message", "Result Update Succssfully ");
				request.setAttribute("link", "ResultTeacherView.jsp");
				request.setAttribute("status", "OK");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
				dispatcher.forward(request, response); 	 	
		    }
		    else if(status == 0)
		    {
		    	request.setAttribute("message", "updateFailed");
		    }
	}

}
