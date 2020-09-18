package com.lms.service;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.lang.System.Logger;
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
import com.lms.util.ConnectDB;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;

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
	
	
	public Examination getExamination(String examId) {
		Examination examination= new Examination();
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Examination WHERE Exam_ID = ?";

			preparedstatement = connection.prepareStatement(sql);

			preparedstatement.setString(1, examId);

			ResultSet resultSet = preparedstatement.executeQuery();

			while (resultSet.next()) {
				examination.setClassroomid(resultSet.getString(4));
				examination.setExamID(resultSet.getString(2));
				examination.setDate(resultSet.getString(3));
				
			}
		} catch (SQLException e) {
			
		} finally {
			/*
			 * Close statement and database connectivity at the end of the transaction
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
		return examination;
	}
	
	
	
	public String generateReport(String examId,String root) {
		String filePath = null;

		// Create a new font object selecting one of the PDF base fonts
		PDFont fontPlain = PDType1Font.HELVETICA;
		PDFont fontBold = PDType1Font.HELVETICA_BOLD;
		PDFont fontItalic = PDType1Font.HELVETICA_OBLIQUE;
		PDFont fontMono = PDType1Font.COURIER;

		// Create a document and add a page to it
		PDDocument document = new PDDocument();
		PDPage page = new PDPage(PDRectangle.A4);
		// PDRectangle.LETTER and others are also possible
		PDRectangle rect = page.getMediaBox();
		// rect can be used to get the page width and height
		document.addPage(page);

		// Start a new content stream which will "hold" the to be created content
		PDPageContentStream cos = null;
		try {
			cos = new PDPageContentStream(document, page);
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		
		Examination examination =  getExamination(examId);
		
	
		 
		try {
			cos.setFont(PDType1Font.COURIER, 12);
			cos.setLeading(14.5f);
			cos.beginText();
			// Setting the position for the line
			cos.newLineAtOffset(25, 800);

			// Adding text in the form of string
			cos.showText("----------------------------------------------------------------------------");
			cos.newLine();
			cos.newLine();
			cos.setFont(fontBold, 20);
			cos.showText("New Montana");
			cos.setFont(PDType1Font.COURIER, 12);
			cos.newLine();
			cos.showText(dtf.format(now));
			cos.newLine();
			//cos.showText("Report Generated By : " + );
			cos.newLine();
			cos.showText("----------------------------------------------------------------------------");
			cos.newLine();
			cos.newLine();
			cos.showText("Classroom ID : " + examination.getClassroomid());
			cos.newLine();
			cos.showText("ExamDate : " + examination.getDate());
			cos.newLine();
			cos.showText("Exam ID : " + examination.getExamID());
			cos.newLine();
			cos.newLine();
			cos.setFont(fontPlain, 12);
			cos.showText("Result Details");
			cos.endText();

		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		// Dummy Table
		float margin = 25;
		// starting y position is whole page height subtracted by top and bottom margin
		float yStartNewPage = page.getMediaBox().getHeight() - (2 * margin);
		// we want table across whole page width (subtracted by left and right margin
		// ofcourse)
		float tableWidth = page.getMediaBox().getWidth() - (2 * margin);

		boolean drawContent = true;
		float yStart = yStartNewPage;
		float bottomMargin = 70;
		// y position is your coordinate of top left corner of the table
		float yPosition = 600;

		BaseTable table = null;
		try {
			table = new BaseTable(yPosition, yStartNewPage, bottomMargin, tableWidth, margin, document, page, true,
					drawContent);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// the parameter is the row height
		Row<PDPage> headerRow;
		// the first parameter is the cell width
		Cell<PDPage> cell;

		Row<PDPage> row = table.createRow(20);
		cell = row.createCell(15, "Result ID");
		cell.setFontSize(12);
		cell = row.createCell(15, "Student ID");
		cell.setFontSize(12);
		cell = row.createCell(15, "Marks");
		cell.setFontSize(12);
		cell = row.createCell(15, "Rank");
		cell.setFontSize(12);

		ExamResultServices examresultservices = new ExamResultServicesImp();
	      ArrayList<ExamResult> arrayList = examresultservices.getExamResultList(examId);

		for (int i = 0; i < arrayList.size(); i++) {
			ExamResult examresult = examresultservices.getResult(arrayList.get(i).getResult_ID());
			row = table.createRow(20);
			cell = row.createCell(15, examresult.getResult_ID());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(15, examresult.getStudent_ID());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(15,Integer.toString(examresult.getMarks()) );
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(15, Integer.toString(examresult.getRank()));
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
		}
		try {
			table.draw();

			float tableHeight = table.getHeaderAndDataHeight();
			System.out.println("tableHeight = " + tableHeight);

			// close the content stream
			cos.close();
			
			filePath = root + File.separator + examId + ".pdf";

			document.save(filePath);
			System.out.println(filePath);
			document.close();
			// Save the results and ensure that the document is properly closed:
			//filePath = System.getProperty("catalina.base")
					//+ "\\wtpwebapps\\LearningManagementSystem\\UploadedFiles\\PDF\\" + examId + ".pdf";

			
			//filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" +examId + ".pdf";
			//For GithHub
			//filePath = "\\LearningManagementSystem-0.0.1-SNAPSHOT\\UploadedFiles\\PDF\\" + examId + ".pdf";
			filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" + examId + ".pdf";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return filePath;
	}


	
	

	
	
}
