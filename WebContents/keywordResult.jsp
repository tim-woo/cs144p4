<html>

<head>
    <script type="text/javascript">
        var xmlHttp;
    </script>
    <script type="text/javascript" src="./autosuggest.js"></script>
    <script type="text/javascript" src="./suggestions.js"></script>    
    <title>
        <%= request.getAttribute("title") %>
    </title>

</head>
<body>
	<form name="input" action="search" method="get" autocomplete="off">
	<%
	    String q = request.getParameter("q");
		out.println("Search: <input type=\"text\" id=\"queryTextBox\" name=\"q\" value=\"" + q +"\">");
	%>

	<input type="hidden" name="numResultsToSkip" value="0">
	<input type="hidden" name="numResultsToReturn" value="10">

	<input type="submit" value="Submit"></form><br>

    <b>Suggestion</b>: 
    <div id="suggestion" class="suggestions"></div>

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

    <script type="text/javascript">
            window.onload = function () {
                var oTextbox = new AutoSuggestControl(document.getElementById("queryTextBox"), new StateSuggestions());
            }
    </script>
   
</body>
</html>