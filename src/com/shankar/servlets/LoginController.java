package com.shankar.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shankar.services.LoginValidate;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset= UTF-8");
		PrintWriter out = response.getWriter();
		
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		
		LoginValidate lv = new LoginValidate();
		
		if(lv.Valid(un,pw)){
			
			RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
			rd.forward(request, response);
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
			
			out.println("<font color='red'><h3>You have entered Incorrect ID or Password</h3></font>");
		}
	}

}
