package com.lms.service;

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

import com.lms.model.Assignment;
import com.lms.model.Classroom;
import com.lms.model.Student;
import com.lms.util.ConnectDB;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;

public class AssignmentServiceImpl implements AssignmentServices {
	
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	
	@Override
	public int createAssignment(Assignment assignment) {
		// TODO Auto-generated method stub
		
	int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO Assignment( Date, Class_ID, Question) VALUES( ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, assignment.getDate());
			preparedStatement.setString(2, assignment.getClass_ID());
			preparedStatement.setString(3, assignment.getQuestion());
			
			
			status = preparedStatement.executeUpdate();
			
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (java.sql.SQLException e) {
				System.out.println(e.getMessage());
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return status;
	}

	@Override
	public ArrayList<Assignment> getAssignmentList(String Class_ID) {
		// TODO Auto-generated method stub
ArrayList<Assignment> arrayList = new ArrayList<Assignment>();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Assignment WHERE Class_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, Class_ID);			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				Assignment assignment = new Assignment();
				assignment.setA_ID(resultSet.getString(2));
				assignment.setDate(resultSet.getString(3));
				assignment.setClass_ID(resultSet.getString(4));
				assignment.setQuestion(resultSet.getString(5));
				
				arrayList.add(assignment);
			}
			System.out.println(arrayList.size());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
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
				System.out.println(e.getMessage());
			}
		}
		return arrayList;
	}
	@Override
	public Assignment getAssignment(String A_ID) {
		Assignment assignment = new Assignment();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Assignment WHERE A_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, A_ID);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				assignment.setA_ID(resultSet.getString(2));
				assignment.setDate(resultSet.getString(3));
				assignment.setClass_ID(resultSet.getString(4));
				assignment.setQuestion(resultSet.getString(5));
			}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
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
			System.out.println(e.getMessage());
		}
	}
		return assignment;
	}
	
	
	public int UpdateAssignment(Assignment assignment) {
	int status = 0;

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "UPDATE Assignment SET Date = ?, Question = ? WHERE A_ID = ?";
		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, assignment.getDate());
		preparedStatement.setString(2, assignment.getQuestion());
		preparedStatement.setString(3, assignment.getA_ID());
		

		System.out.println(preparedStatement);
		status = preparedStatement.executeUpdate();

		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (java.sql.SQLException e) {
			System.out.println(e.getMessage());
		}

	} catch (SQLException e) {
//		logger.log(Level.SEVERE, e.getMessage());
		System.out.println(e.getMessage());
	}

	return status;
}
	
	
	public int DeleteAssignment(String A_ID)
	{
		int status = 0;
		
		try{
			connection = ConnectDB.getDBConnection();
		
	    String sql = "delete from Assignment where A_ID = '"+A_ID+"'";
	    
	    preparedStatement = connection.prepareStatement(sql);
	    status =  preparedStatement.executeUpdate();
	    
		}catch (SQLException e) {
			System.out.println(e.getMessage());
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
				System.out.println(e.getMessage());
			}
		}
				
				
		return status;	
	}
	
	public Assignment getAssignment1(String Class_ID) {
		Assignment assignment = new Assignment();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Assignment WHERE Class_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, Class_ID);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				assignment.setA_ID(resultSet.getString(2));
				assignment.setDate(resultSet.getString(3));
				assignment.setClass_ID(resultSet.getString(4));
				assignment.setQuestion(resultSet.getString(5));
			}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
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
			System.out.println(e.getMessage());
		}
	}
		return assignment;
	}
	
	
	
	public String generateReport(String Class_ID) {
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

	   Assignment assignment = getAssignment1(Class_ID);

		try {
			cos.setFont(PDType1Font.COURIER, 12);
			cos.setLeading(14.5f);
			cos.beginText();
			// Setting the position for the line
			cos.newLineAtOffset(25, 830);

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
			cos.showText("----------------------------------------------------------------------------");
			cos.newLine();
			cos.newLine();
			cos.showText("Classroom ID : " + assignment.getClass_ID());
			cos.newLine();
			cos.newLine();
			cos.setFont(fontPlain, 12);
			cos.showText("Questions:");
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
		float yPosition = 700;

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
		cell = row.createCell(15, "A_ID");
		cell.setFontSize(12);
		cell = row.createCell(55, "Question");
		cell.setFontSize(12);
		cell = row.createCell(30, "Deadline");
		cell.setFontSize(12);
	
	

		AssignmentServices assignmentServices = new AssignmentServiceImpl();
		ArrayList<Assignment> assignments = assignmentServices.getAssignmentList(Class_ID);

		for (int i = 0; i < assignments.size(); i++) {
			Assignment assignment1 = assignmentServices.getAssignment(assignments.get(i).getA_ID());
			row = table.createRow(20);
			cell = row.createCell(15, assignment1.getA_ID());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(55, assignment1.getQuestion());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(30, assignment1.getDate());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			
		}
		try {
			table.draw();

			float tableHeight = table.getHeaderAndDataHeight();
			System.out.println("tableHeight = " + tableHeight);

			// close the content stream
			cos.close();
			// Save the results and ensure that the document is properly closed:
			filePath = System.getProperty("catalina.base")
					+ "\\wtpwebapps\\LearningManagementSystem\\UploadedFiles\\PDF\\" + Class_ID + ".pdf";

			document.save(filePath);
			document.close();
			
			filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" + Class_ID + ".pdf";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return filePath;
	}
	
	
}
