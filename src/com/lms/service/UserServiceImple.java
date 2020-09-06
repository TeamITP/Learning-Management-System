package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
			
			String sql = "SELECT password FROM Teacher WHERE Teacher_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, userId);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			if(rs.next()) {
				if(password.equals(rs.getString(1))) {
					status = 1;
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
