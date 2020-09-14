package com.lms.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.model.VideoMaterial;
import com.lms.service.LessonMaterialServImple;
import com.lms.service.LessonMaterialsService;

/**
 * Servlet implementation class VideoUpload
 */
@WebServlet("/VideoUpload")
public class VideoUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LessonMaterialsService lessonMaterialsService = new LessonMaterialServImple();
		VideoMaterial videoMaterial = new VideoMaterial();
		
		HttpSession session = request.getSession();
		videoMaterial.setClassroomId((String) session.getAttribute("classroomId"));
		videoMaterial.setLessonId((String) session.getAttribute("lessonId"));
		videoMaterial.setName(request.getParameter("videoName"));
		videoMaterial.setDescription(request.getParameter("description"));
		videoMaterial.setUrl(request.getParameter("url"));
		
		int status = lessonMaterialsService.insertVideo(videoMaterial);
		
		
		if(status == 1) {
			request.setAttribute("message", "Video Material Inserted Successfully");
			request.setAttribute("link", "teacherLesson.jsp");
			request.setAttribute("status", "OK");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		} else if (status == 0) {
			request.setAttribute("message", "Video Material Inserting Failed");
			request.setAttribute("link", "teacherLesson.jsp");
			request.setAttribute("status", "FAIL");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/databaseMessage.jsp");
			dispatcher.forward(request, response);
		}
	}

}
