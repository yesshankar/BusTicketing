package com.shankar.services;

public class BusInfo {
	private int busno;
	private int routeno;
	private String busname;
	private String bustype;
	private int fare;
	private int totalseats;
	
	public int getBusno() {
		return busno;
	}
	public void setBusno(int busno) {
		this.busno = busno;
	}
	public int getRouteno() {
		return routeno;
	}
	public void setRouteno(int routeno) {
		this.routeno = routeno;
	}
	public String getBusname() {
		return busname;
	}
	public void setBusname(String busname) {
		this.busname = busname;
	}
	public String getBustype() {
		return bustype;
	}
	public void setBustype(String bustype) {
		this.bustype = bustype;
	}
	public int getFare(){
		return fare;
	}
	public void setFare(int fare){
		this.fare = fare;
	}
	public int getTotalseats() {
		return totalseats;
	}
	public void setTotalseats(int totalseats) {
		this.totalseats = totalseats;
	}
	
	

}
