package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.lms.model.ExamResult;
import com.lms.model.Recorrection;
import com.lms.util.ConnectDB;

public class RecorrectionServicesImp implements RecorrectionServices{

	
	
	
	private static Connection connection;
	private static PreparedStatement preparedstatement;
	
	
	
	public  int InsertResult(Recorrection recorrection)
	{ 
		
		int status = 0;
		try {
		  connection = ConnectDB.getDBConnection(); 
		  String SQL = "INSERT INTO ReCorrection(Result_ID,Description)VALUES(?,?)";
			
	     preparedstatement  =  connection.prepareStatement(SQL);
	     
	     preparedstatement.setString(1, recorrection.getResultId());
	     preparedstatement.setString(2, recorrection.getDescription());
	   
	     
	     
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
}
