package edu.ucla.cs.cs144;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;


public class ConfirmServlet extends HttpServlet implements Servlet {
       
    public ConfirmServlet() {}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
		PrintWriter out = response.getWriter();
      	out.println("Where'd you come from? You've reached a deadend.");
     }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	HttpSession session = request.getSession(true);
		String itemID = (String)session.getAttribute("itemID");

		if (session.isNew() || (itemID == null))
		{
			request.setAttribute("status", "inactive");
		}
		else 
		{
			if (request.isSecure())
			{
				request.setAttribute("status", "true");
				request.setAttribute("itemID", itemID);
				request.setAttribute("Name", session.getAttribute("Name"));
				request.setAttribute("Buy_Price", session.getAttribute("Buy_Price"));
				request.setAttribute("CC", request.getParameter("CC"));				
			}
			else
			{
				request.setAttribute("status", "insecure");
			}

		}

		request.getRequestDispatcher("/confirmation.jsp").forward(request, response);	
    }
}