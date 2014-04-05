 /*<div class="col-md-1">Date Received</div>
        <div class="col-md-1">Policy Name</div>
        <div class="col-md-1">Type of Document</div>
        <div class="col-md-1">Type of Submission</div>
        <div class="col-md-1">Type of Document</div>
        <div class="col-md-1">Analyzed</div>
        <div class="col-md-1">Parsed</div>
        <div class="col-md-1">Loaded</div>
        <div class="col-md-1">Closed</div>
  */
 
function changeDateDropdown(selected, element){
	$(element).text($(selected).text());
}

function getColumnFilter(text){
	
	var filterBy = "";
	if(text == "RECEIVED DATE"){
		filterBy = "DATE_RECEIVED"
	}else if(text == "ANALYZED DATE"){
		filterBy = "MAPPING_COMPLETED"
	}else if(text == "PARSED DATE"){
		filterBy = "PARSING_COMPLETED"
	}else if(text == "LOADED DATE"){
		filterBy = "LOADED"
	}else if(text == "CREATED DATE"){
		filterBy = "CREATE_DATE"
	}else if(text == "UPDATED DATE"){
		filterBy = "UPDATED_DATE"
	} 
	
	return filterBy;
}

function loadGenerateReport(ssnid){
	
	var dateFrom = $("#reportDateFrom").val();
	var dateTo = $("#reportDateTo").val();
	var filterBy = getColumnFilter($("#date_dd_label").text());
	
	//alert(dateFrom + " " + dateTo);
	$.getJSON( getDomain() + '/forms/excelDownload.json',
  		{dateFrom  : dateFrom, dateTo : dateTo, filterBy : filterBy, ssnid : ssnid },
  		function(jd) {
  			param = jd["params"];
			res = jd["response"];
			stat = jd["status"];
			if (stat["code"] == 200) {
				div = document.getElementById("reportTable");
				removeChildElements(div);
				
					rowDiv = document.createElement("div");
					rowDiv.setAttribute("class","row");
					div.appendChild(rowDiv);
					
						colDiv = document.createElement("div");
						colDiv.setAttribute("class","col-lg-12 tableHeader");
						colDiv.setAttribute("style","border-top-left-radius: 6px; border-top-right-radius: 6px; border-top: 1px solid #0076EB; border-right: 1px solid #0076EB; border-left: 1px solid #0076EB; border-bottom: 1px solid #0076EB;");
						rowDiv.appendChild(colDiv);
						
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
				
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Date Received"));
								columnHeader.appendChild(columnHeaderText);

								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Policy Name"));
								columnHeader.appendChild(columnHeaderText);
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Type of Document"));
								columnHeader.appendChild(columnHeaderText);
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Type of Submission"));
								columnHeader.appendChild(columnHeaderText);
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Type of Policy"));
								columnHeader.appendChild(columnHeaderText);
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Analyzed"));
								columnHeader.appendChild(columnHeaderText);
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Parsed"));
								columnHeader.appendChild(columnHeaderText);
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Loaded"));
								columnHeader.appendChild(columnHeaderText);
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("Closed"));
								columnHeader.appendChild(columnHeaderText);
					
					
					if (res.forms.length > 0) {
						gray = true;
						$.each(res.forms, function(i, obj){
							
					rowDiv = document.createElement("div");
					rowDiv.setAttribute("class","row");
					div.appendChild(rowDiv);
					
						colDiv = document.createElement("div");
						gray = !gray;
						colDiv.setAttribute("class","col-lg-12 tableRow" + ((gray) ? " rowGray1" : " rowWhite1"));
						colDiv.setAttribute("style","border-right: 1px solid #0076EB; border-left: 1px solid #0076EB;");
						if(i==(res.forms.length-1))
									colDiv.setAttribute("style","border-right: 1px solid #0076EB; border-left: 1px solid #0076EB; border-bottom: 1px solid #0076EB; border-bottom-left-radius: 6px; border-bottom-right-radius: 6px;");
						//colDiv.setAttribute("style","border: 1px solid #0076EB"); XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
						rowDiv.appendChild(colDiv);
						
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
							
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["date_received"])));
								columnDiv.appendChild(columnDiv2);
								
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["policy_name"])));
								columnDiv.appendChild(columnDiv2);
								
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["type_of_document"])));
								columnDiv.appendChild(columnDiv2);
								
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["TYPE_OF_SUBMISSION"])));
								columnDiv.appendChild(columnDiv2);
								
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["type_of_policy"])));
								columnDiv.appendChild(columnDiv2);
								
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["analyzed"])));
								columnDiv.appendChild(columnDiv2);
								
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-md-1");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["parsed"])));
								columnDiv.appendChild(columnDiv2);
								
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["loaded"])));
								columnDiv.appendChild(columnDiv2);
								
								columnDiv = document.createElement("div");
								columnDiv.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnDiv);
								columnDiv2 = document.createElement("p");
								columnDiv2.setAttribute("class","well-sm");
								columnDiv2.appendChild(document.createTextNode(nullToString(obj["closed"])));
								columnDiv.appendChild(columnDiv2);

						});
					}else{
						removeChildElements(div);
						
						rowDiv = document.createElement("div");
						rowDiv.appendChild(document.createTextNode("No Data Available"));
						div.appendChild(rowDiv);
					}
					
					
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
  		}
 	);
}

function downloadExcel(){
	var dateFrom = $("#reportDateFrom").val();
	var dateTo = $("#reportDateTo").val();
	var filterBy = getColumnFilter($("#date_dd_label").text());
	window.location = getDomain() + "/forms/excelDownload.xlsx?dateFrom=" + dateFrom + "&dateTo=" + dateTo + "&filterBy=" + filterBy;
}