package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Classfees;
import com.lms.service.AssignmentServiceImpl;
import com.lms.service.AssignmentServices;
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
 * Servlet implementation class deleteClassfees
 */
@WebServlet("/deleteClassfees")
public class deleteClassfees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteClassfees() {
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
	
		
String Payment_ID = request.getParameter("Payment_ID");



ClassfeesServices classfeesservices = new ClassfeesServicesImpl();
		
		
		int status = classfeesservices.deleteClassfee(Payment_ID);
		 if(status == 1)
		    {
		    	request.setAttribute("message", "delete Successful");
		    	RequestDispatcher dis = request.getRequestDispatcher("ClassFee_pmt.jsp");
		    	dis.forward(request, response);    	
		    }
		    else if(status == 0)
		    {
		    	request.setAttribute("message", "deleteFailed");
		    }
	}

}