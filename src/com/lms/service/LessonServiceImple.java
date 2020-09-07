package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import com.lms.model.Classroom;
import com.lms.model.Lesson;
import com.lms.util.ConnectDB;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */
public class LessonServiceImple implements LessonService {

	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	@Override
	public int createLesson(Lesson lesson) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Lesson> getListLessons(String classId) {
ArrayList<Lesson> arrayList = new ArrayList<Lesson>();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Lesson WHERE Classroom_id = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, classId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				Lesson lesson = new Lesson();
				lesson.setLessonId(resultSet.getString(2));
				lesson.setClassroomId(resultSet.getString(3));
				lesson.setName(resultSet.getString(4));
				lesson.setDescription(resultSet.getString(5));
				
				arrayList.add(lesson);
			}
		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				logger.log(Level.SEVERE, e.getMessage());
			}
		}
		return arrayList;
	}

	

}
