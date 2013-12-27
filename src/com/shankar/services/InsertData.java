package com.shankar.services;

import java.sql.Statement;

import com.mysql.jdbc.Connection;

public class InsertData {
	
	//BusInfo businfo = new BusInfo();
	//RouteInfo routeinfo = new RouteInfo();
	DbConnector dbc = new DbConnector();
	Connection con = null;
	
	public void InsertBusData(BusInfo businfo){
		System.out.println("Now I get the input from Admin Controller.");
		int busno = businfo.getBusno();
		int routeno = businfo.getRouteno();
		String busname = businfo.getBusname();
		String bustype = businfo.getBustype();
		int fare = businfo.getFare();
		int totalseats = businfo.getTotalseats();
		
		
		
		try{
			con = dbc.CreateConnection();
			System.out.println("I connect to databse in Insert Data Class");
			String busQuery = "insert into bus values('" + busno + "','" + routeno + "','" + busname + "','" + bustype + "','" + fare + "','" + totalseats + "')";
			
			Statement st = con.createStatement();
			st.executeUpdate(busQuery);
			
			System.out.println("I execute bus data insert operation");
			st.close();
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void InsertRouteData(RouteInfo routeinfo){
		System.out.println("Now I get the input from Admin Controller.");
		
		//int rid = routeinfo.getRid();
		String from = routeinfo.getFrom();
		String to = routeinfo.getTo();
		String deptime = routeinfo.getDeptime();
		String arvtime = routeinfo.getArvtime();
		int distance = routeinfo.getDistance();
		
		try{
			con = dbc.CreateConnection();
			System.out.println("I connect to databse in Insert Data Class");
			
			String routeQuery = "insert into route (bata,samma,dep_time,arrv_time,distance) values('" + from + "','" + to + "','" + deptime + "','" + arvtime + "','" + distance + "')";
			
			Statement st = con.createStatement();
			st.executeUpdate(routeQuery);
			
			System.out.println("I execute route insert operation");
			st.close();
				
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
}
