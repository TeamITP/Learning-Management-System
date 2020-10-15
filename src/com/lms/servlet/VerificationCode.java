package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.service.UserService;
import com.lms.service.UserServiceImple;

/**
 * Servlet implementation class VerificationCode
 */
@WebServlet("/VerificationCode")
public class VerificationCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerificationCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("uid");
		String vCode = request.getParameter("code");
		UserService userService = new UserServiceImple();
		
		int status = userService.verificationCode(vCode, userId);
				
		if(status == 1) {
			request.setAttribute("user", userId);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/passwordReset.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Verification Code Incorrect");
			request.setAttribute("user", userId);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/codeVerify.jsp");
			dispatcher.forward(request, response);
		}
	}

}
