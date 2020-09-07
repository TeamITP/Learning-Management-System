package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;

import com.lms.model.Teacher;
import com.lms.util.ConnectDB;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public  class Teacher_Managment_ServicesImple implements Teacher_Managment_Services {
	
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	private static Connection con1 = null;
	private static Statement stmt1 = null;
	//private static ResultSet rs1= null;
	
	
	public int registerTeacher(Teacher teacher) {
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO Teacher(Name,title, Subject,Contact, Birthday) VALUES(?,  ?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, teacher.getName());
			//preparedStatement.setString(1, teacher.getEmail());
			preparedStatement.setString(2, teacher.getTitle());
			preparedStatement.setString(3, teacher.getSubject());
			preparedStatement.setString(4,teacher.getContact());
			preparedStatement.setString(5, teacher.getBirthdate());
			
			
			
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

public static boolean insertContact(String name,String contact,String birthdate,String title,String subject) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		con1 = ConnectDB.getDBConnection();
			stmt1 = con1.createStatement();
    	    String sql = "insert into contact values (0,'"+0+"','"+name+"','"+contact+"','"+birthdate+"','"+title+"','"+subject+"')";
    		int rs = stmt1.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }

public Teacher getTeacher(String teacherId) {
	Teacher teacher = new Teacher();
	try {
		connection = ConnectDB.getDBConnection();
		
		String sql = "SELECT * FROM Teacher WHERE Teacher_ID = ?";
		
		preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setString(1, teacherId);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		while (resultSet.next()) {
			teacher.setName(resultSet.getString(3));
			teacher.setTitle(resultSet.getString(4));
			teacher.setSubject(resultSet.getString(5));
			teacher.setContact(resultSet.getString(6));
			teacher.setBirthdate(resultSet.getString(7));
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
	return teacher;
}

}
