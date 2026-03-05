package com.registereduser;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static String url="jdbc:mysql://localhost:3306/hotelreservation";
	private static String user="root";
	private static String pass="diLLmHotel";
	
	private static Connection con;
	
	public static Connection getConnection () {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url, user, pass);
		}
		catch(Exception e) {
			System.out.println("Database is not connected");
		}
		return con;
	}

}
