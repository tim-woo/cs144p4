package edu.ucla.cs.cs144;

import java.io.IOException;
import java.net.HttpURLConnection;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ProxyServlet extends HttpServlet implements Servlet {
       
    public ProxyServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        // your codes here

		response.setContentType("text/xml");
		PrintWriter out = response.getWriter();
		try
		{
			String query = request.getParameter("q");
			query = URLEncoder.encode(query, "UTF-8");
			String myUrl = "http://google.com/complete/search?output=toolbar&q=";
			myUrl += query;
			out.println(myUrl);

			String results = doHttpUrlConnectionAction(myUrl);
			out.println(results);
		}
		catch (Exception e)
		{
		}
    }

    private String doHttpUrlConnectionAction(String desiredUrl)
	throws Exception
	{
	URL url = null;
	BufferedReader reader = null;
	StringBuilder stringBuilder;

	try
	{
	  // create the HttpURLConnection
	  url = new URL(desiredUrl);
	  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	  
	  // just want to do an HTTP GET here
	  connection.setRequestMethod("GET");
	  
	  // uncomment this if you want to write output to this url
	  //connection.setDoOutput(true);
	  
	  // give it 15 seconds to respond
	  connection.setReadTimeout(15*1000);
	  connection.connect();

	  // read the output from the server
	  reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	  stringBuilder = new StringBuilder();

	  String line = null;
	  while ((line = reader.readLine()) != null)
	  {
	    stringBuilder.append(line + "\n");
	  }
	  return stringBuilder.toString();
	}
	catch (Exception e)
	{
	  e.printStackTrace();
	  throw e;
	}
	finally
	{
	  // close the reader; this can throw an exception too, so
	  // wrap it in another try/catch block.
	  if (reader != null)
	  {
	    try
	    {
	      reader.close();
	    }
	    catch (IOException ioe)
	    {
	      ioe.printStackTrace();
	    }
	  }
	}
	}
}
