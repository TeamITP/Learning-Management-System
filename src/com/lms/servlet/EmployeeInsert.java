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

import com.lms.model.Employee;
import com.lms.service.EmployeeServicesImpl;
import com.lms.service.EmployeeServices;

@WebServlet("/EmployeeInsert")
public class EmployeeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		
		Employee employee = new Employee();
		
		/*
		 * Initialize values for employee object
		 * */
		
		employee.setName(request.getParameter("fullname"));
		employee.setNIC(request.getParameter("nic"));
		employee.setPhone(request.getParameter("phone"));
		employee.setAddress(request.getParameter("address"));
		
		EmployeeServices employeeservices = new EmployeeServicesImpl();
		int status = employeeservices.insertEmployee(employee);
		
		if(status == 1) {
			request.setAttribute("message", "Employee insertion successful");
			request.setAttribute("link", "index.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Employee insertion failed");
			request.setAttribute("link", "index.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
