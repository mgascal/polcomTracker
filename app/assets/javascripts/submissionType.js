function loadSubmissionTypeList(ssnid, sortColumn, sortAsc){
	var searchVal = $("#searchVal").val();
	
	sortColumn = (sortColumn == null ? "submission_type_id" : sortColumn);
	sortAsc = (sortAsc == null ? true : sortAsc);
	
	$.getJSON( getDomain() + '/submission_types/submissionTypeLists.json',
  		{submission_types : searchVal, ssnid: ssnid, sortColumn : sortColumn, sortAsc : sortAsc},
  		function(jd) {
  			param = jd["params"];
			res = jd["response"];
			stat = jd["status"];
			if (stat["code"] == 200) {
				
				div = document.getElementById("submissionTypeResults");
				removeChildElements(div);
				
					rowDiv = document.createElement("div");
					rowDiv.setAttribute("class","row");
					div.appendChild(rowDiv);
					
						colDiv = document.createElement("div");
						colDiv.setAttribute("class","col-lg-11 tableHeader");
						colDiv.setAttribute("style","border-top: 1px solid #0076EB; border-right: 1px solid #0076EB; border-left: 1px solid #0076EB; border-top-left-radius: 6px; border-top-right-radius: 6px; border-bottom: 1px solid #0076EB;");
						rowDiv.appendChild(colDiv);
						
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
					
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("SUBMISSION TYPE ID"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "submission_type_id"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "submission_type_id") ? !sortAsc : true;
									sortColumn = "submission_type_id";
									loadSubmissionTypeList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("SUBMISSION TYPE"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "submission_type"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "submission_type") ? !sortAsc : true;
									sortColumn = "submission_type";
									loadSubmissionTypeList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("CREATED DATE"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "create_date"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "create_date") ? !sortAsc : true;
									sortColumn = "create_date";
									loadSubmissionTypeList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("CREATED BY"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "create_by"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "create_by") ? !sortAsc : true;
									sortColumn = "create_by";
									loadSubmissionTypeList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("UPDATED DATE"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "updated_date"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "updated_date") ? !sortAsc : true;
									sortColumn = "updated_date";
									loadSubmissionTypeList(ssnid, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("UPDATED BY"));
								columnHeader.appendChild(columnHeaderText);
								if(sortColumn == "updated_by"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "updated_by") ? !sortAsc : true;
									sortColumn = "updated_by";
									loadSubmissionTypeList(ssnid, sortColumn, sortAsc);
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
										window.location = '/submission_types/new'
									};
									columnHeader.appendChild(addButton);
				//alert(res.polTypes.length);
				if (res.submissionTypes.length > 0) {
					
					gray = true;
					
					$.each(res.submissionTypes, function(i, obj){
						
					rowDiv = document.createElement("div");
					rowDiv.setAttribute("class","row");
					div.appendChild(rowDiv);
					
						colDiv = document.createElement("div");
						gray = !gray;
						colDiv.setAttribute("class","col-md-11 tableRow" + ((gray) ? " rowGray" : " rowWhite"));
						colDiv.setAttribute("style","border-right: 1px solid #0076EB; border-left: 1px solid #0076EB;");
						if(i==(res.submissionTypes.length-1))
									colDiv.setAttribute("style","border-right: 1px solid #0076EB; border-left: 1px solid #0076EB; border-bottom: 1px solid #0076EB; border-bottom-left-radius:6px; border-bottom-right-radius:6px;");
						colDiv.ondblclick = function(){
							window.location = '/submission_types/' + obj["submission_type_id"] + '/edit';
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
								columnData2.appendChild(document.createTextNode(obj["submission_type_id"]));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(obj["submission_type"]));
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
								columnData.appendChild(document.createTextNode(obj["updated_by"]));
								columnData.appendChild(columnData2);
								
						colDiv = document.createElement("div");
						colDiv.setAttribute("class","col-md-1");
						rowDiv.appendChild(colDiv);
							
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
							
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-12");
								rowDiv2.appendChild(columnData);
								
									addButton = document.createElement("a");
					 				addButton.setAttribute("class","btn btn-default-addNew btn-sm glyphicon glyphicon-trash");
					 				addButton.setAttribute("data-confirm","Are you sure you want to delete this Submission Type?");
					 				addButton.setAttribute("data-method","delete");
					 				addButton.href = '/submission_types/' + obj["submission_type_id"];
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

function getSubmissionTypeFields(){
	return { 
		submission_type: nullToString($("#submissionType_SUBMISSION_TYPE").val())			
	}
}

function createSubmissionType(ssnid){
	
	data = getSubmissionTypeFields();
	
	$.ajax({
		type: "GET",
		url: getDomain() + '/submission_types/createSubmissionType.json',
		data: {submission_type: data, ssnid: ssnid },
		success: function(json) {
			stat = json["status"];
			if (stat["code"] == 200) {
				window.location = '/submission_types/' + json["response"]["submission_type"]["submission_type_id"] + '/edit?jsAction=create';
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

function processSubmissionTypeData(submission_type_id, ssnid){
	$.ajax({
		type: "GET",
		url: getDomain() + '/submission_types/getSubmissionType.json',
		data: {submission_type_id: submission_type_id, ssnid: ssnid },
		success: function(json) {
			stat = json["status"];
			if (stat["code"] == 200) {
				$.each(json["response"]["submission_type"], function(key, val){
					$("#submissionType_" + key.toUpperCase()).val(val);
				});
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
		}
	});
}

function updateSubmissionType(submission_type_id, ssnid){
	data = getSubmissionTypeFields();
	
	$.ajax({
		type: "POST",
		url: getDomain() + '/submission_types/updateSubmissionType.json',
		data: {submission_type: data, submission_type_id: submission_type_id, ssnid: ssnid },
		success: function(json) {
			var notice = $("#notice");
			removeChildElements(document.getElementById("notice"));
				
				var div = document.createElement("div");
				if (json.status["code"] == 200) {
					div.setAttribute("class","alert alert-success");
					div.appendChild(document.createTextNode("Submission Type was successfully updated."));
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