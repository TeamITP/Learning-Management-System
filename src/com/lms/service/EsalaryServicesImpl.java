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
import com.lms.model.Esalary;
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

public class EsalaryServicesImpl  implements EsalaryServices {


	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	
	

	@Override
	public int insertEsalary(Esalary esalary) {
		// TODO Auto-generated method stub
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO EmployeeSalary(Emp_ID, Contract) VALUES(?, ?)";
		

			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, esalary.getEmp_ID());
			preparedStatement.setString(2, esalary.getContract());
			
			
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
		public ArrayList<Esalary> getEsalaryList() {
			ArrayList<Esalary> arrayList = new ArrayList<Esalary>();
		{
			
			
				try {
					connection = ConnectDB.getDBConnection();
					
					String sql = "SELECT * FROM EmployeeSalary ";
					
					preparedStatement = connection.prepareStatement(sql);
					
					ResultSet resultSet = preparedStatement.executeQuery();
					
					while (resultSet.next()) {
						Esalary esalary = new Esalary();
						esalary.setPayment_ID(resultSet.getString(2));
						esalary.setEmp_ID(resultSet.getString(3));
						esalary.setContract(resultSet.getString(4));
					
						arrayList.add(esalary);
						
						
						
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
	public Esalary  getEsalary(String Payment_ID) {
		Esalary esalary = new Esalary();

		
				try {
					connection = ConnectDB.getDBConnection();
					
					String sql = "SELECT * FROM EmployeeSalary WHERE Payment_ID = ?";
					preparedStatement = connection.prepareStatement(sql);
				    preparedStatement.setString(1, Payment_ID);
					ResultSet resultSet = preparedStatement.executeQuery();
					
					while (resultSet.next()) {
						esalary.setPayment_ID(resultSet.getString(2));
						esalary.setEmp_ID(resultSet.getString(3));
						esalary.setContract(resultSet.getString(4));
						
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
				return esalary;
			}
		
	
	////////////////////////////////////
	/////////////////////////////////
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}///////////////
