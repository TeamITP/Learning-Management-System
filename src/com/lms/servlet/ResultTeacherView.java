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
 * Servlet implementation class ResultTeacherView
 */
@WebServlet("/ResultTeacherView")
public class ResultTeacherView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultTeacherView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String StuID = request.getParameter("id");
		int Marks  =Integer.parseInt(request.getParameter("marks"));
		String ExamID = request.getParameter("exmaId");
		
		ExamResult examresult = new ExamResult();
		
		examresult.setStudent_ID(StuID);
		examresult.setMarks(Marks);
		examresult.setExam_ID(ExamID);
		
		ExamResultServices examresultservices = new ExamResultServicesImp();
		int status = examresultservices.InsertResult(examresult);
		
		 if(status == 1)
		    {
		    	request.setAttribute("message", "Insert Successful");
		    	RequestDispatcher dis = request.getRequestDispatcher("ResultTeacherView.jsp");
		    	dis.forward(request, response);    	
		    }
		    else if(status == 0)
		    {
		    	request.setAttribute("message", "Insert Failed");
		    }
	}

}
