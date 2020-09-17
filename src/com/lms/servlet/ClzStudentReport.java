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

/**
 * Servlet implementation class ClzStudentReport
 */
@WebServlet("/ClzStudentReport")
public class ClzStudentReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClzStudentReport() {
        super();
        // TODO Auto-generated constructor stub
      
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String classroomId = request.getParameter("classroomId");
		
		ClassroomServices classroomServices = new ClassroomServicesImpl();
		String path = classroomServices.generateReport(classroomId, getServletContext().getRealPath("/UploadedFiles/PDF"));
		
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
