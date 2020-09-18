package com.lms.service;

import java.awt.Color;
import java.io.File;
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

import com.lms.model.Classroom;
import com.lms.model.ExamResult;
import com.lms.model.Examination;
import com.lms.model.Student;
import com.lms.util.ConnectDB;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;

public class ExamResultServicesImp implements ExamResultServices{
	
	private static Connection connection;
	private static PreparedStatement preparedstatement;
	private static boolean isSuccess;
	
	
	
	public  int InsertResult(ExamResult examresult)
	{ 
		
		int status = 0;
		try {
		  connection = ConnectDB.getDBConnection(); 
		  String SQL = "INSERT INTO Exam_Result(Exam_ID,Stu_ID,Marks)VALUES(?,?,?)";
			
	     preparedstatement  =  connection.prepareStatement(SQL);
	     
	     preparedstatement.setString(1, examresult.getExam_ID());
	     preparedstatement.setString(2, examresult.getStudent_ID());
	     preparedstatement.setInt(3, examresult.getMarks());
	     
	     
	     status =  preparedstatement.executeUpdate();
	     
	     if( preparedstatement != null)
	     {
	    	 preparedstatement.close(); 
	     }if(connection != null) {
	    	 connection.close();
	     }
					
		}catch(SQLException e)
		{
			e.printStackTrace();
			System.out.println( "Data not Entered");
		}
		return status;
		
	}
	
	
	public ArrayList<ExamResult> getExamResultList(String ExamID) {
		ArrayList<ExamResult> arrayList = new ArrayList<ExamResult>();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT *,Rank() OVER(ORDER BY Marks DESC) rank From Exam_Result WHERE Exam_ID = ?";
			
			preparedstatement = connection.prepareStatement(sql);
			
			preparedstatement.setString(1, ExamID);
			
			ResultSet resultSet = preparedstatement.executeQuery();
			
			while (resultSet.next()) {
				ExamResult examresult = new ExamResult();
				examresult.setResult_ID(resultSet.getString(2));
				examresult.setStudent_ID(resultSet.getString(4));
				examresult.setMarks(resultSet.getInt(5));
				examresult.setRank(resultSet.getInt(6));
				
				
				arrayList.add(examresult);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedstatement != null) {
					preparedstatement.close();
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
	
	public int UpdateResult(String resultId,int marks)
	{		
		int status = 0;
			
			try{
				connection = ConnectDB.getDBConnection();
			
		    String sql = "update Exam_Result set Marks='"+marks+"'"
		    		+ "where Result_ID='"+resultId+"'";
		    
		    preparedstatement = connection.prepareStatement(sql);
		    status =  preparedstatement.executeUpdate();
		    
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			} finally {
				/*
				 * Close statement and database connectivity at the end of transaction
				 */
				try {
					if (preparedstatement != null) {
						preparedstatement.close();
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
	
	
	public int DeleteResult(String resultid)
	{
		int status = 0;
		
		try{
			connection = ConnectDB.getDBConnection();
		
	    String sql = "delete from Exam_Result where Result_ID = '"+resultid+"'";
	    
	    preparedstatement = connection.prepareStatement(sql);
	    status =  preparedstatement.executeUpdate();
	    
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedstatement != null) {
					preparedstatement.close();
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


	
	
	public  ExamResult getstudentmarks(String studentid,String examid) {
		ExamResult examResult = new ExamResult();
		
		try {
connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT *,Rank() OVER(ORDER BY Marks DESC) rank From Exam_Result WHERE Exam_ID = ?";
			
			preparedstatement = connection.prepareStatement(sql);
			
			preparedstatement.setString(1, examid);
			
			ResultSet resultSet = preparedstatement.executeQuery();
				
			while (resultSet.next()) {
				if (resultSet.getString(4).equals(studentid)) {
					examResult.setMarks(resultSet.getInt(5));
					examResult.setRank(resultSet.getInt(6));
					break;
				}
				
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			/*
			 * Close statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedstatement != null) {
					preparedstatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return examResult ;
	}
	
	
	
	public ExamResult getResult(String Resultid) {
		ExamResult examresult = new ExamResult();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT *,Rank() OVER(ORDER BY Marks DESC) rank From Exam_Result WHERE Result_ID = ?";
			
			preparedstatement = connection.prepareStatement(sql);
			
			preparedstatement.setString(1, Resultid);
			
			ResultSet resultSet = preparedstatement.executeQuery();
			
			while (resultSet.next()) {
				examresult.setExam_ID(resultSet.getString(3));
				examresult.setMarks(resultSet.getInt(5));
				examresult.setStudent_ID(resultSet.getString(4));
				examresult.setRank(resultSet.getInt(6));
				
			}
	} catch (SQLException e) {
		
	} finally {
		/*
		 * Close statement and database connectivity at the end of transaction
		 */
		try {
			if (preparedstatement != null) {
				preparedstatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (java.sql.SQLException e) {
			
		}
	}
		return examresult;
	}
	
	
	

}
