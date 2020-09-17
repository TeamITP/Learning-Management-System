package com.lms.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;

import com.lms.model.Certification;
import com.lms.model.Classroom;
import com.lms.model.Education;
import com.lms.model.Teacher;
import com.lms.model.Teacher_Experiance;
import com.lms.model.Teacher_Qualification;
import com.lms.util.ConnectDB;

/* 
 * @author Rathnayaka R.M.N.A
 * IT19139418
 * 
 * */
public  class Teacher_Managment_ServicesImple implements Teacher_Managment_Services {
	
	private static Connection connection;
	private static PreparedStatement preparedStatement;
	private static Statement statement;
	
	private static Connection con1 = null;
	private static Statement stmt1 = null;
	//private static ResultSet rs1= null;
	
	
	public int registerTeacher(Teacher teacher) {
		int status = 0;
		
		try {
			connection = ConnectDB.getDBConnection();
			
			String sql = "INSERT INTO Teacher(Name,title, Subject,Contact, Birthday,password) VALUES(?,  ?, ?, ?, ?, ?)";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, teacher.getName());
			//
			preparedStatement.setString(2, teacher.getTitle());
			preparedStatement.setString(3, teacher.getSubject());
			preparedStatement.setString(4,teacher.getContact());
			preparedStatement.setString(5, teacher.getBirthdate());
			preparedStatement.setString(6, teacher.getpw());
			
			
			
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

public static boolean insertContact(String name,String contact,String birthdate,String title,String subject) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		con1 = ConnectDB.getDBConnection();
			stmt1 = con1.createStatement();
    	    String sql = "insert into contact values (0,'"+0+"','"+name+"','"+contact+"','"+birthdate+"','"+title+"','"+subject+"')";
    		int rs = stmt1.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }

public Teacher getTeacher(String teacherId) {
	Teacher teacher = new Teacher();
	try {
		connection = ConnectDB.getDBConnection();
		
		String sql = "SELECT * FROM Teacher WHERE Teacher_ID = ?";
		
		preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setString(1, teacherId);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		while (resultSet.next()) {
			teacher.setName(resultSet.getString(3));
			teacher.setTitle(resultSet.getString(4));
			teacher.setSubject(resultSet.getString(5));
			teacher.setContact(resultSet.getString(6));
			teacher.setBirthdate(resultSet.getString(7));
			teacher.setpw(resultSet.getString(8));
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
	return teacher;
}
public Teacher CountTeacher() {
	Teacher teacher = new Teacher();
	try {
		connection = ConnectDB.getDBConnection();
		
		String sql = "SELECT COUNT( *) FROM Teacher ";
		
		preparedStatement = connection.prepareStatement(sql);
		
		//preparedStatement.setString(1, teacherId);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		while (resultSet.next()) {
			teacher.setcount(resultSet.getInt(1));
			
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
	return teacher;
}
public ArrayList<Teacher> getTeacherList(){
	ArrayList<Teacher> arrayList = new ArrayList<Teacher>();

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "SELECT * FROM Teacher ";

		preparedStatement = connection.prepareStatement(sql);

		//preparedStatement.setString(1, teacherId);

		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			Teacher tec = new Teacher();
			tec.setTeacherId(resultSet.getString(2));
			tec.setName(resultSet.getString(3));
			tec.setTitle(resultSet.getString(4));
			tec.setSubject(resultSet.getString(5));
			tec.setContact(resultSet.getString(6));
			tec.setBirthdate(resultSet.getString(7));
			tec.setpw(resultSet.getString(8));

			arrayList.add(tec);
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

public int addEdu(Education edu) {
	int status = 0;

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "INSERT INTO Teacher_Education(Teacher_Id,Education) VALUES(?, ?)";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, edu.getTeacherId());
		
		preparedStatement.setString(2, edu.getEducation());

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
public int addCer(Certification cer ) {
	int status = 0;

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "INSERT INTO Teacher_Certification(Teacher_Id,Certification) VALUES(?, ?)";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, cer.getTeacherId());
		
		preparedStatement.setString(2, cer.getCer());

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

public int addQue(Teacher_Qualification que){
	int status = 0;

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "INSERT INTO Other_qualification(Teacher_ID,Description) VALUES(?, ?)";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, que.getTeacher_id());
		
		preparedStatement.setString(2, que.getDescription());

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

public int addExp(Teacher_Experiance exp){
	int status = 0;

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "INSERT INTO Work_experience(Teacher_ID,Year,Description,Place,Place_Contact) VALUES(?, ?, ?, ?, ?)";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, exp.getTeacher_ID());
		preparedStatement.setString(2, exp.getYear());
		preparedStatement.setString(3, exp.getDescription());
		preparedStatement.setString(4, exp.getPlace());
		preparedStatement.setString(5, exp.getPlace_contact());

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

public ArrayList<Certification> getCertificationList(String teacherId){
	ArrayList<Certification> arrayList = new ArrayList<Certification>();

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "SELECT * FROM Teacher_Certification WHERE Teacher_Id = ?";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, teacherId);

		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			Certification cer = new Certification();
			cer.setCer(resultSet.getString(2));
			

			arrayList.add(cer);
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

public ArrayList<Education> getEducationList(String teacherId) {
	ArrayList<Education> arrayList = new ArrayList<Education>();

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "SELECT * FROM Teacher_Education WHERE Teacher_Id = ?";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, teacherId);

		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			Education edu = new Education();
			edu.setEducation(resultSet.getString(2));
			

			arrayList.add(edu);
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

public ArrayList<Teacher_Experiance> getTeacher_ExperianceList(String teacherId){
	ArrayList<Teacher_Experiance> arrayList = new ArrayList<Teacher_Experiance>();

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "SELECT * FROM Work_experience WHERE Teacher_Id = ?";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, teacherId);

		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			Teacher_Experiance exp = new Teacher_Experiance();
			exp.setYear(resultSet.getString(2));
			exp.setDescription(resultSet.getString(3));
			exp.setPlace(resultSet.getString(4));
			exp.setPlace_contact(resultSet.getString(5));

			arrayList.add(exp);
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

public ArrayList<Teacher_Qualification> getTeacher_QualificationList(String teacherId) {
	ArrayList<Teacher_Qualification> arrayList = new ArrayList<Teacher_Qualification>();

	try {
		connection = ConnectDB.getDBConnection();

		String sql = "SELECT * FROM Other_qualification WHERE Teacher_Id = ?";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, teacherId);

		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			Teacher_Qualification que = new Teacher_Qualification();
			que.setDescription(resultSet.getString(2));
			

			arrayList.add(que);
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
public int deleteTeacher(String teacherId) {
	int status = 0;
	try {
		connection = ConnectDB.getDBConnection();

		String sql = "DELETE FROM Teacher WHERE Teacher_ID = ?";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, teacherId);

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
public int deleteTeacher1(String teacherId) {
	int status = 0;
	try {
		connection = ConnectDB.getDBConnection();

		String sql = "DELETE FROM Teacher WHERE Teacher_ID = ?";

		preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, teacherId);

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
public int updateTeacher(Teacher teacher) {
	int status = 0;
	try {
		connection = ConnectDB.getDBConnection();

		
		String sql = "UPDATE Teacher SET Name = ?, title = ?, Subject = ?, Contact = ?, Birthday = ?, password = ? WHERE Teacher_ID = ?";
		preparedStatement = connection.prepareStatement(sql);
		//System.out.println(teacher.getpw());

		preparedStatement.setString(1, teacher.getName());
		preparedStatement.setString(2, teacher.getTitle());
		preparedStatement.setString(3, teacher.getSubject());
		preparedStatement.setString(4,teacher.getContact());
		preparedStatement.setString(5, teacher.getBirthdate());
		preparedStatement.setString(6, teacher.getpw());
		preparedStatement.setString(7, teacher.getTeacherId());
		
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
public int updateTeacherEducation( Education education) {
	int status = 0;
	try {
		connection = ConnectDB.getDBConnection();

		
		String sql = "UPDATE Teacher_Education SET Education= ? WHERE Teacher_Id = ? AND Education= ?";
		preparedStatement = connection.prepareStatement(sql);
		//System.out.println(teacher.getpw());

		preparedStatement.setString(1, education.getEducation());
		preparedStatement.setString(2,education.getTeacherId());
		
		
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
