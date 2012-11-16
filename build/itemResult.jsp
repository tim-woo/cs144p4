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


   </form>

</body>
</html>