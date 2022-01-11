package com.Event_System.Helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection() {
		try {
			if (con == null) {
				
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_system", "root", "root");
				System.out.println(con);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Not Connected");
		}

		return con;
	}
}
