
function StateSuggestions() {

}

/**
 * Request suggestions for the given autosuggest control. 
 */
StateSuggestions.prototype.requestSuggestions = function (oAutoSuggestControl /*:AutoSuggestControl*/, bTypeAhead /*:boolean*/) {

    var aSuggestions = [];

    // reset suggestions       
    document.getElementById("suggestion").innerHTML = '';

    xmlDoc = xmlHttp.responseXML;
    var suggestions = xmlDoc.getElementsByTagName("suggestion");
    var numSuggestions = suggestions.length;

    for (var i=0; i<numSuggestions; i++)
    {
        var data = suggestions[i].getAttribute("data");
        aSuggestions.push(data);
    }

    oAutoSuggestControl.autosuggest(aSuggestions, bTypeAhead);
};

StateSuggestions.prototype.sendAjaxRequest = function (oAutoSuggestControl /*:AutoSuggestControl*/, bTypeAhead /*:boolean*/) {

    var oThis = this;
    xmlHttp = new XMLHttpRequest(); 
    var sTextboxValue = oAutoSuggestControl.textbox.value;
    var url = "./suggest?q=" + sTextboxValue;
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            oThis.requestSuggestions(oAutoSuggestControl, bTypeAhead);
        }
    };
    xmlHttp.open("GET", url);
    xmlHttp.send(null);
};