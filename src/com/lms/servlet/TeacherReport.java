package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.Teacher_Managment_Services;
import com.lms.service.Teacher_Managment_ServicesImple;
import com.lms.service.Teacher_admin_Services;
import com.lms.service.Teacher_admin_ServicesImple;


/**
 * Servlet implementation class TeacherReport
 */
@WebServlet("/TeacherReport")
public class TeacherReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String teacherId = request.getParameter("teacherID");
		
		Teacher_Managment_Services teacher_managment2 = new Teacher_Managment_ServicesImple();
		String path = teacher_managment2.generateReport(teacherId, getServletContext().getRealPath("/UploadedFiles/PDF"));
		//ClassroomServices classroomServices = new ClassroomServicesImpl();
		//String path = classroomServices.generateReport(teacherId, getServletContext().getRealPath("/UploadedFiles/PDF"));
		
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
