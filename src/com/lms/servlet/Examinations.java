package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Examination;
import com.lms.service.ExaminationServices;
import com.lms.service.ExaminationServicesImp;

/**
 * Servlet implementation class Examination
 */
@WebServlet("/Examinations")
public class Examinations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Examinations() {
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
		
		
		String Date = request.getParameter("date");
		
		Examination examination = new Examination();
		 examination.setDate(Date);
		 examination.setClassroomid(request.getParameter("classroomId"));
		 
		 ExaminationServices examinationservices = new ExaminationServicesImp();
		int status = examinationservices.InsertExamination(examination);
		
	    if(status == 1)
	    {request.setAttribute("message", "Exam Succssfully Added");
		request.setAttribute("link", "teacherExams.jsp");
		request.setAttribute("status", "OK");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
		dispatcher.forward(request, response); 	 	
	    }
	    else if(status == 0)
	    {
	    	request.setAttribute("message", "Insert Failed");
	    }
	   
		
		
	}

}
