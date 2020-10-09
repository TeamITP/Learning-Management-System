/*Anuththara K.G.S.N*/
/*IT19142692*/

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
 * Servlet implementation class EmployeeDel
 */
@WebServlet("/EmployeeDel")
public class EmployeeDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeDel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Emp_ID = request.getParameter("Emp_ID");
		
		EmployeeServices employeeServices = new EmployeeServicesImpl();
		int status = employeeServices.removeEmployee(Emp_ID);
		
		if(status == 1) {
			request.setAttribute("message", "Employee Removed Successfully");
			request.setAttribute("link", "adminEmployee.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Employee Removing Failed");
			request.setAttribute("link", "adminEmployee.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
