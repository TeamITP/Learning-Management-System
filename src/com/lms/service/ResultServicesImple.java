package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;

import com.lms.model.Result;
import com.lms.util.ConnectDB;

/**
 * Imbulana Liyanage D.S.I.
 * IT19134772
 */

public class ResultServicesImple implements ResultServices{
	private static Connection connection;
	private static PreparedStatement preparedStatement;


	public int enterstudentresult(Result result) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO Result(Classroom_id, Type, Description) VALUES(?, ?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, result.getClassroom_id());
			preparedStatement.setString(2, result.getType());
			preparedStatement.setString(3, result.getDescription());


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
