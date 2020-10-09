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
import com.lms.model.CommonNotice;
import com.lms.util.ConnectDB;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;

public class NoticesServiceImple implements NoticeService {
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	@Override
	public int insertNotice(CommonNotice commonNotice) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO CommonNotice(type, notice_des, EmpId) VALUES(?, ?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, commonNotice.getTitle());
			preparedStatement.setString(2, commonNotice.getNotice_des());
			preparedStatement.setString(3, commonNotice.getEmpId());

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
	
	
	public ArrayList<CommonNotice> getNotice(String empid) {
		ArrayList<CommonNotice> arrayList = new ArrayList<CommonNotice>();
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * From CommonNotice WHERE  EmpId = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, empid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				CommonNotice commonnotice = new CommonNotice();
				
				commonnotice.setNotice_des(resultSet.getString(5));
				commonnotice.setTitle(resultSet.getString(3));
				commonnotice.setNotice_id(resultSet.getString(2));
				commonnotice.setDateTime(resultSet.getString(4));
				
				
				arrayList.add( commonnotice);
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
		return arrayList;
	}
	@Override
	public int updateNotice(CommonNotice commonNotice) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE CommonNotice SET(type, notice_des, EmpId) VALUES(?, ?, ?)" ;
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, commonNotice.getTitle());
			preparedStatement.setString(2, commonNotice.getNotice_des());
			preparedStatement.setString(3, commonNotice.getEmpId());
			

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


	@Override
	public CommonNotice getNoticeById(String noticeId) {
		CommonNotice commonNotice = new CommonNotice();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * From CommonNotice WHERE  Notice_id = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, noticeId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				commonNotice.setNotice_des(resultSet.getString(5));
				commonNotice.setTitle(resultSet.getString(3));
				commonNotice.setNotice_id(noticeId);
				
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
		return commonNotice;
	}
	public int DeleteNotices(String Notice_id)
	{
		int status = 0;
		
		try{
			connection = ConnectDB.getDBConnection();
		
	    String sql = "delete from CommonNotice where Notice_id = '"+Notice_id+"'";
	    
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
	public String generateReport(String empid ,String root) {
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
			
			cos.newLine();
			cos.setFont(fontPlain, 12);
			cos.showText("Notices:");
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
		cell = row.createCell(15, "Notice_Id");
		cell.setFontSize(12);
		cell = row.createCell(55, "Title");
		cell.setFontSize(12);
		cell = row.createCell(30, "Description");
		cell.setFontSize(12);
	
	

		NoticeService noticeService = new NoticesServiceImple();
		ArrayList<CommonNotice> notice = noticeService.getNotice(empid);

		for (int i = 0; i < notice.size(); i++) {
			CommonNotice notice1 =  noticeService.getNoticeById(notice.get(i).getNotice_id());
			row = table.createRow(20);
			cell = row.createCell(15, notice1.getNotice_id());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(55, notice1.getTitle());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(30, notice1.getNotice_des());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			
		}
		try {
			table.draw();

			float tableHeight = table.getHeaderAndDataHeight();
			System.out.println("tableHeight = " + tableHeight);

			// close the content stream
			cos.close();
		
						filePath = root + File.separator + empid + ".pdf";

						document.save(filePath);
						System.out.println(filePath);
						document.close();
						
						//Final DEPLOYMENT ON SERVER
						//filePath = "\\UploadedFiles\\PDF\\" + classroomId + ".pdf";
						
						//For Local Host
						/*
						 * 'LearningManagementSystem' name in the below link might change
						 * So, please sout AND print the -> filePath = root + File.separator + empid+ ".pdf";
						 * Then see, where your file originally saved on pc
						 * */
						filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" + empid + ".pdf";
						
						//For GitHub Deployment TESTING
						//filePath = "\\LearningManagementSystem-0.0.1-SNAPSHOT\\UploadedFiles\\PDF\\" + empid + ".pdf";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return filePath;
	}
	
	

}
