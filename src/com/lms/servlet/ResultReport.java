package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.ClassroomServices;
import com.lms.service.ClassroomServicesImpl;
import com.lms.service.ExamResultServices;
import com.lms.service.ExamResultServicesImp;
import com.lms.service.ExaminationServices;
import com.lms.service.ExaminationServicesImp;

/**
 * Servlet implementation class ResultReport
 */
@WebServlet("/ResultReport")
public class ResultReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultReport() {
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
    String examid = request.getParameter("examid");
    int maxvalue = Integer.parseInt(request.getParameter("my-datalist"));
    
    
    System.out.println("exam marks"+maxvalue);
		
		ExaminationServices examinationServices = new ExaminationServicesImp();
		String path = examinationServices.generateReport(examid,maxvalue,getServletContext().getRealPath("/UploadedFiles/PDF"));
		
		if (path != null) {
			
			response.sendRedirect(path);
			
		} else {
			request.setAttribute("message", "Error in Generating Report");
			request.setAttribute("link", "classroomsTeacher.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		
		}
	}

}
