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
	</form>

	<p><b>Name</b>: <%= request.getAttribute("name")%></p>
	<p><b>Description</b>: <%= request.getAttribute("Description")%></p>
	<p><b>Seller</b>: <%= request.getAttribute("SellerID")%></p>
	<p><b>Seller Rating</b>: <%= request.getAttribute("SellerRating")%></p>
	<p><b>Started</b>: <%= request.getAttribute("Started")%></p>
	<p><b>Ends</b>: <%= request.getAttribute("Ends")%></p>
	<p><b>Bids</b>: <%= request.getAttribute("Bids")%></p>
	<p><b>Categories</b>: <%= request.getAttribute("Categories")%></p>
	<p><b>Currently</b>: <%= request.getAttribute("Currently")%></p>
	<p><b>FirstBid</b>: <%= request.getAttribute("First_Bid")%></p>
	<p><b>Number of Bids</b>: <%= request.getAttribute("Number_of_Bids")%></p>
	<p><b>Categories</b>: <%= request.getAttribute("Categories")%></p>
	<p><b>Location</b>: <%= request.getAttribute("Location")%></p>
	<p><b>Country</b>: <%= request.getAttribute("Country")%></p>

</body>
</html>