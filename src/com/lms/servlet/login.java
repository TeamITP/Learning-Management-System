package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.service.LessonService;
import com.lms.service.LessonServiceImple;
import com.lms.service.UserService;
import com.lms.service.UserServiceImple;


/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("uid");
	    String password = request.getParameter("pass");
	    String url;
	    
	    UserService userService = new UserServiceImple();
	    
	    int status = userService.validate(username, password);
	    
	    System.out.println(status);
	    
	    if(username.charAt(0) == 'A') {
	    	url = "ownerHome.jsp";
	    } else if (username.charAt(0) == 'S') {
	    	url = "classroomsStudent.jsp";
	    } else if (username.charAt(0) == 'E') {
	    	url = "EmpProfile.jsp";
	    } else {
	    	url = "classroomsTeacher.jsp";
	    }
	     
	    if(status == 1) {
	    	HttpSession httpSession = request.getSession();
	    	httpSession.setAttribute("userId", username);
	    	response.sendRedirect(url);
	    } else {
	    	request.setAttribute("message", "Credentials Mismatch");
	    	request.setAttribute("userId", username);
	    	RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
		    dis.forward(request, response);
	    }
	}

}
