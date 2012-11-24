<html>
<head>
    <title><%= request.getAttribute("title") %></title>

    <script type="text/javascript">

        var xmlHttp;

        function sendAjaxRequest(input)
        {
          xmlHttp = new XMLHttpRequest(); // works only for Firefox, Safari, ...

          // set the server response handler
          xmlHttp.onreadystatechange = showSuggestion;

          // send the request to the server
          var url = "./suggest?q=" + input;
          xmlHttp.open("GET", url);
          xmlHttp.send(null);
        }

        function showSuggestion() 
        {
          if (xmlHttp.readyState == 4) {
            // 1. get the text response just so i can output it and see it -- delete later
            textResponse = xmlHttp.responseText;
            var para=document.createElement("p");
            var node=document.createTextNode(textResponse);
            para.appendChild(node);

            document.getElementById("suggestion").appendChild(para);

            // 2. get the response back as XML like i'm suppose to -- trying to figure out how to get elements!
            xmlDoc = xmlHttp.responseXML;
            x=xmlDoc.documentElement.childNodes[0].childNodes[0].nodeName;

            // x = doc.getElementsByTagName("CompleteSuggestion")[0];
            // y = x.childNodes[0];

            // document.getElementById("suggestion").innerHTML = response;
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

	<input type="hidden" name="numResultsToSkip" value="0">
	<input type="hidden" name="numResultsToReturn" value="10">

	<input type="submit" value="Submit"></form><br>

    <b>Suggestion</b>: <p id="suggestion"></p>

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