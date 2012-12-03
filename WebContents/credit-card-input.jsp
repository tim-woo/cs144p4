<html>
<head></head>

<body>

<%
        if (request.getAttribute("status").equals("1"))
        {
            out.println("<p>Sorry, but there is no active session open.<p>");
            out.println("<p><a href=\"/eBay\">Go Back to eBay Home Page</a></p>");
        }
        else
        {
            out.println("<p>Item ID: " + request.getAttribute("itemID").toString() + "</p>");
            out.println("<p>ItemName: " + request.getAttribute("Name").toString() + "</p>");
            out.println("<p>Buy_Price: " + request.getAttribute("Buy_Price").toString() + "</p>");
            out.println("<form name=\"cc\" action=\"https://" + request.getServerName() + ":8443" + request.getContextPath());
            out.println("/confirmation" + "\" method=\"POST\" autocomplete=\"off\">");
            out.println("Credit Card: <input type=\"text\" name=\"CC\">");
            out.println("<input type=\"submit\" value=\"Submit\"></form>");
        }
%>

</body>
</html>
