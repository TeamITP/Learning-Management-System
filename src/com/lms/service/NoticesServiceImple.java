package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import com.lms.model.CommonNotice;
import com.lms.util.ConnectDB;

public class NoticesServiceImple implements NoticeService {
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	@Override
	public int insertNotice(CommonNotice commonNotice) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO CommonNotice(type, notice_des, EmpId) VALUES(?, ?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, commonNotice.getTitle());
			preparedStatement.setString(2, commonNotice.getNotice_des());
			preparedStatement.setString(3, commonNotice.getEmpId());

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
	
	
	public ArrayList<CommonNotice> getNotice(String empid) {
		ArrayList<CommonNotice> arrayList = new ArrayList<CommonNotice>();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * From CommonNotice WHERE  EmpId = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, empid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				CommonNotice commonnotice = new CommonNotice();
				
				commonnotice.setNotice_des(resultSet.getString(5));
				commonnotice.setTitle(resultSet.getString(3));
				
				
				
				arrayList.add( commonnotice);
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
		return arrayList;
	}

}
