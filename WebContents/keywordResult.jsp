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
            // reset suggestions
            document.getElementById("suggestion").innerHTML = '';
           // 1. get the text response just so i can output it and see it -- delete later
            
            textResponse = xmlHttp.responseText;
            var para=document.createElement("p");
            var node=document.createTextNode(textResponse);
            para.appendChild(node);

            //document.getElementById("suggestion").appendChild(para);

            // 2. get the response back as XML like i'm suppose to -- trying to figure out how to get elements!
            var xmlDoc = xmlHttp.responseXML;

            var suggestions = xmlDoc.getElementsByTagName("suggestion");
            var numSuggestions = suggestions.length;

            for (var i=0; i<numSuggestions; i++)
            {
                var data = suggestions[i].getAttribute("data");

                var para2= document.createElement("p");
                var node2= document.createTextNode(data);
                para2.appendChild(node2);

                document.getElementById("suggestion").appendChild(para2);
            }
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

    <b>Suggestion</b>: <div id="suggestion"></div>

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