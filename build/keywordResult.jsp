<html>
<head>
    <title><%= request.getAttribute("title") %></title>
</head>
<body>
	<form name="input" action="search" method="get">
	<%
	    String q = request.getParameter("q");
		out.println("Search: <input type=\"text\" name=\"q\" value=\"" + q +"\">");
	%>

	<input type="hidden" name="numResultsToSkip" value="0">
	<input type="hidden" name="numResultsToReturn" value="30">

	<input type="submit" value="Submit"><br>

    <h5>Showing <%= request.getAttribute("total") %> results.</h5>

    <%= request.getAttribute("result")  %>
    <br><br>
		    
    <%
    String skip = request.getParameter("numResultsToSkip");
    String show = request.getParameter("numResultsToReturn");
    Integer skipNum = Integer.parseInt(skip);
    Integer showNum = Integer.parseInt(show);
    Integer nextNum = skipNum + showNum;
    Integer prevNum = skipNum - showNum;

    if (skipNum>0) {
    	out.println("<a href=\"/eBay/search?q=" + q + "&numResultsToSkip=" + prevNum + "&numResultsToReturn=" + showNum + "\">Previous</a>");
	}
    out.println("<a href=\"/eBay/search?q=" + q + "&numResultsToSkip=" + nextNum + "&numResultsToReturn=" + showNum + "\">Next</a>");
   	%>
   
</body>
</html>