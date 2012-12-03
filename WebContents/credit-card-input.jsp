<html>
<head></head>

<body>

<%
        if (request.getAttribute("itemID").equals("error"))
        {
            out.println("<p>Sorry, but there is no active session open.<p>");
            out.println("<p><a href=\"/eBay\">Go Back to eBay Home Page</a></p>");
        }
        else
        {
            out.println("<p>Item ID: " + request.getAttribute("itemID").toString() + "</p>");
            out.println("<p>ItemName: " + request.getAttribute("Name").toString() + "</p>");
            out.println("<p>Buy_Price: " + request.getAttribute("Buy_Price").toString() + "</p>");
            out.println("<form name=\"cc\" action=\"item\" method=\"post\" autocomplete=\"off\">");
            out.println("Credit Card: <input type=\"cc\" name=\"cc\">");
            out.println("<input type=\"submit\" value=\"Submit\"></form>");
        }
%>

</body>
</html>
