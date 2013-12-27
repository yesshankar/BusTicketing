package com.shankar.services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;

public class Search {
	
	public int rid;
	
	List<SearchResult> list = new ArrayList<SearchResult>();
	
	
	DbConnector dbc = new DbConnector();
	Connection con = null;
	
	public List<SearchResult> findQuery(String from, String  to, String date){
		
		try{
			con = dbc.CreateConnection();
			
			String routeQuery = "select R_id from route where bata='" + from + "' and samma='" + to + "'";
			
			Statement st = con.createStatement();
			ResultSet rsRoute = st.executeQuery(routeQuery);
			
			if(rsRoute.next()){
				rid = rsRoute.getInt("R_id");
				System.out.println("rid = " + rid);
			}
			String scheduleQuery = "select * from schedule where route='" + rid + "'";
			ResultSet rsSchedule = st.executeQuery(scheduleQuery);
			
			if(rsSchedule.next()){
				System.out.println("Yes ther is rsSchedule");
				String busQuery = "select * from bus where routeno='" + rid + "'";
				ResultSet rsBus = st.executeQuery(busQuery);
				while(rsBus.next())
				{
					SearchResult sr = new SearchResult();
					
					sr.setBusName(rsBus.getString("busname"));
					System.out.println(rsBus.getString("busname"));
					sr.setBusType(rsBus.getString("bustype"));
					System.out.println(rsBus.getString("bustype"));
					sr.setFare(rsBus.getString("fare"));
					System.out.println(rsBus.getString("fare"));
					
					list.add(sr);
				}
				rsBus.close();
			}
			
			rsRoute.close();
			rsSchedule.close();
			st.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println(list.size());
		
		for(int i = 0; i < (list.size()); i++){
			SearchResult sr = list.get(i);
			System.out.println(sr.getBusName());
			System.out.println(sr.getBusType());
			System.out.println(sr.getFare());
		}
		
		return list;
	}
	
	

}
