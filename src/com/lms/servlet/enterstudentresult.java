package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Result;
import com.lms.service.ResultServices;
import com.lms.service.ResultServicesImple;

/**
 * Servlet implementation class enterstudentresult
 */
@WebServlet("/enterstudentresult")
public class enterstudentresult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		Result result = new Result() ;

		/*
		 * Initialize values for result object
		 * */

		result.setClassroom_id(request.getParameter("Classroom_id"));
		result.setType(request.getParameter("Type"));
		result.setDescription(request.getParameter("Description"));


		ResultServices resultServices = new ResultServicesImple();
		int status = resultServices.enterstudentresult(result);

		if(status == 1) {
			request.setAttribute("message", "Insert Succesful");
			request.setAttribute("link", "index.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);


			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			request.setAttribute("link", "login.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
			 
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			 
		}
	}
}
