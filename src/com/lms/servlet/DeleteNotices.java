package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.NoticeService;
import com.lms.service.NoticesServiceImple;

/**
 * Servlet implementation class DeleteNotices
 */
@WebServlet("/DeleteNotices")
public class DeleteNotices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNotices() {
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
String Notice_id = request.getParameter("Notice_id");
		
		NoticeService noticeservice = new NoticesServiceImple();
		
		int status = noticeservice.DeleteNotices(Notice_id);
		 if(status == 1)
		    {
		    	request.setAttribute("message", "delete Successful");
		    	RequestDispatcher dis = request.getRequestDispatcher("empNotices.jsp");
		    	dis.forward(request, response);    	
		    }
		    else if(status == 0)
		    {
		    	request.setAttribute("message", "deleteFailed");
		    }
	}
}
