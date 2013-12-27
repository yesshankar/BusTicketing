package com.shankar.services;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class DbConnector {
	
	String driver = "com.mysql.jdbc.Driver";
	String name = "root";
	String password = null;
	String url = "jdbc:mysql://localhost:3306/busticketing";
	Connection con;
	
	public Connection CreateConnection(){
		
		try{
			
			Class.forName(driver);
			System.out.println("This is called");
			con = (Connection) DriverManager.getConnection(url,name,password);
			System.out.println("The database is connected");
			
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}

}
