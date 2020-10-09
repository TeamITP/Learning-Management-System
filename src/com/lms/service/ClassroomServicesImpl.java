package com.lms.service;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

import com.lms.model.Classroom;
import com.lms.model.Student;
import com.lms.util.ConnectDB;
import com.sun.org.apache.bcel.internal.generic.RETURN;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.HorizontalAlignment;
import be.quodlibet.boxable.Row;
import be.quodlibet.boxable.VerticalAlignment;
import be.quodlibet.boxable.line.LineStyle;

/* 
 * @author W.G. YASIRU RANDIKA 
 * IT19131184
 * 
 * */
public class ClassroomServicesImpl implements ClassroomServices {

	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;

	@Override
	public int createClass(Classroom classroom) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO Classroom(Grade, Subject, Description, ClassTime, Teacher_Id) VALUES(?, ?, ?, ?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setInt(1, classroom.getGrade());
			preparedStatement.setString(2, classroom.getSubject());
			preparedStatement.setString(3, classroom.getDescription());
			preparedStatement.setString(4, classroom.getClassTime());
			preparedStatement.setString(5, classroom.getTeacherId());

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
	public ArrayList<Classroom> getClassroomList(String teacherId) {
		ArrayList<Classroom> arrayList = new ArrayList<Classroom>();

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Classroom WHERE Teacher_Id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, teacherId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Classroom classroom = new Classroom();
				classroom.setClassrooId(resultSet.getString(2));
				classroom.setGrade(resultSet.getInt(3));
				classroom.setSubject(resultSet.getString(4));
				classroom.setDescription(resultSet.getString(5));
				classroom.setClassTime(resultSet.getString(6));

				arrayList.add(classroom);
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

	@Override
	public Classroom getClassroom(String classroomId) {
		Classroom classroom = new Classroom();
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Classroom WHERE Classroom_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, classroomId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				classroom.setClassrooId(resultSet.getString(2));
				classroom.setGrade(resultSet.getInt(3));
				classroom.setSubject(resultSet.getString(4));
				classroom.setDescription(resultSet.getString(5));
				classroom.setClassTime(resultSet.getString(6));
				classroom.setTeacherId(resultSet.getString(7));
			}
		} catch (SQLException e) {
			logger.log(Level.SEVERE, e.getMessage());
		} finally {
			/*
			 * Close statement and database connectivity at the end of the transaction
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
		return classroom;
	}

	@Override
	public int updateClassroom(Classroom classroom) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE Classroom SET Grade = ?, Subject = ?, Description = ?, ClassTime = ? WHERE Classroom_id = ?";
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setInt(1, classroom.getGrade());
			preparedStatement.setString(2, classroom.getSubject());
			preparedStatement.setString(3, classroom.getDescription());
			preparedStatement.setString(4, classroom.getClassTime());
			preparedStatement.setString(5, classroom.getClassrooId());

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
	public ArrayList<Classroom> getClassroomListStudent(String studentId) {
		ArrayList<Classroom> arrayList = new ArrayList<Classroom>();

		try {
			connection = ConnectDB.getDBConnection();

			ArrayList<String> clzId = new ArrayList<String>();

			String sqlQ = "SELECT * FROM ClassroomStudent WHERE Student_id = ?";
			preparedStatement = connection.prepareStatement(sqlQ);
			preparedStatement.setString(1, studentId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				clzId.add(resultSet.getString(1));
			}

			for (String clz : clzId) {

				String sql = "SELECT * FROM Classroom WHERE Classroom_id = ?";

				preparedStatement = connection.prepareStatement(sql);

				preparedStatement.setString(1, clz);

				ResultSet resultSet1 = preparedStatement.executeQuery();

				while (resultSet1.next()) {
					Classroom classroom = new Classroom();
					classroom.setClassrooId(resultSet1.getString(2));
					classroom.setGrade(resultSet1.getInt(3));
					classroom.setSubject(resultSet1.getString(4));
					classroom.setDescription(resultSet1.getString(5));
					classroom.setClassTime(resultSet1.getString(6));

					arrayList.add(classroom);
				}
				System.out.println(arrayList.toString());
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

	@Override
	public int deleteClassroom(String classroomId) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM Classroom WHERE Classroom_id = ?";
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, classroomId);

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
	public String generateReport(String classroomId, String startDate, String endDate, String root) {
		String filePath = null;
		
		DateFormat simleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date startDateString = null, endDateString = null;
		try {
			startDateString = simleDateFormat.parse(startDate);
			System.out.println(startDateString.toString());
			endDateString = simleDateFormat.parse(endDate);
			System.out.println(endDateString.toString());
		} catch (ParseException e3) {
			// TODO Auto-generated catch block
			e3.printStackTrace();
		}
		
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
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDateTime now = LocalDateTime.now();

		Classroom classroom = getClassroom(classroomId);

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
			cos.showText("Report Generated By : " + classroom.getTeacherId());
			cos.newLine();
			cos.showText("----------------------------------------------------------------------------");
			cos.newLine();
			cos.newLine();
			cos.showText("Classroom ID : " + classroom.getClassrooId());
			cos.newLine();
			cos.showText("Subject : " + classroom.getSubject());
			cos.newLine();
			cos.showText("Description : " + classroom.getDescription());
			cos.newLine();
			cos.showText("ClassTime : " + classroom.getClassTime());
			cos.newLine();
			cos.showText("Grade : " + classroom.getGrade());
			cos.newLine();
			cos.showText("Start Date : " + startDate);
			cos.newLine();
			cos.showText("End DATE : " + endDate);
			cos.newLine();
			cos.newLine();
			cos.setFont(fontPlain, 12);
			cos.showText("Students Details");
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
		float yPosition = 570;

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

		StudentServices classroomServices = new StudentServicesImple();
		ArrayList<Student> students = classroomServices.getStudentArrayListbyDate(classroomId, startDateString, endDateString);
		
		if (students.size() == 0) {
			try {
				cos.setFont(PDType1Font.COURIER, 12);
				cos.setLeading(14.5f);
				cos.beginText();
				cos.newLineAtOffset(25, 520);
				cos.showText("*** No Data Found ***");
				cos.endText();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		} else {
		Row<PDPage> row = table.createRow(20);
		cell = row.createCell(15, "Student ID");
		cell.setFontSize(12);
		cell = row.createCell(15, "First Name");
		cell.setFontSize(12);
		cell = row.createCell(15, "Last Name");
		cell.setFontSize(12);
		cell = row.createCell(15, "Phone");
		cell.setFontSize(12);
		cell = row.createCell(20, "Email");
		cell.setFontSize(12);
		cell = row.createCell(20, "Joined Data");
		cell.setFontSize(12);

		

		for (int i = 0; i < students.size(); i++) {
			Student student = classroomServices.getStudent(students.get(i).getStudent_ID());
			row = table.createRow(20);
			cell = row.createCell(15, student.getStudent_ID());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(15, student.getFristName());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(15, student.getLastName());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(15, student.getPhone());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(20, student.getAddress());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(20, students.get(i).getJoinDate());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
		}
		}
		try {
			table.draw();

			float tableHeight = table.getHeaderAndDataHeight();
			System.out.println("tableHeight = " + tableHeight);

			// close the content stream
			cos.close();


			//filePath = root + File.separator + classroomId + ".pdf";

			document.save(filePath);
			System.out.println(filePath);
			document.close();

			//Final DEPLOYMENT ON SERVER
			//filePath = "\\UploadedFiles\\PDF\\" + classroomId + ".pdf";
			
			//For Local Host
			/*
			 * 'LearningManagementSystem' name in the below link might change
			 * So, please sout AND print the -> filePath = root + File.separator + classroomId + ".pdf";
			 * Then see, where your file originally saved on pc
			 * */
			//filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" + classroomId + ".pdf";
			
			//For GitHub Deployment TESTING
			filePath = "\\LearningManagementSystem-0.0.1-SNAPSHOT\\UploadedFiles\\PDF\\" + classroomId + ".pdf";
						
						
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return filePath;
	}

}
