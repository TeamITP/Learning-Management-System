package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import com.lms.model.Classroom;
import com.lms.util.ConnectDB;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */
public class ClassroomServicesImpl implements ClassroomServices {

	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;

	@Override
	public int createClass(Classroom classroom) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO Classroom(Grade, Subject, Description, ClassTime, Teacher_Id) VALUES(?, ?, ?, ?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setInt(1, classroom.getGrade());
			preparedStatement.setString(2, classroom.getSubject());
			preparedStatement.setString(3, classroom.getDescription());
			preparedStatement.setString(4, classroom.getClassTime());
			preparedStatement.setString(5, classroom.getTeacherId());

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
	public ArrayList<Classroom> getClassroomList(String teacherId) {
		ArrayList<Classroom> arrayList = new ArrayList<Classroom>();

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Classroom WHERE Teacher_Id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, teacherId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Classroom classroom = new Classroom();
				classroom.setClassrooId(resultSet.getString(2));
				classroom.setGrade(resultSet.getInt(3));
				classroom.setSubject(resultSet.getString(4));
				classroom.setDescription(resultSet.getString(5));
				classroom.setClassTime(resultSet.getString(6));

				arrayList.add(classroom);
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

	@Override
	public Classroom getClassroom(String classroomId) {
		Classroom classroom = new Classroom();
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Classroom WHERE Classroom_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, classroomId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				classroom.setClassrooId(resultSet.getString(2));
				classroom.setGrade(resultSet.getInt(3));
				classroom.setSubject(resultSet.getString(4));
				classroom.setDescription(resultSet.getString(5));
				classroom.setClassTime(resultSet.getString(6));
			}
		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close statement and database connectivity at the end of the transaction
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
		return classroom;
	}

	@Override
	public int updateClassroom(Classroom classroom) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE Classroom SET Grade = ?, Subject = ?, Description = ?, ClassTime = ? WHERE Classroom_id = ?";
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setInt(1, classroom.getGrade());
			preparedStatement.setString(2, classroom.getSubject());
			preparedStatement.setString(3, classroom.getDescription());
			preparedStatement.setString(4, classroom.getClassTime());
			preparedStatement.setString(5, classroom.getClassrooId());

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
				logger.log(Level.SEVERE, e.getMessage());
			}

		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
			System.out.println(e.getMessage());
		}

		return status;
	}

	@Override
	public ArrayList<Classroom> getClassroomListStudent(String studentId) {
		ArrayList<Classroom> arrayList = new ArrayList<Classroom>();

		try {
			connection = ConnectDB.getDBConnection();
			
			ArrayList<String> clzId = new ArrayList<String>();
 			
			String sqlQ = "SELECT * FROM ClassroomStudent WHERE Student_id = ?";
			preparedStatement = connection.prepareStatement(sqlQ);
			preparedStatement.setString(1, studentId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				clzId.add(resultSet.getString(1));
			}
			
			for(String clz : clzId) {

			String sql = "SELECT * FROM Classroom WHERE Classroom_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, clz);

			ResultSet resultSet1 = preparedStatement.executeQuery();

			while (resultSet1.next()) {
				Classroom classroom = new Classroom();
				classroom.setClassrooId(resultSet1.getString(2));
				classroom.setGrade(resultSet1.getInt(3));
				classroom.setSubject(resultSet1.getString(4));
				classroom.setDescription(resultSet1.getString(5));
				classroom.setClassTime(resultSet1.getString(6));

				arrayList.add(classroom);
			}
			System.out.println(arrayList.toString());
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
