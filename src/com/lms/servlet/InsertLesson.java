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
 * Servlet implementation class InsertLesson
 */
@WebServlet("/InsertLesson")
public class InsertLesson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLesson() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
Lesson lesson = new Lesson();
		
		lesson.setName(request.getParameter("lessonName"));
		lesson.setDescription(request.getParameter("description"));
		lesson.setClassroomId(request.getParameter("classroomId"));
		
		LessonService lessonService = new LessonServiceImple();
		
		int status = lessonService.insertLesson(lesson);
		
		if(status == 1) {
			request.setAttribute("message", "Lesson Inserted Successfully");
			request.setAttribute("link", "teacherClassroom.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Lesson Inserting Failed");
			request.setAttribute("link", "teacherClassroom.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
