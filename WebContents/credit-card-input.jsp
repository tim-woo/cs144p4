<html>
<head></head>

<body>

<%
        String itemID = request.getAttribute("itemID").toString();
        if (itemID == "error")
        {
            out.println("<p>Sorry, but there is no active session open.<p>");
            out.println("<p><a href=\"/eBay\">Go Back to eBay Home Page</a></p>");
        }
        else
        {
            out.println("<p>Item ID: " + itemID + "</p>");
            out.println("<p>ItemName: " + request.getAttribute("Name").toString() + "</p>");
            out.println("<p>Buy_Price: " + request.getAttribute("Buy_Price").toString() + "</p>");
        }
%>

</body>
</html>
