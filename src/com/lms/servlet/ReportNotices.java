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
 * Servlet implementation class ReportNotices
 */
@WebServlet("/ReportNotices")
public class ReportNotices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportNotices() {
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
		 String userId = request.getParameter("userId");
	       
			
			NoticeService noticeService = new NoticesServiceImple();
			String path = noticeService.generateReport(userId,getServletContext().getRealPath("/UploadedFiles/PDF"));
			
			if (path != null) {
				response.sendRedirect(path);
			} else {
				request.setAttribute("message", "Error in Generating Report");
				request.setAttribute("link", "UpdateNotices.jsp");
				request.setAttribute("status", "FAIL");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
				dispatcher.forward(request, response);
			
			}
		}
}
