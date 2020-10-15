/* Implementation
 * @author Pussadeniya PMSSB
 * IT19218618
 * 
 * */

package com.lms.service;
import com.lms.model.Assignment;
import com.lms.model.Classfees;
import com.lms.model.Classroom;
import com.lms.model.Employee;
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



public class ClassfeesServicesImpl implements ClassfeesServices {
	
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;


	@Override
	public int insertClassfees(Classfees classfees) {
		// TODO Auto-generated method stub
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO ClassFee(DateAndTime, Value, Amount, Classroom_id, Student_ID ) VALUES(?, ?, ?, ?,?)";
		

			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, classfees.getDateAndTime());
			preparedStatement.setString(2, classfees.getValue());
			preparedStatement.setString(3, classfees.getAmount());
			preparedStatement.setString(4, classfees.getClassroom_id());
			preparedStatement.setString(5, classfees.getStudent_ID());
			
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
	
	
	
	
	//ArrayList	
	@Override
	
	public ArrayList<Classfees> getClassfeesList() {
		ArrayList<Classfees> arrayList = new ArrayList<Classfees>();
	{
		
		
			try {
				connection = ConnectDB.getDBConnection();
				
				String sql = "SELECT * FROM ClassFee ";
				
				preparedStatement = connection.prepareStatement(sql);
				
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					Classfees classfees = new Classfees();
					classfees.setPayment_ID(resultSet.getString(2));
					classfees.setDateAndTime(resultSet.getString(3));
					classfees.setValue(resultSet.getString(4));
					classfees.setAmount(resultSet.getString(5));
					classfees.setClassroom_id(resultSet.getString(6));
					classfees.setStudent_ID(resultSet.getString(7));
					arrayList.add(classfees);
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
	
	
	
@Override
public Classfees getClassfees(String Payment_ID) {
			Classfees classfees = new Classfees();

	
			try {
				connection = ConnectDB.getDBConnection();
				
				String sql = "SELECT * FROM ClassFee WHERE Payment_ID = ?";
				
				preparedStatement = connection.prepareStatement(sql);
				
				preparedStatement.setString(1, Payment_ID);
				
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					classfees.setPayment_ID(resultSet.getString(2));
					classfees.setDateAndTime(resultSet.getString(3));
					classfees.setValue(resultSet.getString(4));
					classfees.setAmount(resultSet.getString(5));
					classfees.setClassroom_id(resultSet.getString(6));
					classfees.setStudent_ID(resultSet.getString(7));
					
					
					
					
					
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
			return classfees;
		}
	
	

// Delete Classfees
@Override
public int deleteClassfee( String Payment_ID) {
	int status = 0;
	try {
		connection = ConnectDB.getDBConnection();

		String sql = "DELETE FROM ClassFee WHERE Payment_ID= '"+Payment_ID+"'";

		preparedStatement = connection.prepareStatement(sql);

		//preparedStatement.setString(1, Payment_ID);

		status= preparedStatement.executeUpdate();

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
	
	return status;
}







	//Update ClassFees
@Override
public int updateClassfees(Classfees classfees) {
	int status = 0;
	try {
		connection = ConnectDB.getDBConnection();

		String sql = "UPDATE ClassFee SET DateAndTime = ?, Value = ?, Amount = ?, Classroom_id = ?, Student_ID = ? WHERE Payment_ID = ?";

		
		//String sql = "UPDATE CommonNotice SET(type, notice_des, EmpId) VALUES(?, ?, ?)" ;
		preparedStatement = connection.prepareStatement(sql);
		

		preparedStatement.setString(1, classfees.getDateAndTime());
		preparedStatement.setString(2, classfees.getValue());
		preparedStatement.setString(3, classfees.getAmount());
		preparedStatement.setString(4, classfees.getClassroom_id());
		preparedStatement.setString(5, classfees.getStudent_ID());
		preparedStatement.setString(6, classfees.getPayment_ID ());
		
			
		status= preparedStatement.executeUpdate();

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
	
	return status;
}

	
	


////Genarate REport
public String generateReport(String Payment_ID) {
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

   Classfees classfees = getClassfees( Payment_ID);

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
		cos.showText("Payment ID : " + classfees.getPayment_ID());
		cos.newLine();
		cos.newLine();
		cos.setFont(fontPlain, 12);
		
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
	cell = row.createCell(15, "Payment_ID");
	cell.setFontSize(12);
	cell = row.createCell(55, "Classroom_id");
	cell.setFontSize(12);
	cell = row.createCell(30, "Student_ID");
	cell.setFontSize(12);



	ClassfeesServices classfeesServices = new ClassfeesServicesImpl();
	ArrayList<Classfees> classfeess = classfeesServices.getClassfeesList( );

	
    
	for (int i = 0; i < classfeess.size(); i++) {
		Classfees classfees2 = classfeesServices.getClassfees(classfeess.get(i).getPayment_ID());
		row = table.createRow(20);
		cell = row.createCell(15, classfees.getPayment_ID());
		cell.setFontSize(12);
		cell.setTextColor(Color.GRAY);
		cell = row.createCell(55, classfees.getClassroom_id());
		cell.setFontSize(12);
		cell.setTextColor(Color.GRAY);
		cell = row.createCell(30, classfees.getStudent_ID());
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
				+ "\\wtpwebapps\\LearningManagementSystem\\UploadedFiles\\PDF\\" + Payment_ID + ".pdf";

		document.save(filePath);
		document.close();
		
		filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" + Payment_ID + ".pdf";
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	return filePath;
}

	
	
	




















	}






	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
		
		
	
	



