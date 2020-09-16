package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.lms.model.Lesson;
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

	@Override
	public int accountVerification(String userId) {
int status = 0;
String email = null;
String fName = null;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT address,fristName FROM Student WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, userId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				email = resultSet.getString(1);
				fName = resultSet.getString(2);
			}
			
			if(email == null) {
				return 0;
			}
			
			Random rnd = new Random();
			int n = 100000 + rnd.nextInt(900000);
			
			sql = "UPDATE Student SET vCode = ? WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, String.valueOf(n));
			preparedStatement.setString(2, userId);
			
			preparedStatement.executeUpdate();
			
			//Creating a result for getting status that messsage is delivered or not!
	        String result;
	        // Get recipient's email-ID, message & subject-line from index.html page
	        final String to = email;
	        final String subject = "Account Verification";
	        final String messg = "<h1 style=\"font-size: 17px; font-family: Arial, Helvetica, sans-serif;\">Hello " + fName+",</h1>\r\n" + 
	        		"<p style=\"font-size: 15px; font-family: Arial, Helvetica, sans-serif;\">You have requested to reset your account password. So, the below verification code can be used.</p>\r\n" + 
	        		"\r\n" + 
	        		"<h2 style=\"color:#0066ff;font-size: 20px; font-family: Arial, Helvetica, sans-serif;\"><b>" + String.valueOf(n)+ "</b></h2>\r\n" + 
	        		"\r\n" + 
	        		"<p style=\"font-size: 15px; font-family: Arial, Helvetica, sans-serif;\">Thank You <br> New Montana Accounts Team</p>";
	     
	        // Sender's email ID and password needs to be mentioned
	        final String from = "codewithwings@gmail.com";
	        final String pass = "learnwithwings@2020";
	     
	     
	        // Defining the gmail host
	        String host = "smtp.gmail.com";
	     
	        // Creating Properties object
	        Properties props = new Properties();
	     
	        // Defining properties
	        props.put("mail.smtp.host", host);
	        props.put("mail.transport.protocol", "smtp");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.user", from);
	        props.put("mail.password", pass);
	        props.put("mail.port", "465");
	     
	     // Authorized the Session object.
	        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(from, pass);
	            }
	        });
	        try {
	            // Create a default MimeMessage object.
	            MimeMessage message = new MimeMessage(mailSession);
	            // Set From: header field of the header.
	            message.setFrom(new InternetAddress(from));
	            // Set To: header field of the header.
	            message.addRecipient(Message.RecipientType.TO,
	                    new InternetAddress(to));
	            // Set Subject: header field
	            message.setSubject(subject);
	            // Now set the actual message
	            message.setContent(messg,  "text/html");
	            // Send message
	            Transport.send(message);
	            status = 1;
	            result = "mail sent successfully from W3Adda.com....";
	        } catch (MessagingException mex) {
	            mex.printStackTrace();
	            result = "Error: unable to send mail....";
	        }
	        System.out.print(result);
			
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
	public int verificationCode(String code, String userId) {
		int status = 0;
		String vCode = "";
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT vCode FROM Student WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			System.out.print(userId);
			preparedStatement.setString(1, userId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				vCode = resultSet.getString(1);
			}
			
			if(vCode.length() != 6) {
				return 0;
			}
			
			if(vCode.equals(code)) {
				sql = "UPDATE Student SET vCode = 'NULL' WHERE Student_ID = ?";

				preparedStatement = connection.prepareStatement(sql);

				preparedStatement.setString(1, userId);
				
				preparedStatement.executeUpdate();
				
				status = 1;
			} else {
				status = 0;
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

	@Override
	public int updatePassword(String userId, String pw) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE Student SET password = ? WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, pw);
			preparedStatement.setString(2, userId);

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
