<html>
<head></head>

<body>

<%
        if (request.getAttribute("status").equals("error"))
        {
            out.println("<p>Sorry, but there is no active session open.<p>");
            out.println("<p><a href=\"/eBay\">Go Back to eBay Home Page</a></p>");
        }
        else if (request.getAttribute("status").equals("insecure"))
        {
            out.println("<p>Sorry, but your connection is insecure.<p>");
            out.println("<p><a href=\"/eBay\">Go Back to eBay Home Page</a></p>");
        }
        else
        {
            out.println("<p>Item ID: " + request.getAttribute("itemID").toString() + "</p>");
            out.println("<p>ItemName: " + request.getAttribute("Name").toString() + "</p>");
            out.println("<p>Buy_Price: " + request.getAttribute("Buy_Price").toString() + "</p>");
            out.println("Credit Card: " + request.getAttribute("CC").toString() + "</p>");
        }
%>

</body>
</html>
