package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import com.lms.util.ConnectDB;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */

public class UserServiceImple implements UserService {

	private static Connection connection;
	private static PreparedStatement preparedStatement;

	@Override
	public int validate(String userId, String password) {
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			ArrayList<String> sql = new ArrayList<String>();
			sql.add("SELECT password FROM Teacher WHERE Teacher_ID = ?");
			sql.add("SELECT password FROM Student WHERE Student_ID = ?");
			sql.add("SELECT Password FROM Employee WHERE Emp_ID = ?");
			sql.add("SELECT Password FROM Owner WHERE Admin_ID = ?");
			
			for(String query : sql) {
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, userId);
				ResultSet rs = preparedStatement.executeQuery();
				if(rs.next()) {
					if(password.equals(rs.getString(1))) {
						status = 1;
						break;
					}
				} 
			}
			
			
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
