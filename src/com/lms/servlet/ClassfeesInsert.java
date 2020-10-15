package com.lms.servlet;
/* 
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lms.model.Classfees;
import com.lms.service.ClassfeesServices;
import com.lms.service.ClassfeesServicesImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClassfeesInsert
 */
@WebServlet("/ClassfeesInsert")
public class ClassfeesInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
				
				Classfees classfees = new Classfees();
				
				/*
				 * Initialize values for classfee object
				 * */
				
				classfees.setDateAndTime(request.getParameter("DateAndTime"));
				classfees.setValue(request.getParameter("Value"));
				classfees.setAmount(request.getParameter("Amount"));
				classfees.setClassroom_id(request.getParameter("Classroom_id"));
				classfees.setStudent_ID(request.getParameter("Student_ID"));
				
				ClassfeesServices classfeesServices = new ClassfeesServicesImpl();
				int status = classfeesServices.insertClassfees(classfees);
				
				//emp
				/*if(status == 1) {
					request.setAttribute("message", "Employee insertion successful");
					request.setAttribute("link", "ClassfeesView.jsp");
					request.setAttribute("status", "OK");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
					dispatcher.forward(request, response);
				} else if (status == 0) {
					request.setAttribute("message", "Employee insertion failed");
					request.setAttribute("link", "login.jsp");
					request.setAttribute("status", "FAIL");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
					dispatcher.forward(request, response);
				}
				*/
				
				
				
				
				
				
				
				
				
	
				//my
				/*if(status == 1) {
					request.setAttribute("message", "Insert Successful");
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
					//dispatcher.forward(request, response);
					RequestDispatcher dis = request.getRequestDispatcher("ClassfeesView.jsp");
				    dis.forward(request, response);
				} else if (status == 0) {
					request.setAttribute("message", "Insert Failed");
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
					//dispatcher.forward(request, response);
					RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
				    dis.forward(request, response);
				}*/
				
				
				
				//read
				
				
				if(status == 1) {
					request.setAttribute("message", "Insert Succesful");
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
					//dispatcher.forward(request, response);
					//RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
				    //dis.forward(request, response);
					request.setAttribute("status", "OK");
					response.sendRedirect("ClassFee_pmt.jsp");
				} else if (status == 0) {
					request.setAttribute("message", "Insert Failed");
					//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
					//dispatcher.forward(request, response);
					response.sendRedirect("login.jsp");
				}
				
				
			}

		}

