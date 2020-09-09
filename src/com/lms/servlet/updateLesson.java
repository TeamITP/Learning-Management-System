package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.model.Lesson;
import com.lms.service.LessonService;
import com.lms.service.LessonServiceImple;

/**
 * Servlet implementation class updateLesson
 */
@WebServlet("/updateLesson")
public class updateLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateLesson() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Lesson lesson = new Lesson();
		
		lesson.setName(request.getParameter("lessonName"));
		lesson.setDescription(request.getParameter("description"));
		lesson.setLessonId(request.getParameter("lessonId"));
		
		LessonService lessonService = new LessonServiceImple();
		
		int status = lessonService.updateLesson(lesson);
		
		if(status == 1) {
			request.setAttribute("message", "Insert Succesful");
			request.setAttribute("lessonId", lesson.getLessonId());
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("teacherLesson.jsp");
		    dis.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Insert Failed");
			request.setAttribute("lessonId", lesson.getLessonId());
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/databaseMessage.jsp");
			//dispatcher.forward(request, response);
			RequestDispatcher dis = request.getRequestDispatcher("teacherLesson.jsp");
		    dis.forward(request, response);
		}
	}

}
