package com.lms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lms.model.Classfees;
import com.lms.model.Esalary;
import com.lms.model.Tsalary;
import com.lms.service.ClassfeesServices;
import com.lms.service.ClassfeesServicesImpl;
import com.lms.service.EsalaryServices;
import com.lms.service.EsalaryServicesImpl;
import com.lms.service.TsalaryServices;
import com.lms.service.TsalaryServicesImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class EsalaryInsert
 */
@WebServlet(name = "EsalaryInsert2", urlPatterns = { "/EsalaryInsert2" })
public class EsalaryInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
				
				Esalary esalary = new Esalary();
				
				/*
				 * Initialize values for classfee object
				 * */
				
				esalary.setEmp_ID(request.getParameter("Emp_ID"));
				esalary.setContract(request.getParameter("Contract"));
				
				
			
			
				EsalaryServices esalaryServices = new EsalaryServicesImpl();
				int status = esalaryServices.insertEsalary(esalary);
				
	
				
				if(status == 1) {
					request.setAttribute("message", "Insert Succesful");
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
					//dispatcher.forward(request, response);
					//RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
				    //dis.forward(request, response);
					request.setAttribute("status", "OK");
					response.sendRedirect("emsalary.jsp");
				} else if (status == 0) {
					request.setAttribute("message", "Insert Failed");
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
					//dispatcher.forward(request, response);
					response.sendRedirect("login.jsp");
				}
				
				
			}

		}


