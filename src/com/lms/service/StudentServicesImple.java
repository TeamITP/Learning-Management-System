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
import com.lms.model.Lesson;
import com.lms.model.Student;
import com.lms.util.ConnectDB;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.Row;

/**	 
 * Imbulana Liyanage D.S.I.	  
 * IT19134772	  
 */	 


public class StudentServicesImple implements StudentServices{
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;

	public int StudentRegistration(Student student) {
		int status = 0;

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO Student(fristName, lastName, address, phone, Guardian) VALUES(?, ?, ?, ?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, student.getFristName());
			preparedStatement.setString(2, student.getLastName());
			preparedStatement.setString(3, student.getAddress());
			preparedStatement.setString(4, student.getPhone());
			preparedStatement.setString(5, student.getGuardian());

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
	public Student getStudent(String Student_ID) {
		Student student = new Student();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Student WHERE Student_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, Student_ID);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				student.setStudent_ID(resultSet.getString(2));
				student.setFristName(resultSet.getString(3));
				student.setLastName(resultSet.getString(4));
				student.setAddress(resultSet.getString(5));
				student.setPhone(resultSet.getString(6));
				student.setGuardian(resultSet.getString(7));
				student.setPassword(resultSet.getString(8));
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
		return student;
	}
	
	@Override
	public int deleteStudent(String Student_ID) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM Student WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, Student_ID);

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
	 
	
	@Override
	public int updateStudent(Student student) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE Student SET fristName = ?, lastName = ?, address = ?, phone = ?, Guardian = ?, password = ? WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);
			 

			preparedStatement.setString(1, student.getFristName());
			preparedStatement.setString(2, student.getLastName());
			preparedStatement.setString(3, student.getAddress());
			preparedStatement.setString(4, student.getPhone());
			preparedStatement.setString(5, student.getGuardian());
			preparedStatement.setString(6, student.getPassword());
			preparedStatement.setString(7, student.getStudent_ID());
			

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

	 
	@Override
	public Student getStudentById(String studentId) {
		Student student = new Student();
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Student WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, studentId);

			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				student.setStudent_ID(resultSet.getString(2));
				student.setFristName(resultSet.getString(3));
				student.setLastName(resultSet.getString(4));
				student.setAddress(resultSet.getString(5));
				student.setPhone(resultSet.getString(6));
				student.setGuardian(resultSet.getString(7));
				student.setPassword(resultSet.getString(8));
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
		
		return student;
	}


	public ArrayList<Student> getStudentArrayListbyDate(String classroomId, java.util.Date startDate, java.util.Date endDate) {
		ArrayList<Student> arrayList = new ArrayList<Student>();

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM ClassroomStudent WHERE  Classroom_id = ? AND Date >= ? AND Date <= ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, classroomId);
			preparedStatement.setDate(2, new Date(startDate.getTime()));
			preparedStatement.setDate(3, new Date(endDate.getTime()));

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Student  student = new Student();
				student.setStudent_ID(resultSet.getString(2));
				student.setJoinDate(resultSet.getString(3));
				arrayList.add(student);
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
	public ArrayList<Student> getStudentArrayList (String classroomId) {
		ArrayList<Student> arrayList = new ArrayList<Student>();

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM ClassroomStudent WHERE  Classroom_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, classroomId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Student  student = new Student();
				student.setStudent_ID(resultSet.getString(2));
				student.setJoinDate(resultSet.getString(3));
				arrayList.add(student);
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
	public int removeStudent(String Student_ID) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM Student WHERE Student_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			 
			preparedStatement.setString(1, Student_ID);

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
	
	@Override
	public int addStudentClassroom(String studentId, String classroomId) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "INSERT INTO ClassroomStudent(Classroom_id, Student_id) VALUES(?, ?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(2, studentId);
			preparedStatement.setString(1, classroomId);

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
	public ArrayList<Student> getStudentList() {
		ArrayList<Student> arrayList = new ArrayList<Student>();

		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Student ";

			preparedStatement = connection.prepareStatement(sql);

			//preparedStatement.setString(1, Student_ID);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Student student = new Student();
				student.setStudent_ID(resultSet.getString(2));
				student.setFristName(resultSet.getString(3));
				student.setLastName(resultSet.getString(4));
				student.setAddress(resultSet.getString(5));
				student.setPhone(resultSet.getString(6));
				student.setGuardian(resultSet.getString(7));

				arrayList.add(student);
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
	public Student CountStudent() {
		Student student1 = new Student();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT COUNT(*) FROM Student";
			
			preparedStatement = connection.prepareStatement(sql);
			
			//preparedStatement.setString(1, Student_ID);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				student1.setCount(resultSet.getInt(1));
				 
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
		return student1;
	}
	
	//Generate PDF Report
	@Override
	public String studentgenerateReport(String Student_ID, String root) {
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
			cos.showText("----------------------------------------------------------------------------");
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
		cell = row.createCell(15, "Student ID");
		cell.setFontSize(12);
		cell = row.createCell(15, "First Name");
		cell.setFontSize(12);
		cell = row.createCell(15, "Last Name");
		cell.setFontSize(12);
		cell = row.createCell(20, "Email Address");
		cell.setFontSize(12);
		cell = row.createCell(15, "Phone");
		cell.setFontSize(12);
		cell = row.createCell(20, "Guardian");
		cell.setFontSize(12);

		StudentServices studentServices = new StudentServicesImple();
		ArrayList<Student> students =studentServices.getStudentList();

		for (int i = 0; i < students.size(); i++) {
			Student student = studentServices.getStudent(students.get(i).getStudent_ID());
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
			cell = row.createCell(20, student.getAddress());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(15, student.getPhone());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(20, student.getGuardian());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
		}
		try {
			table.draw();

			float tableHeight = table.getHeaderAndDataHeight();
			System.out.println("tableHeight = " + tableHeight);

			// close the content stream
			cos.close();
		
						filePath = root + File.separator + Student_ID + ".pdf";

						document.save(filePath);
						System.out.println(filePath);
						document.close();
						
						//Final DEPLOYMENT ON SERVER
						filePath = "\\UploadedFiles\\PDF\\" +Student_ID + ".pdf";
						
						//For Local Host
						/*
						 * 'LearningManagementSystem' name in the below link might change
						 * So, please sout AND print the -> filePath = root + File.separator + classroomId + ".pdf";
						 * Then see, where your file originally saved on pc
						 * */
						//filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" + Student_ID + ".pdf";
						
						//For GitHub Deployment TESTING
						//filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" + Student_ID + ".pdf";
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return filePath;
	}

	@Override
	public int removeStudentClassroom(String studentId, String classroomId) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM ClassroomStudent WHERE Student_id = ? AND Classroom_id = ?";

			preparedStatement = connection.prepareStatement(sql);

			 
			preparedStatement.setString(1, studentId);
			preparedStatement.setString(2, classroomId);

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


}	
