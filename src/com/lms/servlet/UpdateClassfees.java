package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.model.Classfees;
import com.lms.model.Employee;
import com.lms.service.ClassfeesServices;
import com.lms.service.ClassfeesServicesImpl;
import com.lms.service.EmployeeServices;
import com.lms.service.EmployeeServicesImpl;

/**
 * Servlet implementation class UpdateClassfees
 */
@WebServlet("/UpdateClassfees")
public class UpdateClassfees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClassfees() {
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
    	Classfees classfees = new Classfees();
		
    	classfees.setDateAndTime(request.getParameter("DateAndTime"));
		classfees.setValue(request.getParameter("Value"));
		classfees.setAmount(request.getParameter("Amount"));
		classfees.setClassroom_id(request.getParameter("Classroom_id"));
		classfees.setStudent_ID(request.getParameter("Student_ID"));
		classfees.setPayment_ID(request.getParameter("Payment_ID"));
		
		ClassfeesServices classfeesServices = new ClassfeesServicesImpl();
		
		int status = classfeesServices.updateClassfees(classfees);
		
		
		if(status == 1) {
			request.setAttribute("message", "Update Succesful");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			//RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		    //dis.forward(request, response);
			request.setAttribute("status", "OK");
			response.sendRedirect("ClassFee_pmt.jsp");
		} else if (status == 0) {
			request.setAttribute("message", "Update Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("login.jsp");
		}
		
		
	/*	if(status == 1) {
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
		}*/
		
		

		
		
	}

}
