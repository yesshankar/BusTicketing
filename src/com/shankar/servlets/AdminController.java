package com.shankar.servlets;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shankar.services.BusInfo;
import com.shankar.services.InsertData;
import com.shankar.services.RouteInfo;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String check = request.getParameter("check");

		response.setContentType("text/html; charset=UTF-8");
		//PrintWriter out = response.getWriter();
		
		if(check.equals("bus")){
			
			BusInfo businfo = new BusInfo();
			InsertData insd = new InsertData();
			
			int busno = Integer.parseInt(request.getParameter("busno"));
			int routeno = Integer.parseInt(request.getParameter("route"));
			String busname = request.getParameter("busname");
			String bustype = request.getParameter("bustype");
			int fare = Integer.parseInt(request.getParameter("fare"));
			int totalseats = Integer.parseInt(request.getParameter("totalseats"));
			
			businfo.setBusno(busno);
			businfo.setRouteno(routeno);
			businfo.setBusname(busname);
			businfo.setBustype(bustype);
			businfo.setFare(fare);
			businfo.setTotalseats(totalseats);
			
			insd.InsertBusData(businfo);
			
			System.out.println("I returned after inserting data");
			request.setAttribute("busSuccessMsg", "Your Bus Data is Added Successfully.");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin.jsp");
			rd.forward(request, response);	
			System.out.println("I dispatch the request to Admin page.");
			
		}else{
			
			InsertData insd = new InsertData();

			RouteInfo routeinfo = new RouteInfo();
			
			//int rid = Integer.parseInt(request.getParameter("rno"));
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			String deptime = request.getParameter("deptime");
			String arvtime = request.getParameter("arvtime");
			int distance = Integer.parseInt(request.getParameter("distance"));
			
			//routeinfo.setRid(rid);
			routeinfo.setFrom(from);
			routeinfo.setTo(to);
			routeinfo.setDeptime(deptime);
			routeinfo.setArvtime(arvtime);
			routeinfo.setDistance(distance);
			
			System.out.println("Now I am calling Insert Bus Data Method of InsertData Class");
			
			insd.InsertRouteData(routeinfo);
			
			System.out.println("I returned after inserting data");
			request.setAttribute("successMsg", "Your Route Data is Added Successfully.");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Admin.jsp");
			rd.forward(request, response);	
			System.out.println("I dispatch the request to Admin page.");
			//out.println("<h3>Your Route Data is Added Successfully.");
		}

	}
	
	//public void addRoute(request, response); 
	
	//public void addBus(req, resp)
	
	

}
