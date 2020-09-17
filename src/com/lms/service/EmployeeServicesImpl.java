package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import com.lms.util.ConnectDB;
import com.lms.model.*;

/* 
 * @author Anuththara K.G.S.N.
 * IT19142692
 * 
 * */
public class EmployeeServicesImpl implements EmployeeServices {

	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	@Override
	public int insertEmployee(Employee employee) {
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO Employee(Name, NIC, Phone, Address) VALUES(?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, employee.getName());
			preparedStatement.setString(2, employee.getNIC());
			preparedStatement.setString(3, employee.getPhone());
			preparedStatement.setString(4, employee.getAddress());
			
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

	@Override
	public Employee getEmployee(String empid) {
		Employee employee = new Employee();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Employee WHERE Emp_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, empid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				employee.setEmp_ID(resultSet.getString(2));
				employee.setName(resultSet.getString(3));
				employee.setAddress(resultSet.getString(4));
				employee.setPhone(resultSet.getString(5));
				employee.setNIC(resultSet.getString(6));
				employee.setPassword(resultSet.getString(7));
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
		return employee;
	}

	@Override
	public int deleteEmployee(String empId) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM Employee WHERE Emp_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, empId);

			status= preparedStatement.executeUpdate();

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
		
		return status;
	}

	@Override
	public int updateEmployee(Employee employee) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE Employee SET Name = ?, Address = ?, Phone = ?, NIC = ?, Password = ? WHERE Emp_ID = ?";

			preparedStatement = connection.prepareStatement(sql);
			System.out.println(employee.getPassword());

			preparedStatement.setString(1, employee.getName());
			preparedStatement.setString(2, employee.getAddress());
			preparedStatement.setString(3, employee.getPhone());
			preparedStatement.setString(4, employee.getNIC());
			preparedStatement.setString(5, employee.getPassword());
			preparedStatement.setString(6, employee.getEmp_ID());
				
			status= preparedStatement.executeUpdate();

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
		
		return status;
	}
	
}
