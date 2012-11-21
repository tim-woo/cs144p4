package edu.ucla.cs.cs144;

import java.io.IOException;
import java.net.HttpURLConnection;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ProxyServlet extends HttpServlet implements Servlet {
       
    public ProxyServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // your codes here

    	// response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    // out.println("<html>");
    // out.println("<head>");
    // out.println("<title>Hola</title>");
    // out.println("</head>");
    // out.println("<body bgcolor=\"white\">");
    // out.println("</body>");
    // out.println("</html>");

    	out.println("helloworld");

  //       String query = request.getQueryString();
  // 		if (query != null) 
  // 		{
  // 			String search = request.getParameter("q");

  // 		}

  		// response. = "helloworld";
    }
}
