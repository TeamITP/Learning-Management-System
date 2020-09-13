package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Recorrect;
import com.lms.service.RecorrectionServices;
import com.lms.service.RecorrectionServicesImp;




/**
 * Servlet implementation class Recorrection
 */
@WebServlet("/Recorrection")
public class Recorrection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Recorrection() {
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
		
		
		String Description = request.getParameter("description");
		String result_id = request.getParameter("resultid");
		
		
		Recorrect recorrect = new Recorrect();
		
		recorrect.setDescription(Description);
		recorrect.setResultId(result_id);
		
  
		
  
		
		
		RecorrectionServices recorrectionservices = new RecorrectionServicesImp();
		int status = recorrectionservices.InsertRecorrection(recorrect);
		
		 if(status == 1)
		    {
		    	request.setAttribute("message", "Insert Successful");
		    	RequestDispatcher dis = request.getRequestDispatcher("ResultTeacherView.jsp");
		    	dis.forward(request, response);    	
		    }
		    else if(status == 0)
		    {
		    	request.setAttribute("message", "Insert Failed");
		    }
	} 

}
