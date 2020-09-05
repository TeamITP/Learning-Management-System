package com.lms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*Create database connection
 *In this project we use MySql Database*/

public class ConnectDB {

	private static Connection connection;

	public ConnectDB() {
		super();
		// TODO Auto-generated constructor stub
	}

	/*
	 * Database is created using the given URL, userName and password which is
	 * included in config.properties This will return Connection type object
	 * ClassNotFoundException and SQLException is included
	 */

	public static Connection getDBConnection() {
		/* Create new Connection when the connection is closed or Null */
		try {
			if (connection == null || connection.isClosed()) {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			    connection = DriverManager.getConnection("jdbc:sqlserver://yrazure.database.windows.net:1433;database=IT_Project;user=admin2020@yrazure;password=admin@2020;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
					}
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		if(connection == null) {
			System.out.println("Connection is null");
		}
		return connection;
	}
}
