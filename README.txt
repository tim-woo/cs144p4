Project 4a+b

Partner 1: Timothy Woo sid: 903 781 788
Partner 2: Rachel Baldovino sid: 503 812 659

In this part we are using JSP and Java servlets. The java servlet intercepts
the GET request from the form, processes the request, and then redirects
the request along with any added attributes to the JSP page. The JSP page
is just like an HTML page except we are able to write snippets of java code
inside of it.

In part 4a we made two pages that help you access the eBay data. One page
lets you search by keyword. It uses a web service to do the basic search
on your keyword and then returns the results to you in a custom SearchResult
class. This is done in the servlet. Next those results get passed onto
the JSP page for display. The itemID search page is done similarly. The
difference is that itemID search fetches XML data from the web service which
then needs to get parsed and displayed. We parsed the XML inside of the servlet
and then passed this information over to the JSP page to display it.

In part 4b we added Google Maps and a suggestion query box.