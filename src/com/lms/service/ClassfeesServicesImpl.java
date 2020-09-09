/* Implementation
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */

package com.lms.service;
import com.lms.model.Classfees;
import com.lms.util.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;


public class ClassfeesServicesImpl implements ClassfeesServices {
	
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;


	@Override
	public int insertClassfees(Classfees classfees) {
		// TODO Auto-generated method stub
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO ClassFee(DateAndTime, Value, Amount, Classroom_id, Student_ID ) VALUES(?, ?, ?, ?,?)";
		

			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, classfees.getDateAndTime());
			preparedStatement.setString(2, classfees.getValue());
			preparedStatement.setString(3, classfees.getAmount());
			preparedStatement.setString(4, classfees.getClassroom_id());
			preparedStatement.setString(5, classfees.getStudent_ID());
			
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

