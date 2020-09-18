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
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;

import com.lms.model.Employee;
import com.lms.util.ConnectDB;
import com.sun.org.apache.bcel.internal.generic.RETURN;

import be.quodlibet.boxable.BaseTable;
import be.quodlibet.boxable.Cell;
import be.quodlibet.boxable.HorizontalAlignment;
import be.quodlibet.boxable.Row;
import be.quodlibet.boxable.VerticalAlignment;
import be.quodlibet.boxable.line.LineStyle;

/* 
 * @author Anuththara K.G.S.N.
 * IT19142692
 * 
 * */
public class EmployeeServicesImpl implements EmployeeServices {

	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	@Override
	public int insertEmployee(Employee employee) {
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO Employee(Name, NIC, Phone, Address) VALUES(?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, employee.getName());
			preparedStatement.setString(2, employee.getNIC());
			preparedStatement.setString(3, employee.getPhone());
			preparedStatement.setString(4, employee.getAddress());
			
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
	public Employee getEmployee(String empid) {
		Employee employee = new Employee();
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "SELECT * FROM Employee WHERE Emp_ID = ?";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, empid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				employee.setEmp_ID(resultSet.getString(2));
				employee.setName(resultSet.getString(3));
				employee.setAddress(resultSet.getString(4));
				employee.setPhone(resultSet.getString(5));
				employee.setNIC(resultSet.getString(6));
				employee.setPassword(resultSet.getString(7));
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
		return employee;
	}

	@Override
	public int deleteEmployee(String empId) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "DELETE FROM Employee WHERE Emp_ID = ?";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, empId);

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
	public int updateEmployee(Employee employee) {
		int status = 0;
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "UPDATE Employee SET Name = ?, Address = ?, Phone = ?, NIC = ?, Password = ? WHERE Emp_ID = ?";

			preparedStatement = connection.prepareStatement(sql);
			System.out.println(employee.getPassword());

			preparedStatement.setString(1, employee.getName());
			preparedStatement.setString(2, employee.getAddress());
			preparedStatement.setString(3, employee.getPhone());
			preparedStatement.setString(4, employee.getNIC());
			preparedStatement.setString(5, employee.getPassword());
			preparedStatement.setString(6, employee.getEmp_ID());
				
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
	public ArrayList<Employee> getEmployeeArrayList() {
		ArrayList<Employee> arrayList = new ArrayList<Employee>();
		
		try {
			connection = ConnectDB.getDBConnection();

			String sql = "SELECT * FROM Employee ";

			preparedStatement = connection.prepareStatement(sql);

			//preparedStatement.setString(1, empId);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Employee  employee = new Employee();
				employee.setEmp_ID(resultSet.getString(2));
				employee.setName(resultSet.getString(3));
				employee.setAddress(resultSet.getString(4));
				employee.setPhone(resultSet.getString(5));
				employee.setNIC(resultSet.getString(6));
				employee.setPassword(resultSet.getString(7));
				
				arrayList.add(employee);
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
	public String generateReport(String empId, String root) {
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
			cos.newLineAtOffset(25, 750);

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
			cos.showText("Report Generated By : Institute Owner" );
			cos.newLine();
			cos.showText("----------------------------------------------------------------------------");
			cos.newLine();
			cos.newLine();
			cos.setFont(fontPlain, 12);
			cos.showText("Employee Details");
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
		cell = row.createCell(16, "Employee ID");
		cell.setFontSize(12);
		cell = row.createCell(25, "Employee Name");
		cell.setFontSize(12);
		cell = row.createCell(23, "Address");
		cell.setFontSize(12);
		cell = row.createCell(19, "Contact Number");
		cell.setFontSize(12);
		cell = row.createCell(17, "National ID");
		cell.setFontSize(12);
		
		EmployeeServices employeeServices = new EmployeeServicesImpl();
		ArrayList<Employee> employee = employeeServices.getEmployeeArrayList();
		
		for (int i = 0; i < employee.size(); i++) {
			Employee employees = employeeServices.getEmployee(employee.get(i).getEmp_ID());
			row = table.createRow(20);
			cell = row.createCell(16, employees.getEmp_ID());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(25, employees.getName());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(23, employees.getAddress());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(19, employees.getPhone());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
			cell = row.createCell(17, employees.getNIC());
			cell.setFontSize(12);
			cell.setTextColor(Color.GRAY);
		}
		try {
			table.draw();

			float tableHeight = table.getHeaderAndDataHeight();
			System.out.println("tableHeight = " + tableHeight);

			// close the content stream
						cos.close();
					
									filePath = root + File.separator + empId + ".pdf";

									document.save(filePath);
									System.out.println(filePath);
									document.close();
									
									//Final DEPLOYMENT ON SERVER
									filePath = "\\UploadedFiles\\PDF\\" + empId + ".pdf";
									
									//For Local Host
									/*
									 * 'LearningManagementSystem' name in the below link might change
									 * So, please sout AND print the -> filePath = root + File.separator + classroomId + ".pdf";
									 * Then see, where your file originally saved on pc
									 * */
									//filePath = "\\LearningManagementSystem\\UploadedFiles\\PDF\\" + classroomId + ".pdf";
									
									//For GitHub Deployment TESTING
									//filePath = "\\LearningManagementSystem-0.0.1-SNAPSHOT\\UploadedFiles\\PDF\\" + classroomId + ".pdf";
						
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return filePath;
	}

	

	
}
