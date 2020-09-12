package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import com.lms.model.Assignment;
import com.lms.model.Classroom;
import com.lms.util.ConnectDB;

public class AssignmentServiceImpl implements AssignmentServices {
	
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	
	@Override
	public int createAssignment(Assignment assignment) {
		// TODO Auto-generated method stub
		
	int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO Assignment( Date, Class_ID, Question) VALUES( ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, assignment.getDate());
			preparedStatement.setString(2, assignment.getClass_ID());
			preparedStatement.setString(3, assignment.getQuestion());
			
			
			status = preparedStatement.executeUpdate();
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				System.out.println(e.getMessage());
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return status;
	}

	@Override
	public ArrayList<Assignment> getAssignmentList(String Class_ID) {
		// TODO Auto-generated method stub
ArrayList<Assignment> arrayList = new ArrayList<Assignment>();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Assignment WHERE Class_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, Class_ID);			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				Assignment assignment = new Assignment();
				assignment.setA_ID(resultSet.getString(2));
				assignment.setDate(resultSet.getString(3));
				assignment.setClass_ID(resultSet.getString(4));
				assignment.setQuestion(resultSet.getString(5));
				
				arrayList.add(assignment);
			}
			System.out.println(arrayList.size());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
				System.out.println(e.getMessage());
			}
		}
		return arrayList;
	}
	@Override
	public Assignment getAssignment(String A_ID) {
		Assignment assignment = new Assignment();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Assginment WHERE A_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, A_ID);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				assignment.setA_ID(resultSet.getString(2));
				assignment.setDate(resultSet.getString(3));
				assignment.setClass_ID(resultSet.getString(4));
				assignment.setQuestion(resultSet.getString(5));
			}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
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
			System.out.println(e.getMessage());
		}
	}
		return assignment;
	}
	
	
	public int UpdateAssignment(Assignment assignment) {
	int status = 0;

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "UPDATE Assignment SET Date = ?, Question = ? WHERE A_ID = ?";
		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, assignment.getDate());
		preparedStatement.setString(2, assignment.getQuestion());
		preparedStatement.setString(3, assignment.getA_ID());
		

		System.out.println(preparedStatement);
		status = preparedStatement.executeUpdate();

		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (java.sql.SQLException e) {
			System.out.println(e.getMessage());
		}

	} catch (SQLException e) {
//		logger.log(Level.SEVERE, e.getMessage());
		System.out.println(e.getMessage());
	}

	return status;
}
	
	
	public int DeleteAssignment(String A_ID)
	{
		int status = 0;
		
		try{
			connection = ConnectDB.getDBConnection();
		
	    String sql = "delete from Assignment where A_ID = '"+A_ID+"'";
	    
	    preparedStatement = connection.prepareStatement(sql);
	    status =  preparedStatement.executeUpdate();
	    
		}catch (SQLException e) {
			System.out.println(e.getMessage());
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
				System.out.println(e.getMessage());
			}
		}
				
				
		return status;	
	}
	
	
}
