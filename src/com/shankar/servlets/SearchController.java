package com.shankar.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shankar.services.Search;
import com.shankar.services.SearchResult;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String date = request.getParameter("date");
		
		Search search = new Search();
		List<SearchResult> list = new ArrayList<SearchResult>();
		list = search.findQuery(from, to, date);
		
		if(list.size() == 0){
			request.setAttribute("notFoundMsg", "Sorry!!! No schedules found on the given route.");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		else{
			request.setAttribute("result", list);
			request.setAttribute("from", from);
			request.setAttribute("to",to);
			request.setAttribute("date",date);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
	}

}
