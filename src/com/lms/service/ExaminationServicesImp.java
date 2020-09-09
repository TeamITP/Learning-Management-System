package com.lms.service;

import java.lang.System.Logger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import com.lms.model.Classroom;
import com.lms.model.ExamResult;
import com.lms.model.Examination;
import com.lms.util.ConnectDB;

public class ExaminationServicesImp implements ExaminationServices {

	private static Connection connection;
	private static PreparedStatement preparedstatement;
	private static Statement statement;
	
	
	
	public  int InsertExamination(Examination examination)
	{ 
		
		int status = 0;
		try {
		  connection = ConnectDB.getDBConnection(); 
		  String SQL = "INSERT INTO Examination(Date,Classroomid) VALUES(?,?)";
			
	     preparedstatement  =  connection.prepareStatement(SQL);  
	     
	     preparedstatement.setString(1, examination.getDate());
	     preparedstatement.setString(2, examination.getClassroomid());
	     
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
	
	
	public ArrayList<Examination> getExaminationList(String classroomid) {
		ArrayList<Examination> arrayList = new ArrayList<Examination>();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Examination WHERE ClassroomId = ?";
			
			preparedstatement = connection.prepareStatement(sql);
			
			preparedstatement.setString(1, classroomid);
			
			ResultSet resultSet = preparedstatement.executeQuery();
			
			while (resultSet.next()) {
				Examination examination = new Examination();
				examination.setClassroomid(resultSet.getString(4));
				examination.setDate(resultSet.getString(3));
				examination.setExamID(resultSet.getString(2));
				
				
				arrayList.add(examination);
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

	
	
}
