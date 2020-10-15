package com.lms.service;

/* @author Pussadeniya PMSSB
* IT19218618
* 
* */
import java.util.logging.Logger;

import com.lms.model.Assignment;
import com.lms.model.Classfees;
import com.lms.model.Classroom;
import com.lms.model.Employee;
import com.lms.model.Tsalary;
import com.lms.util.ConnectDB;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;

import java.awt.Color;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;


public class TsalaryServicesImpl  implements TsalaryServices {

	
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;

	
	
	
	@Override
	public int insertTsalary(Tsalary tsalary) {
		// TODO Auto-generated method stub
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO TeacherSalary(Teacher_ID, Rate, Value) VALUES(?, ?, ?)";
		

			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, tsalary.getTeacher_ID());
			preparedStatement.setString(2, tsalary.getRate());
			preparedStatement.setString(3, tsalary.getValue());
			
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
	
	
	///////ArrayList
	//ArrayList	
		
	
	@Override
		public ArrayList<Tsalary> getTsalaryList() {
			ArrayList<Tsalary> arrayList = new ArrayList<Tsalary>();
		{
			
			
				try {
					connection = ConnectDB.getDBConnection();
					
					String sql = "SELECT * FROM TeacherSalary ";
					
					preparedStatement = connection.prepareStatement(sql);
					
					ResultSet resultSet = preparedStatement.executeQuery();
					
					while (resultSet.next()) {
						Tsalary tsalary = new Tsalary();
						tsalary.setPayment_ID(resultSet.getString(2));
						tsalary.setTeacher_ID(resultSet.getString(3));
						tsalary.setRate(resultSet.getString(4));
						tsalary.setValue(resultSet.getString(5));
						arrayList.add(tsalary);
						
						
						
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
		
	
	
	//////////////////////////////////////
	
	
	@Override
	public Tsalary  getTsalary(String Payment_ID) {
		         Tsalary tsalary = new Tsalary();

		
				try {
					connection = ConnectDB.getDBConnection();
					
					String sql = "SELECT * FROM TeacherSalary WHERE Payment_ID = ?";
					preparedStatement = connection.prepareStatement(sql);
				    preparedStatement.setString(1, Payment_ID);
					ResultSet resultSet = preparedStatement.executeQuery();
					
					while (resultSet.next()) {
						tsalary.setPayment_ID(resultSet.getString(2));
						tsalary.setTeacher_ID(resultSet.getString(3));
						tsalary.setRate(resultSet.getString(4));
						tsalary.setValue(resultSet.getString(5));
								
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
				return tsalary;
			}
		
	
	////////////////////////////////////
	/////////////////////////////////
	
	
	
	

	
	
	
	
	
	
	
	
}//////////////End


