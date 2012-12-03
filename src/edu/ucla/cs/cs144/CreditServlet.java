package edu.ucla.cs.cs144;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CreditServlet extends HttpServlet implements Servlet {
       
    public CreditServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	HttpSession session = request.getSession(true);
		String itemID = (String)session.getAttribute("itemID");

		if ((session.isNew()) || (itemID.equals(null)))
		{
			request.setAttribute("status", "1");
		}
		else 
		{
			request.setAttribute("status", "0");
			request.setAttribute("itemID", itemID);
			request.setAttribute("Name", session.getAttribute("Name"));
			request.setAttribute("Buy_Price", session.getAttribute("Buy_Price"));
		}

		request.getRequestDispatcher("/credit-card-input.jsp").forward(request, response);	
    }
}