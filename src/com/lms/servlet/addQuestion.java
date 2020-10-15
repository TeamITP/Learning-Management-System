package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.QnA;
import com.lms.service.QnA_Service;
import com.lms.service.QnA_ServiceImple;

/**
 * Servlet implementation class addQuestion
 */
@WebServlet("/addQuestion")
public class addQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int status = 0;
		
		String stuId = request.getParameter("stuId");
		String question = request.getParameter("question");
		String clzId = request.getParameter("cld");
		
		QnA qnA = new QnA();
		qnA.setStuId(stuId);
		qnA.setQuestion(question);
		qnA.setClzId(clzId);
		
		System.out.println("clzId  : " + clzId);
		
		QnA_Service qnA_Service = new QnA_ServiceImple();
		
		status = qnA_Service.addQuestion(qnA);
		
		if(status == 1) {
			request.setAttribute("message", "Question Added Successfully");
			request.setAttribute("link", "QnA_Student.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Question Adding Failed");
			request.setAttribute("link", "QnA_Student.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
