package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.model.CommonNotice;
import com.lms.service.NoticesServiceImple;

/**
 * Servlet implementation class Notice
 */
@WebServlet("/Notice")
public class Notice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonNotice commonNotice = new CommonNotice();
		
		commonNotice.setNotice_des(request.getParameter("description"));
		commonNotice.setTitle(request.getParameter("title"));
		commonNotice.setEmpId(request.getParameter("empId"));
		
		NoticesServiceImple noticesServiceImple = new NoticesServiceImple();
		int status = noticesServiceImple.insertNotice(commonNotice);
		
		if(status == 1) {
			request.setAttribute("message", "Notice Inserted Successfully");
			request.setAttribute("link", "empNotices.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			response.sendRedirect("empNotices.jsp");
		   // dis.forward(request, response);
		}
	}

}
