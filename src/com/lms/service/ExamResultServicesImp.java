package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.lms.model.ExamResult;
import com.lms.model.Examination;
import com.lms.util.ConnectDB;

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


	
	
	public boolean getstudentmarks(String studentid,String examid) {
		
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * from Exam_Result where Stu_ID = '"+studentid+"' and Exam_ID = '"+examid+"'";
			
			preparedstatement = connection.prepareStatement(sql);
			
			
			
			ResultSet resultSet = preparedstatement.executeQuery();
			
			
				
				if(resultSet.next()) {
					
					isSuccess = true;
				}else{
					isSuccess = false;
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
		return  isSuccess;
	}

}
