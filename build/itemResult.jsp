<html>
<head>
    <title><%= request.getAttribute("title") %></title>
</head>
<body>
	<form name="input" action="item" method="get">

	<%
	    String q = request.getParameter("itemID");
		out.println("Looked up Item ID: <input type=\"text\" name=\"itemID\" value=\"" + q +"\">");
	%>

	<input type="submit" value="Submit"><br>
   
   <br><br>

   <%
        out.println(request.getAttribute("xml"));

   %>
   <br>
   <br>
   <p>Name: <%= request.getAttribute("name")%></p>
  <p> Description: <%= request.getAttribute("Description")%></p>
   <p>Seller: <%= request.getAttribute("SellerID")%></p>
  <p>Seller Rating: <%= request.getAttribute("SellerRating")%></p>

   <p>Started: <%= request.getAttribute("Started")%></p>
   <p>Ends: <%= request.getAttribute("Ends")%></p>

   </form>

</body>
</html>