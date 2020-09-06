package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

 
import com.lms.model.Student;
import com.lms.util.ConnectDB;

/**
 * Imbulana Liyanage D.S.I.
 * IT19134772
 */

public class StudentServicesImple implements StudentServices{
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	
	public int StudentRegistration(Student student) {
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO Student(fristName, lastName, address, phone, Guardian) VALUES(?, ?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, student.getFristName());
			preparedStatement.setString(2, student.getLastName());
			preparedStatement.setString(3, student.getAddress());
			preparedStatement.setString(4, student.getPhone());
			preparedStatement.setString(5, student.getGuardian());
			
			status = preparedStatement.executeUpdate();
			
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

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}
		
		return status;
	}
}
