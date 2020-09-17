package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.model.Employee;
import com.lms.service.EmployeeServices;
import com.lms.service.EmployeeServicesImpl;

/**
 * Servlet implementation class EmployeeDelete
 */
@WebServlet("/EmployeeDelete")
public class EmployeeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId = request.getParameter("userId");

		EmployeeServices employeeServices = new EmployeeServicesImpl();
		
		int status = employeeServices.deleteEmployee(empId);
		
		if(status == 1) {
			request.setAttribute("message", "Delete Successful");
			HttpSession session=request.getSession();  
	        session.invalidate();
	        //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("index.jsp");
			//RequestDispatcher dis = request.getRequestDispatcher("teacherClassroom.jsp");
		    //dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Delete Failed");
			request.setAttribute("userId", empId);
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("EmpProfile.jsp");
		    dis.forward(request, response);
	}

}
}
