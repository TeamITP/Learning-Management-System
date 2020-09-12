package com.lms.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import com.lms.model.Classroom;
import com.lms.model.Lesson;
import com.lms.model.Student;
import com.lms.util.ConnectDB;

/**	/**
 * Imbulana Liyanage D.S.I.	 * Imbulana Liyanage D.S.I.
 * IT19134772	 * IT19134772
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
	
	@Override
	public Student getStudent(String Student_ID) {
		Student student = new Student();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Student WHERE Student_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, Student_ID);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				student.setStudent_ID(resultSet.getString(2));
				student.setFristName(resultSet.getString(3));
				student.setLastName(resultSet.getString(4));
				student.setAddress(resultSet.getString(5));
				student.setPhone(resultSet.getString(6));
				student.setGuardian(resultSet.getString(7));
				student.setPassword(resultSet.getString(8));
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
		return student;
	}
	
	@Override
	public int deleteStudent(String Student_ID) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM Student WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, Student_ID);

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
	public ArrayList<Student> getListStudent(String Student_ID) {
		ArrayList<Student> arrayList = new ArrayList<Student>();

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Student WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, Student_ID);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Student student = new Student();
				student.setStudent_ID(resultSet.getString(2));
				student.setFristName(resultSet.getString(3));
				student.setLastName(resultSet.getString(4));
				student.setAddress(resultSet.getString(5));
				student.setPhone(resultSet.getString(6));
				student.setGuardian(resultSet.getString(7));
				student.setPassword(resultSet.getString(8));

				arrayList.add(student);
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
	public int updateStudent(Student student) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE Student SET firstName = ?, lastName = ?, address = ?, phone = ?, Guardian = ?, password = ? WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, student.getFristName());
			preparedStatement.setString(2, student.getLastName());
			preparedStatement.setString(3, student.getAddress());
			preparedStatement.setString(3, student.getPhone());
			preparedStatement.setString(3, student.getGuardian());
			preparedStatement.setString(3, student.getPassword());

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
	public ArrayList<String> getStudentArrayList(String classroomId) {
		ArrayList<String> arrayList = new ArrayList<String>();

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM ClassroomStudent WHERE  Classroom_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, classroomId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				arrayList.add(resultSet.getString(2));
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
	public Student getStudentById(String studentId) {
		Student student = new Student();
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Student WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, studentId);

			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				student.setStudent_ID(resultSet.getString(2));
				student.setFristName(resultSet.getString(3));
				student.setLastName(resultSet.getString(4));
				student.setAddress(resultSet.getString(5));
				student.setPhone(resultSet.getString(6));
				student.setGuardian(resultSet.getString(7));
				student.setPassword(resultSet.getString(8));
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
		
		return student;
	}

	@Override
	public int removeStudentClassroom(String studentId, String classroomId) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM ClassroomStudent WHERE Student_id = ? AND Classroom_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, studentId);
			preparedStatement.setString(2, classroomId);

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
	public int addStudentClassroom(String studentId, String classroomId) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO ClassroomStudent VALUES(?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(2, studentId);
			preparedStatement.setString(1, classroomId);

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
