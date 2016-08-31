package com.vimal.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	static Connection connection = null;

	public static Connection getDBConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
			System.out.println("Connection Ok");
		} catch (Exception e) {
			System.out.println("Connection Failed "+e);
		}
		return connection;
	}
	
	public static void main(String[] args) {
		getDBConnection();
	}
}
