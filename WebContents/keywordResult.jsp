<html>
<head>
    <title><%= request.getAttribute("title") %></title>

    <script type="text/javascript">

        var xmlHttp;

        function sendAjaxRequest(input)
        {
            // document.body.innerHTML = "hello friend";
          xmlHttp = new XMLHttpRequest(); // works only for Firefox, Safari, ...

          // set the server response handler
          xmlHttp.onreadystatechange = showSuggestion;

          // send the request to the server
          xmlHttp.open("GET", "./suggest");
          xmlHttp.send(null);
        }

        function showSuggestion() 
        {
          if (xmlHttp.readyState == 4) {
            response = xmlHttp.responseText;
            // response = response.replace(/</g, "&lt;");
            // response = response.replace(/>/g, "&gt;");
            var para=document.createElement("p");
            var node=document.createTextNode(response);
            para.appendChild(node);

            document.getElementById("suggestion").appendChild(para);
          }
        }

    </script>


</head>
<body>
	<form name="input" action="search" method="get">
	<%
	    String q = request.getParameter("q");
		out.println("Search: <input onKeyUp='sendAjaxRequest(this.value);' type=\"text\" name=\"q\" value=\"" + q +"\">");
	%>
    <b>Suggestion</b>: <p id="suggestion"></p>

	<input type="hidden" name="numResultsToSkip" value="0">
	<input type="hidden" name="numResultsToReturn" value="10">

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
    String total = request.getAttribute("total").toString();

    if (skipNum>0) {
    	out.println("<a href=\"/eBay/search?q=" + q + "&numResultsToSkip=" + prevNum + "&numResultsToReturn=" + showNum + "\">Previous</a>");
	}
    if (total.equals("10"))
    {
        out.println("<a href=\"/eBay/search?q=" + q + "&numResultsToSkip=" + nextNum + "&numResultsToReturn=" + showNum + "\">Next</a>");
   	}
    %>
   
</body>
</html>