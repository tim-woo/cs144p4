
/**
 * Provides suggestions for state names (USA).
 * @class
 * @scope public
 */
function StateSuggestions() {

}

/**
 * Request suggestions for the given autosuggest control. 
 * @scope protected
 * @param oAutoSuggestControl The autosuggest control to provide suggestions for.
 */
StateSuggestions.prototype.requestSuggestions = function (oAutoSuggestControl /*:AutoSuggestControl*/) {

    var aSuggestions = [];
    var sTextboxValue = oAutoSuggestControl.textbox.value;

    // reset suggestions       
    document.getElementById("suggestion").innerHTML = '';

    // 1. get the text response just so i can output it and see it -- delete later
/*    textResponse = xmlHttp.responseText;
    var para=document.createElement("p");
    var node=document.createTextNode(textResponse);
    para.appendChild(node);
    
    //document.getElementById("suggestion").appendChild(para);
*/
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
        //document.getElementById("suggestion").appendChild(para2);

        aSuggestions.push(data);
    }

    oAutoSuggestControl.autosuggest(aSuggestions);
};

StateSuggestions.prototype.sendAjaxRequest = function (oAutoSuggestControl /*:AutoSuggestControl*/) {

    var oThis = this;
    xmlHttp = new XMLHttpRequest(); 
    var sTextboxValue = oAutoSuggestControl.textbox.value;
    var url = "./suggest?q=" + sTextboxValue;
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            oThis.requestSuggestions(oAutoSuggestControl);
        }
    };
    xmlHttp.open("GET", url);
    xmlHttp.send(null);
};

