package com.shankar.services;

import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.Connection;

public class LoginValidate {
	
	boolean result;
	
	public boolean Valid(String un, String pw){
		
		DbConnector dbc = new DbConnector();
		Connection con= null;
		
		
		try{
			
			con = (Connection) dbc.CreateConnection();
			
			String strQuery = "select * from admin where Username='" + un + "' and Password='" + pw + "'";
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(strQuery);
			
			if(rs.next())
			{
				result = true;
			}
			else{
				result = false;
			}
			
			st.close();
			rs.close();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	

}
