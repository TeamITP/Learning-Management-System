//Anuththara K.G.S.N
//IT19142692

package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.EmployeeServices;
import com.lms.service.EmployeeServicesImpl;
/**
 * Servlet implementation class EmployeeReport
 */
@WebServlet("/EmployeeReport")
public class EmployeeReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId = request.getParameter("empId");
		
		EmployeeServices employeeServices = new EmployeeServicesImpl();
		String path = employeeServices.generateReport(empId, getServletContext().getRealPath("/UploadedFiles/PDF"));
		if(path != null) {
			response.sendRedirect(path);
		}else {
			request.setAttribute("message", "Error in Generating Report");
			request.setAttribute("link", "EmpProfile.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
