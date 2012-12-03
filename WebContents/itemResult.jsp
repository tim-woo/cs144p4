<html>
<head>
    <title><%= request.getAttribute("title") %></title>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>

	<script type="text/javascript">
		function initialize() {
			var geocoder = new google.maps.Geocoder(); 
			var latlng = new google.maps.LatLng(34.063509,-118.44541); 
			var myOptions = { 
				zoom: 8, // default is 8  
				center: latlng, 
				mapTypeId: google.maps.MapTypeId.ROADMAP 
			}; 
			var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions); 
		}
	</script>

	<script type="text/javascript">
      var markers = new Array();
      var firstLoc;

      function myGeocodeFirst() {   
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode( {'address': document.getElementById("text_address").value },
          	function(results, status) {
	            if (status == google.maps.GeocoderStatus.OK) {
	              	firstLoc = results[0].geometry.location;
	              	var myOptions = { 
						zoom: 8, // default is 8  
						center: firstLoc, 
						mapTypeId: google.maps.MapTypeId.ROADMAP 
					}; 
					var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);    
	            } 
	            else {
		            document.getElementById("map_canvas").style.display = "none"; 	            		
	            }
          	}
        ); }
	</script> 

</head>

<body onload="myGeocodeFirst()">
	<form name="input" action="item" method="get" autocomplete="off">
	<%
	    String q = request.getParameter("itemID");
		out.println("Looked up Item ID: <input type=\"text\" name=\"itemID\" value=\"" + q +"\">");
		out.println("<input type=\"hidden\" id=\"text_address\" value=\"\">");

	%>
	<input type="submit" value="Submit"><br>
	</form>

	<style type="text/css"> 
		html { height: 100% } 
		body { height: 100%; margin: 0px; padding: 0px } 
		#map_canvas { height: 100% } 
	</style> 

	<%
		String result = request.getAttribute("total").toString();
		String id = request.getParameter("itemID").toString();

		if (result.equals("1"))
		{
			out.println("<p><b>Name</b>: " + request.getAttribute("name") + "</p>");
			out.println("<p><b>Description</b>: " + request.getAttribute("Description") + "</p>");
			out.println("<p><b>Seller</b>: " + request.getAttribute("SellerID") + "</p>");
			out.println("<p><b>Seller Rating</b>: " + request.getAttribute("SellerRating") + "</p>");
			if (request.getAttribute("Buy_Now_Option").equals("TRUE"))
			{
				out.println("<p><b>Buy It Now Price</b>: " + request.getAttribute("Buy_Price") + "<br>");
				session.setAttribute("itemID", id);
				session.setAttribute("Name", request.getAttribute("name"));
				session.setAttribute("Buy_Price", request.getAttribute("Buy_Price"));
				out.println("<a href=\"/eBay/credit-card-input\">Pay Now</a></p>");
			}
			out.println("<p><b>Started</b>: " + request.getAttribute("Started") + "</p>");
			out.println("<p><b>Ends</b>: " + request.getAttribute("Ends") + "</p>");
			out.println("<p><b>Currently</b>: " + request.getAttribute("Currently") + "</p>");
			out.println("<p><b>Number of Bids</b>: " + request.getAttribute("Number_of_Bids") + "</p>");
			out.println("<p><b>Bids</b>: " + request.getAttribute("Bids") + "</p>");
			out.println("<p><b>FirstBid</b>: " + request.getAttribute("First_Bid") + "</p>");
			out.println("<p><b>Categories</b>: " + request.getAttribute("Categories") + "</p>");
			out.println("<p><b>Location</b>: " + request.getAttribute("Location") + "</p>");
			out.println("<p><b>Country</b>: " + request.getAttribute("Country") + "</p>");

			String addr = request.getAttribute("Location").toString() + ", " + request.getAttribute("Country").toString();
			out.println("<script> document.getElementById(\"text_address\").value=\"" + addr + "\"; </script>");
		}
		else {
			out.println("<p>Sorry, no item was found with that ID</p>");
	}
	%>

	<div id="map_canvas" style="width:500px; height:500px;"></div> 

	<p><a href="/eBay/search">Go to Search</a></p>
</body>
</html>