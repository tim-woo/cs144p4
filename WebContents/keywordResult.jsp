<html>

<head>
    <script type="text/javascript">
        var xmlHttp;
    </script>
    <script type="text/javascript" src="./dropdown.js"></script>
    <script type="text/javascript" src="./suggestions.js"></script> 
    <link rel="stylesheet" type="text/css" href="./autosuggest.css" />       
    <title>
        <%= request.getAttribute("title") %>
    </title>
    <meta name="viewport" content="width=400" />
</head>
<body>
	<form name="input" action="search" method="get" autocomplete="off">
	<%
	    String q = request.getParameter("q");
		out.println("Search: <input type=\"text\" id=\"queryTextBox\" name=\"q\" value=\"" + q +"\">");
	%>

	<input type="hidden" name="numResultsToSkip" value="0">
	<input type="hidden" name="numResultsToReturn" value="10">
	<input type="submit" value="Submit"></form>

    <div id="suggestion" class="suggestions"></div>

    <%
    String total = request.getAttribute("total").toString();
    if (total.equals("0")) {
        out.println("No results. Try another search.");
    }
    else {
    %>
        <h5>Showing <%= request.getAttribute("total") %> results.</h5>
        <%= request.getAttribute("result") %>
        <br><br>

    <% 
    }

    String skip = request.getParameter("numResultsToSkip");
    String show = request.getParameter("numResultsToReturn");
    Integer skipNum = Integer.parseInt(skip);
    Integer showNum = Integer.parseInt(show);
    Integer nextNum = skipNum + showNum;
    Integer prevNum = skipNum - showNum;

    if (skipNum>0) {
    	out.println("<a href=\"/eBay/search?q=" + q + "&numResultsToSkip=" + prevNum + "&numResultsToReturn=" + showNum + "\">Previous</a>");
	}
    if (total.equals("10"))
    {
        out.println("<a href=\"/eBay/search?q=" + q + "&numResultsToSkip=" + nextNum + "&numResultsToReturn=" + showNum + "\">Next</a>");
   	}
    %>

    <p><a href="/eBay/item">Go to ItemID Search</a></p>

    <script type="text/javascript">
            window.onload = function () {
                var oTextbox = new AutoSuggestControl(document.getElementById("queryTextBox"), new StateSuggestions());
            }
    </script>
   
</body>
</html>