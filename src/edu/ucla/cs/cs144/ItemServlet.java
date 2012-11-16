package edu.ucla.cs.cs144;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.text.*;
import java.util.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.FactoryConfigurationError;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import org.w3c.dom.Text;
import org.w3c.dom.Attr;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;


public class ItemServlet extends HttpServlet implements Servlet {
       
    public ItemServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	String pageTitle = "My Item Servlet";
	    request.setAttribute("title", pageTitle);

    	String query = request.getQueryString();
  		if (query != null) 
  		{
        String itemID = request.getParameter("itemID");
        if(itemID == null) itemID = "";

  			request.setAttribute("itemID", itemID);

  	    AuctionSearchClient sc = new AuctionSearchClient();
  	    String result = sc.getXMLDataForItemId(itemID);
  	    request.setAttribute("xml", result);

  			Document doc = null;
  			Element root = null;
  			DocumentBuilder builder = null;
  		   
  		   /* if (result.isEmpty())
  		    {
  		    	request.setAttribute("total", 0);
  		    }
  	    	else 
  	    	{
  	    		request.setAttribute("total", 1);
  	    		
  	    		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
  	    		try {
          			builder = factory.newDocumentBuilder();
          		}
          		catch (ParserConfigurationException e)
          		{
          			e.printStackTrace();
  					System.exit(3);
          		}

          		InputSource is = new InputSource(new StringReader(result));

  				try {
  					doc = builder.parse(is);
  				}
  				catch (IOException e) {
  					e.printStackTrace();
  					System.exit(3);
  				}
  				catch (SAXException e) {
  					e.printStackTrace();
  					System.exit(3);
  				}

  				String categories = "";
  				//try 
  				//{
  					root = doc.getDocumentElement();

  					Node child = root.getFirstChild();
         				while (child != null) 
         				{
             				if (child instanceof Element && child.getNodeName().equals("Name"))
             				{
             					request.setAttribute("name", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Name"))
             				{
             					if (categories.isEmpty())
             					{
             						categories += ", ";
             					}
             					categories += child.getNodeValue();
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Currently"))
             				{
             					request.setAttribute("currently", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("First_Bid"))
             				{
             					request.setAttribute("first", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Number_of_Bids"))
             				{
             					request.setAttribute("numBids", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Bids"))
             				{
             					//request.setAttribute("numBids", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Location"))
             				{
             					request.setAttribute("location", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Country"))
             				{
             					request.setAttribute("country", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Started"))
             				{
             					request.setAttribute("started", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Ends"))
             				{
             					request.setAttribute("ends", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Seller"))
             				{
             					//request.setAttribute("started", child.getNodeValue());
             				}
             				else if (child instanceof Element && child.getNodeName().equals("Description"))
             				{
             					request.setAttribute("description", child.getNodeValue());
             				}

  		            	child = child.getNextSibling();
          			}
          			//request.setAttribute("category", categories);
  				//}

          	}*/
  		    request.getRequestDispatcher("/itemResult.jsp").forward(request, response);

      	}
      	else {
  		    request.getRequestDispatcher("/getItem.html").forward(request, response);
      	}

        // your codes here
    }
}

