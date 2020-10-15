package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;

import com.lms.model.Classroom;
import com.lms.model.QnA;
import com.lms.util.ConnectDB;

public class QnA_ServiceImple implements QnA_Service  {
	
	private static Connection connection;
	private static PreparedStatement preparedStatement;

	@Override
	public int addQuestion(QnA qnA) {
		int status = 0;
		SimpleDateFormat dateTimeFormatter = new SimpleDateFormat("yyyy/MM/dd");
		Date date = Calendar.getInstance().getTime();
		String strDate = dateTimeFormatter.format(date);

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO QnA(Question, Classroom_id, Student_id, Date) VALUES(?, ?, ?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, qnA.getQuestion());
			preparedStatement.setString(2, qnA.getClzId());
			preparedStatement.setString(3, qnA.getStuId());
			preparedStatement.setString(4, strDate);

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
	public int updateQuestion(QnA qnA) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE QnA SET Question = ? WHERE Q_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, qnA.getQuestion());
			preparedStatement.setString(2, qnA.getId());

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
	public int deleteQuestion(String id) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM QnA WHERE Q_id = ?";
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, id);

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
	public int addReply(QnA qnA) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE QnA SET Answer = ?, status = 1 WHERE Q_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, qnA.getAnswer());
			preparedStatement.setString(2, qnA.getId());

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
	public int updateReply(QnA qnA) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE QnA SET Answer = ? WHERE Q_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, qnA.getAnswer());
			preparedStatement.setString(2, qnA.getId());

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
	public int deleteReply(String id) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE QnA SET status = 0, Answer = '' WHERE Q_id = ? ORDER BY id DESC";
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, id);

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
	public ArrayList<QnA> getReliedQuestions(String clzId) {
		ArrayList<QnA> arrayList = new ArrayList<QnA>();

		try {
			connection = ConnectDB.getDBConnection();


			String sqlQ = "SELECT * FROM QnA WHERE Classroom_id = ? AND status = 1 ORDER BY id DESC";
			preparedStatement = connection.prepareStatement(sqlQ);
			preparedStatement.setString(1, clzId);

			ResultSet resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					QnA qnA = new QnA();
					
					qnA.setId(resultSet.getString(2));
					qnA.setQuestion(resultSet.getString(3));
					qnA.setAnswer(resultSet.getString(4));
					qnA.setClzId(resultSet.getString(5));
					qnA.setStuId(resultSet.getString(6));
					qnA.setDate(resultSet.getString(8));
					
					arrayList.add(qnA);
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
	public ArrayList<QnA> getUnRepliedQuestions(String clzId) {
		ArrayList<QnA> arrayList = new ArrayList<QnA>();

		try {
			connection = ConnectDB.getDBConnection();


			String sqlQ = "SELECT * FROM QnA WHERE Classroom_id = ? AND status = 0 ORDER BY id DESC";
			preparedStatement = connection.prepareStatement(sqlQ);
			preparedStatement.setString(1, clzId);

			ResultSet resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					QnA qnA = new QnA();
					
					qnA.setId(resultSet.getString(2));
					qnA.setQuestion(resultSet.getString(3));
					qnA.setAnswer(resultSet.getString(4));
					qnA.setClzId(resultSet.getString(5));
					qnA.setStuId(resultSet.getString(6));
					qnA.setDate(resultSet.getString(8));
					
					arrayList.add(qnA);
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
	public ArrayList<QnA> getStudentQuestionAnswered(String clzId, String stuId) {
		ArrayList<QnA> arrayList = new ArrayList<QnA>();

		try {
			connection = ConnectDB.getDBConnection();


			String sqlQ = "SELECT * FROM QnA WHERE Classroom_id = ? AND Student_id = ? AND status = 1 ORDER BY id DESC";
			preparedStatement = connection.prepareStatement(sqlQ);
			preparedStatement.setString(1, clzId);
			preparedStatement.setString(2, stuId);

			ResultSet resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					QnA qnA = new QnA();
					
					qnA.setId(resultSet.getString(2));
					qnA.setQuestion(resultSet.getString(3));
					qnA.setAnswer(resultSet.getString(4));
					qnA.setClzId(resultSet.getString(5));
					qnA.setStuId(resultSet.getString(6));
					qnA.setDate(resultSet.getString(8));
					
					arrayList.add(qnA);
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
	public ArrayList<QnA> getStudentQuestionNotAnswered(String clzId, String stuId) {
		ArrayList<QnA> arrayList = new ArrayList<QnA>();

		try {
			connection = ConnectDB.getDBConnection();


			String sqlQ = "SELECT * FROM QnA WHERE Classroom_id = ? AND Student_id = ? AND status = 0 ORDER BY id DESC";
			preparedStatement = connection.prepareStatement(sqlQ);
			preparedStatement.setString(1, clzId);
			preparedStatement.setString(2, stuId);

			ResultSet resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					QnA qnA = new QnA();
					
					qnA.setId(resultSet.getString(2));
					qnA.setQuestion(resultSet.getString(3));
					qnA.setAnswer(resultSet.getString(4));
					qnA.setClzId(resultSet.getString(5));
					qnA.setStuId(resultSet.getString(6));
					qnA.setDate(resultSet.getString(8));
					
					arrayList.add(qnA);
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
