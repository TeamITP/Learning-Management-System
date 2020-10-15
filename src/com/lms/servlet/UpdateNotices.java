package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.CommonNotice;
import com.lms.service.NoticeService;
import com.lms.service.NoticesServiceImple;

/**
 * Servlet implementation class UpdateNotices
 */
@WebServlet("/UpdateNotices")
public class UpdateNotices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNotices() {
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
		CommonNotice commonnotice = new CommonNotice();
		
		/*
		 * Initialize values for classroom object
		 * */
    
	    commonnotice.setTitle(request.getParameter("description"));
	    commonnotice.setNotice_des(request.getParameter("notice"));
	    commonnotice.setNotice_id(request.getParameter("id"));
		
		NoticeService assignmentServices = new NoticesServiceImple();
		int status = assignmentServices.updateNotice(commonnotice);
		
		if(status == 1) {
			request.setAttribute("message", "Update Notice Successfully");
			request.setAttribute("link", "empNotices.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
			
			//RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		    //dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		    dis.forward(request, response);
		}
	}

}
