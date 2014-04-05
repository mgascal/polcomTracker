function loadStatusList(ssnid, sortColumn, sortAsc){
	var searchVal = $("#searchVal").val();
	
	sortColumn = (sortColumn == null ? "STATUS_ID" : sortColumn);
	sortAsc = (sortAsc == null ? true : sortAsc);
	
	$.getJSON( getDomain() + '/statuses/statusLists.json',
  		{status : searchVal, ssnid: ssnid, sortColumn : sortColumn, sortAsc : sortAsc},
  		function(jd) {
  			param = jd["params"];
			res = jd["response"];
			stat = jd["status"];
			if (stat["code"] == 200) {
				
				div = document.getElementById("statusResults");
				removeChildElements(div);
				
					rowDiv = document.createElement("div");
					rowDiv.setAttribute("class","row");
					div.appendChild(rowDiv);
					
						colDiv = document.createElement("div");
						colDiv.setAttribute("class","col-lg-11 tableHeader");
						colDiv.setAttribute("style","border-top: 1px solid #0076EB; border-right: 1px solid #0076EB; border-left: 1px solid #0076EB; border-top-left-radius:6px; border-top-right-radius:6px;");
						rowDiv.appendChild(colDiv);
						
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
					
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("STATUS ID"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "STATUS_ID"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "STATUS_ID") ? !sortAsc : true;
									sortColumn = "STATUS_ID";
									loadStatusList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("STATUS"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "STATUS"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "STATUS") ? !sortAsc : true;
									sortColumn = "STATUS";
									loadStatusList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("CREATED DATE"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "CREATE_DATE"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "CREATE_DATE") ? !sortAsc : true;
									sortColumn = "CREATE_DATE";
									loadStatusList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("CREATED BY"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "CREATE_BY"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "CREATE_BY") ? !sortAsc : true;
									sortColumn = "CREATE_BY";
									loadStatusList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("UPDATED DATE"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "UPDATED_DATE"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "UPDATED_DATE") ? !sortAsc : true;
									sortColumn = "UPDATED_DATE";
									loadStatusList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("UPDATED BY"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "UPDATED_BY"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "UPDATED_BY") ? !sortAsc : true;
									sortColumn = "UPDATED_BY";
									loadStatusList(ssnid, sortColumn, sortAsc);
								};
								
						colDiv = document.createElement("div");
						colDiv.setAttribute("class","col-lg-1");
						rowDiv.appendChild(colDiv);
							
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-12");
								rowDiv2.appendChild(columnHeader);
								
									addButton = document.createElement("button");
									addButton.setAttribute("type","button");
									addButton.setAttribute("class","btn btn-default-addNew btn-sm glyphicon glyphicon-plus-sign");
									//addButton.appendChild(document.createTextNode("Add New"));
									addButton.onclick = function(){
										window.location = '/statuses/new'
									};
									columnHeader.appendChild(addButton);

				if (res.statuses.length > 0) {
					
					gray = true;
					
					$.each(res.statuses, function(i, obj){
						
					rowDiv = document.createElement("div");
					rowDiv.setAttribute("class","row");
					div.appendChild(rowDiv);
					
						colDiv = document.createElement("div");
						gray = !gray;
						colDiv.setAttribute("class","col-lg-11 tableRow" + ((gray) ? " rowGray" : " rowWhite"));
						colDiv.setAttribute("style","border-right: 1px solid #0076EB; border-left: 1px solid #0076EB;");
						if(i==(res.statuses.length-1))
									colDiv.setAttribute("style","border-right: 1px solid #0076EB; border-left: 1px solid #0076EB;border-bottom: 1px solid #0076EB; border-bottom-left-radius:6px; border-bottom-right-radius:6px;");
						colDiv.ondblclick = function(){
							window.location = '/statuses/' + obj["status_id"] + '/edit';
						};
						rowDiv.appendChild(colDiv);
						
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
					
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(obj["status_id"]));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(obj["status"]));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(format_oracle_date(obj["create_date"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(obj["create_by"]));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(format_oracle_date(obj["updated_date"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(obj["updated_by"]));
								columnData.appendChild(columnData2);
								
						colDiv = document.createElement("div");
						colDiv.setAttribute("class","col-lg-1");
						rowDiv.appendChild(colDiv);
							
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
							
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-12");
								rowDiv2.appendChild(columnData);
								
									addButton = document.createElement("a");
					 				addButton.setAttribute("class","btn btn-default-addNew btn-sm glyphicon glyphicon-trash");
					 				addButton.setAttribute("data-confirm","Are you sure you want to delete this Status?");
					 				addButton.setAttribute("data-method","delete");
					 				addButton.href = '/statuses/' + obj["status_id"];
					 				addButton.rel = 'nofollow';
									/*addButton.appendChild(document.createTextNode("Delete"));*/
		 							columnData.appendChild(addButton);
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
 	});
}

function format_oracle_date(date){
	d = new Date(date);
	ret = (d.getMonth() + 1) < 10 ? "0" + (d.getMonth() + 1) : (d.getMonth() + 1) ;
	ret += "/";
	ret += (d.getDate()) < 10 ? "0" + (d.getDate()) : (d.getDate());
	ret += "/";
	ret += d.getFullYear();
	return ret;
}

function createStatus(ssnid){
	
	data = getStatusFields();
	
	$.ajax({
		type: "GET",
		url: getDomain() + '/statuses/createStatus.json',
		data: {status: data, ssnid: ssnid },
		success: function(json) {
			stat = json["status"];
			if (stat["code"] == 200) {
				window.location = '/statuses/' + json["response"]["status"]["status_id"] + '/edit?jsAction=create';
			}else if(stat["code"] == 400){
				$.each(stat["message"], function(key, val){
					//alert(key + " " + val);
					var notice = $("#notice");
					
						var div = document.createElement("div");
						div.setAttribute("class","alert alert-danger");
						//text-transform:capitalize;
							var span = document.createElement("span");
							span.setAttribute("style","text-transform:capitalize;");
							span.appendChild(document.createTextNode(key.replace("_", " ")));
						div.appendChild(span);	
						div.appendChild(document.createTextNode(" " + val));
						notice.append(div);
						setTimeout(function(){ 
                            $(div).fadeOut(2000);
                        },2000);
				});
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
		}
	});
}

function getStatusFields(){
	return { 
			//FORM_ID: "Test" //column_name : value
			//STATUS_ID: nullToString($("#status_STATUS_ID").val()),
			status: nullToString($("#status_STATUS").val())			
	}
}

function nullToString(field){
	
	return (field == null) ? "" : field;
	
}

function processStatusData(status_id, ssnid){
	$.ajax({
		type: "GET",
		url: getDomain() + '/statuses/getTrackingStatus.json',
		data: {status_id: status_id, ssnid: ssnid },
		success: function(json) {
			stat = json["status"];
			if (stat["code"] == 200) {
				$.each(json["response"]["status"], function(key, val){
					$("#status_" + key.toUpperCase()).val(val);
				});
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
		}
	});
}

function updateStatus(status_id, ssnid){
	data = getStatusFields();
	
	$.ajax({
		type: "POST",
		url: getDomain() + '/statuses/updateTrackingStatus.json',
		data: {status: data, status_id: status_id, ssnid: ssnid },
		success: function(json) {
			var notice = $("#notice");
			removeChildElements(document.getElementById("notice"));
				
				var div = document.createElement("div");
				if (json.status["code"] == 200) {
					div.setAttribute("class","alert alert-success");
					div.appendChild(document.createTextNode("Status was successfully updated."));
				}else if(json.status["code"] == 400){
					$.each(json.status["message"], function(key, val){
						//alert(key + " " + val);
						div.setAttribute("class","alert alert-danger");
						var span = document.createElement("span");
						span.setAttribute("style","text-transform:capitalize;");
						span.appendChild(document.createTextNode(key.replace("_", " ")));
						div.appendChild(span);	
						div.appendChild(document.createTextNode(" " + val));
					});
				}
				
				notice.append(div);
				setTimeout(function(){
					$(div).fadeOut(2000);
				},2000);
			
				/*	var button = document.createElement("button");
					button.setAttribute("type","button");
					button.setAttribute("class","close");
					button.setAttribute("data-dismiss","alert");
					button.setAttribute("aria-hidden","true");
					button.innerHTML = "&times;";
					//prompt("", button.);
					div.appendChild(button);*/
		}
	});
}
