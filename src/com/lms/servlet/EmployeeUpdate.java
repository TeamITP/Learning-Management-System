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
import javax.servlet.http.HttpSession;

import com.lms.model.Employee;
import com.lms.service.EmployeeServices;
import com.lms.service.EmployeeServicesImpl;
/**
 * Servlet implementation class EmployeeUpdate
 */
@WebServlet("/EmployeeUpdate")
public class EmployeeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employee employee = new Employee();
		
		employee.setEmp_ID(request.getParameter("empId"));
		employee.setName(request.getParameter("fullname"));
		employee.setAddress(request.getParameter("address"));
		employee.setPhone(request.getParameter("phone"));
		employee.setNIC(request.getParameter("nic"));
		employee.setPassword(request.getParameter("password"));
		
		EmployeeServices employeeservices = new EmployeeServicesImpl();
		
		int status = employeeservices.updateEmployee(employee);
		
		if(status == 1) {
			request.setAttribute("message", "Update profile Successful");
			request.setAttribute("Emp_ID", employee.getEmp_ID());
			request.setAttribute("link", "EmpProfile.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Update profile Failed");
			request.setAttribute("Emp_ID", employee.getEmp_ID());
			request.setAttribute("link", "EmpProfile.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
