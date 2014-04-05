function changeDropdownLabel(textLabel, element){
	//element.innerText = text;
	//alert(textLabel);
	$(element).text(textLabel);
}

function changeSearchField(elem){
	//alert($(elem).text());
	//<input type="text" class="form-control" id="searchVal">  normal field
	//<input type="date" class="form-control" data-provide="datepicker" data-date-format="yyyy-mm-dd" id="form_EDITION_DATE"> date field
	
	var field = $("#searchVal");
	if($(elem).text().indexOf("DATE") >= 0){
		$("#searchVal").hide();
		$("#searchValDate").show();
		var d = new Date();
		if($("#searchValDate") == null && $("#searchValDate") == "")
			$("#searchValDate").val(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate());
	}else{
		$("#searchValDate").hide();
		$("#searchVal").show();
	}
}

function getDomain(){
	
	return location.protocol + "//" + location.host
}

function removeChildElements(e){
	
	 while (e.lastChild)
      e.removeChild(e.lastChild);
}

function loadSearchForms(ssnid, copiedId, sortColumn, sortAsc){
	//alert(sortColumn + " " + sortAsc);
	var searchVal = $("#searchVal").val();
	var searchOpt = $("#srch_dd_label").text().replace(/ /g, "_");
	//alert(searchOpt);
	
	sortColumn = (sortColumn == null ? "form_id" : sortColumn);
	sortAsc = (sortAsc == null ? false : sortAsc);
	
	if(searchOpt.indexOf("DATE") >= 0){
		searchVal = $("#searchValDate").val();
	}
	var url = document.URL
	if(url.indexOf("/edit") >= 0){
		var id = url.substring(url.indexOf("/forms/") + "/forms/".length, url.indexOf("/edit"));
		unlockedForm(id, ssnid);
	}
	//alert(ssnid);
	//alert(searchOpt);
	$.getJSON( getDomain() + '/forms/searchForms.json',
  		{searchOpt  : searchOpt, searchVal : searchVal, ssnid : ssnid, sortColumn : sortColumn, sortAsc : sortAsc },
  		function(jd) {
  			param = jd["params"];
			res = jd["response"];
			stat = jd["status"];
			if (stat["code"] == 200) {
				div = document.getElementById("resultDiv");
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
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("FORM ID"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "form_id"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "form_id") ? !sortAsc : false;
									sortColumn = "form_id";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("REVISED ITEM NO"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "revised_item_no"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "revised_item_no") ? !sortAsc : false;
									sortColumn = "revised_item_no";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("STATUS"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "status"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "status") ? !sortAsc : false;
									sortColumn = "status";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("POLICY NAME"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "policy_name"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "policy_name") ? !sortAsc : false;
									sortColumn = "policy_name";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("LOB"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "lob"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "lob") ? !sortAsc : false;
									sortColumn = "lob";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("TYPE OF DOCUMENT"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "type_of_document"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "type_of_document") ? !sortAsc : false;
									sortColumn = "type_of_document";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("TYPE OF POLICY"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "type_of_policy"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "type_of_policy") ? !sortAsc : false;
									sortColumn = "type_of_policy";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("MAPPING COMPLETED"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "mapping_completed"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "mapping_completed") ? !sortAsc : false;
									sortColumn = "mapping_completed";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("PARSING COMPLETED"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "parsing_completed"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "parsing_completed") ? !sortAsc : false;
									sortColumn = "parsing_completed";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								
								columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnHeader);
								columnHeaderText = document.createElement("p");
								columnHeaderText.setAttribute("class","well-sm");
								columnHeaderText.appendChild(document.createTextNode("LOADED"));
								columnHeader.appendChild(columnHeaderText);
								
								if(sortColumn == "loaded"){
									columnHeaderText2 = document.createElement("span");
									columnHeaderText2.setAttribute("class", ((sortAsc) ? "glyphicon glyphicon-arrow-up" : "glyphicon glyphicon-arrow-down"));
									columnHeaderText.appendChild(columnHeaderText2);
								}
								
								columnHeader.onclick = function(){
									sortAsc = (sortColumn == "loaded") ? !sortAsc : false;
									sortColumn = "loaded";
									loadSearchForms(ssnid, null, sortColumn, sortAsc);
								};
								
								
						colDiv = document.createElement("div");
						colDiv.setAttribute("class","col-lg-1");
						rowDiv.appendChild(colDiv);
							
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
								
								//<div class="col-md-2"><p><button type="button" class="btn btn-default btn-sm">Add New</button></p></div>
								/*columnHeader = document.createElement("div");
								columnHeader.setAttribute("class","col-xs-12");
								rowDiv2.appendChild(columnHeader);
								
									addButton = document.createElement("button");
									addButton.setAttribute("type","button");
									addButton.setAttribute("class","btn btn-default-addNew btn-sm glyphicon glyphicon-plus-sign");
									addButton.setAttribute("id","form_Add");
									//addButton.appendChild(document.createTextNode("Add New"));
									addButton.onclick = function(){
										window.location = '/forms/new'
									};
									columnHeader.appendChild(addButton);*/
							
				if (res.forms.length > 0) {
					
					gray = true;
					
					$.each(res.forms, function(i, obj){
					rowDiv = document.createElement("div");
					rowDiv.setAttribute("class","row");
					div.appendChild(rowDiv);
					
						colDiv = document.createElement("div");
						gray = !gray;
						colDiv.setAttribute("class","col-lg-11 tableRow" + ((gray) ? " rowGray" : " rowWhite"));
						colDiv.setAttribute("style","border-right: 1px solid #0076EB; border-left: 1px solid #0076EB;");
						if(i==(res.forms.length-1))
									colDiv.setAttribute("style","border-right: 1px solid #0076EB; border-left: 1px solid #0076EB;border-bottom: 1px solid #0076EB; border-bottom-left-radius: 6px; border-bottom-right-radius: 6px;");
						colDiv.ondblclick = function(){
							window.location = '/forms/' + obj["ksq_seq_no"] + '/edit?searchValue=' + $('#srch_dd_label').text()
						};
						if(obj["ksq_seq_no"] == copiedId){
							formatRow(colDiv);	
						}
						
						rowDiv.appendChild(colDiv);
						
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
					
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["form_id"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["revised_item_no"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["status"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-2");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["policy_name"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["lob"])));
								columnData.appendChild(columnData2);
								
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["type_of_document"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["type_of_policy"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["mapping_completed"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["parsing_completed"])));
								columnData.appendChild(columnData2);
								
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-1");
								rowDiv2.appendChild(columnData);
								columnData2 = document.createElement("p");
								columnData2.setAttribute("class","well-sm");
								columnData2.appendChild(document.createTextNode(nullToString(obj["loaded"])));
								columnData.appendChild(columnData2);
								
						colDiv = document.createElement("div");
						colDiv.setAttribute("class","col-lg-1");
						rowDiv.appendChild(colDiv);
							
							rowDiv2 = document.createElement("div");
							rowDiv2.setAttribute("class","row");
							colDiv.appendChild(rowDiv2);
							
								//<div class="col-md-2"><p><button type="button" class="btn btn-default btn-sm">Delete</button></p></div>
								columnData = document.createElement("div");
								columnData.setAttribute("class","col-xs-12 btn-group btn-group-justified");
								rowDiv2.appendChild(columnData);
								
									addButton = document.createElement("button");
					 				addButton.setAttribute("class","btn btn-default-addNew btn-sm glyphicon glyphicon-trash");
					 				/*addButton.setAttribute("data-confirm","Are you sure?");
					 				addButton.setAttribute("data-method","delete");
					 				addButton.href = '/forms/' + obj["KSQ_SEQ_NO"];
					 				addButton.rel = 'nofollow';*/
									//addButton.appendChild(document.createTextNode("Delete"));
									addButton.onclick = function (){
										
										var answer = confirm("Are you sure want to delete this form?")
										
										if(answer){
											$.ajax({
												type: "DELETE",
												url: getDomain() + '/forms/' + obj["ksq_seq_no"] + '.json',
												data: {ssnid : ssnid },
												success: function(jd) {
													//alert("Deleted");
													stat = jd["status"];
													locked = jd["response"]["locked"]
													if(locked["locked"]){
														alert("Locked by " + locked["locked_by"]);
													}else{
														if (stat["code"] == 200) {
															alert("Succesfully deleted");
															loadSearchForms(ssnid);
														}else if(stat["code"] == 401){
															window.location = getDomain() + '/mainforms/code401';	
														}
													}
												}
											});
										}
										
									/*	var heading = 'Confirm Transaction Delete';
									    var question = 'Please confirm that you wish to delete transaction ' + obj["KSQ_SEQ_NO"]  + '.';
									    var cancelButtonTxt = 'Cancel';
									    var okButtonTxt = 'Confirm';
									
									    var callback = function() {
									      alert('delete confirmed ' + obj["KSQ_SEQ_NO"] );
									    };
									
									    confirm(heading, question, cancelButtonTxt, okButtonTxt, callback);
									   */
									}
		 							columnData.appendChild(addButton);
									
									addButton = document.createElement("button");
									addButton.setAttribute("type","button");
									addButton.setAttribute("class","btn btn-default-addNew btn-sm glyphicon glyphicon-import");
									addButton.onclick = function(){
										var answer = confirm("Are you sure want to copy this form?")
										
										if(answer){
											//copyForm(obj["KSQ_SEQ_NO"] , ssnid);
											window.location = getDomain() + '/forms/' + obj["ksq_seq_no"] + '/copy'
										}
									};
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
			//prompt("",div.innerHTML); //getHTML generated code
  		}
  	);
	
}

function checkoutForm(ksq_seq_no, ssnid){
	//alert(ksq_seq_no);
	$.ajaxSetup ({  
        // Disable caching of AJAX responses  
    	cache: false  
    });
    $.getJSON(getDomain() + '/forms/checkoutForm.json?', 
		{ksq_seq_no: ksq_seq_no, ssnid: ssnid }, 
		function (jd){
			locked = jd["response"]["locked"];
			stat = jd["status"];
			if (stat["code"] == 200) {
			//alert(locked);
			//locked = false;
				if(locked["locked"]){
					
					var notice = $("#notice");
					
						var div = document.createElement("div");
						div.setAttribute("class","alert alert-danger");
						div.appendChild(document.createTextNode("This policy is being worked on by " + locked["locked_by"] + ". Changes is not allowed during this session. "));
						notice.append(div);
						
							/*var button = document.createElement("button");
							button.setAttribute("type","button");
							button.setAttribute("class","close");
							button.setAttribute("data-dismiss","alert");
							button.setAttribute("aria-hidden","true");
							button.innerHTML = "&times;";*/
							setTimeout(function(){ 
                                        $(div).fadeOut(2000);
                                   },2000);
							//prompt("", button.);
							//div.appendChild(button);
							$("#form_save").prop('disabled', locked);
				}
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
		}
	); 
}

function processData(ksq_seq_no, ssnid, copy){
	//alert(ksq_seq_no);
	if(!copy){
		checkoutForm(ksq_seq_no, ssnid);	
	}
	$.getJSON(getDomain() + '/forms/getFormDetails.json?', 
		{ksq_seq_no: ksq_seq_no, ssnid: ssnid }, 
		function (jd){
			stat = jd["status"];
			if (stat["code"] == 200) {
				$.each(jd["response"]["form"], function(key, val){
					//$("#form_" + key).val("");
					//alert(key);
					//$("#form_" + key.toUpperCase()).val(val);
					if($("#form_" + key.toUpperCase()).attr("type") == "date"){
						$("#form_" + key.toUpperCase()).val(format_oracle_date(val));
					}else{
						$("#form_" + key.toUpperCase()).val(val);
					}
					//for dropdown fields
					if(key == "status" || key == "type_of_document" || key == "type_of_policy" || key == "type_of_submission"){
						dropDownChangeLabel(key.toUpperCase());
						if (key == "type_of_document"){
							showRelatedPolicy(val);
						}
						if(key == "type_of_policy"){
							filterLOBs(val);
						}
						
					}
					if(key == "lob"){
						if(val != null){
							$("#form_" + key.toUpperCase()).selectpicker('val', val.split(","));
						}
						/*$("#form_" + key).val(['47','57']);
						$("#form_" + key).selectpicker('render');
						*/
					}
				});
				if(jd["response"]["proprietary"] != null){
					//alert(jd["response"]["proprietary"]);
					$("#form_PROPRIETARY").val(jd["response"]["proprietary"]);
				}
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
			/*if(jd["response"]["locked"])
				$("#form_save").prop('disabled', true);
			else	
				$("#form_save").prop('disabled', false);*/
			//$("#form_save").prop('disabled', jd["response"]["locked"]);
	});
	
	//$("#srchField").val ( $("#searchVal").val() );
	//$("#srchValue").val ( $("#searchOpt").val() );
}

function onChangeLOB(id){
	filterLOBs(id);
	$("#form_LOB").selectpicker('val', '');
}
function filterLOBs(id){
	
	//alert(id);
	len = 0;
	$("#form_LOB").children('option').each( function(){
		//alert(this.className);
		//$(this).hide();
		
		$(this).attr("disabled", "disabled");
		if(this.className == "pol_type_" + id){
			$(this).removeAttr("disabled");
		}	
		$("#form_LOB").selectpicker('refresh');
	});
	
	/*
	
	$("#form_LOB option").each(function(index, val) {
		if(this.className == "pol_type_" + id){
			len++;
		    if(navigator.appName == 'Microsoft Internet Explorer') {
		        if (this.nodeName.toUpperCase() === 'OPTION') {
		            var span = $(this).parent();
		            var opt = this;
		            if($(this).parent().is('span')) {
		                $(opt).show();
		                $(span).replaceWith(opt);
		            }
		        }
		    } else {
		        $(this).show(); //all other browsers use standard .show()
		    }
	    }else{
	    	if ($(this).is('option') && (!$(this).parent().is('span')))
        		$(this).wrap((navigator.appName == 'Microsoft Internet Explorer') ? '<span>' : null).hide();
	    }
	});
	if(len > 1){
		$("#form_LOB").val("");
	}else if(len == 1){
		$("#form_LOB#elem").selectedIndex = 0;
	}*/
}
function createForm(ssnid, copy){
	
	//alert("Create User");
	
	//alert($("#form_FORM_ID").val());
	data = getFormFields();
	
	$.ajax({
		type: "GET",
		url: getDomain() + '/forms/createForm.json',
		data: {form: data, commit: "Save", ssnid: ssnid },
		success: function(json) {
			stat = json["status"];
			if (stat["code"] == 200) {
				var jsAction = 'create';
				if(copy){
					jsAction = 'copy';
				}
				window.location = '/forms/' + json["response"]["form"]["ksq_seq_no"] + '/edit?jsAction='+jsAction;
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
		}
	});
}

function getFormFields(){
	return { 
			//FORM_ID: "Test" //column_name : value
			//SEQ_NO: 				nullToString($("#form_SEQ_NO").val()),
			form_id: 				nullToString($("#form_FORM_ID").val()),
			revised_item_no:		nullToString($("#form_REVISED_ITEM_NO").val()),
			status: 				nullToString($("#form_STATUS").val()),
			policy_name:			nullToString($("#form_POLICY_NAME").val()),
			form_label: 			nullToString($("#form_FORM_LABEL").val()),
			form_no: 				nullToString($("#form_FORM_NO").val()),
			edition_date:			nullToString($("#form_EDITION_DATE").val()),
			type_of_policy:			nullToString($("#form_TYPE_OF_POLICY").val()),
			lob:					nullToString($("#form_LOB").val()),
			type_of_document:		nullToString($("#form_TYPE_OF_DOCUMENT").val()),
			submitter_company:		nullToString($("#form_SUBMITTER_COMPANY").val()),
			submitter_name:			nullToString($("#form_SUBMITTER_NAME").val()),
			submitters_email:		nullToString($("#form_SUBMITTERS_EMAIL").val()),
			client_reference_file:	nullToString($("#form_CLIENT_REFERENCE_FILE").val()),
			date_received:			nullToString($("#form_DATE_RECEIVED").val()),
			due_date:				nullToString($("#form_DUE_DATE").val()),
			mapping_completed:		nullToString($("#form_MAPPING_COMPLETED").val()),
			mapped_by:				nullToString($("#form_MAPPED_BY").val()),
			parsing_completed:		nullToString($("#form_PARSING_COMPLETED").val()),
			loaded:					nullToString($("#form_LOADED").val()),
			new_form_id:			nullToString($("#form_NEW_FORM_ID").val()),
			text_file_name:			nullToString($("#form_TEXT_FILE_NAME").val()),
			new_text_file_name:		nullToString($("#form_NEW_TEXT_FILE_NAME").val()),
			new_policy_name:		nullToString($("#form_NEW_POLICY_NAME").val()),
			comments:				nullToString($("#form_COMMENTS").val()),
			create_date:			nullToString($("#form_CREATE_DATE").val()),
			create_by:				nullToString($("#form_CREATE_BY").val()),
			updated_date:			nullToString($("#form_UPDATED_DATE").val()),
			updated_by:				nullToString($("#form_UPDATED_BY").val()),
			related_policy:			($("#form_TYPE_OF_DOCUMENT").val() == 3) ? nullToString($("#form_RELATED_POLICY").val()) : "", 
			type_of_submission:		nullToString($("#form_TYPE_OF_SUBMISSION").val()), 
			client_notified: 		nullToString($("#form_CLIENT_NOTIFIED").val()),
			proprietary: 			nullToString($("#form_PROPRIETARY").val())
			
	}
}

function nullToString(field){
	
	return (field == null) ? "" : field;
	
}

function format_oracle_date(date){
	ret = "";
	if(date != null){
		d = new Date(date);
		ret = (d.getMonth() + 1) < 10 ? "0" + (d.getMonth() + 1) : (d.getMonth() + 1) ;
		ret += "/";
		ret += (d.getDate()) < 10 ? "0" + (d.getDate()) : (d.getDate());
		ret += "/";
		ret += d.getFullYear();
	}
	return ret;
}

function updateForm(ksq_seq_no, ssnid){
	
	data = getFormFields();
	$.ajax({
		type: "POST",
		url: getDomain() + '/forms/updateForm.json',
		data: {form: data, commit: "Save", ksq_seq_no: ksq_seq_no, ssnid: ssnid },
		success: function(jd) {
			stat = jd["status"];
			if (stat["code"] == 200) {
				
				var notice = $("#notice");
				removeChildElements(document.getElementById("notice"));
				
				if($(".close")!= null){ // close notification if exists
					$(".close").click();
				}
					
					var div = document.createElement("div");
					div.setAttribute("class","alert alert-success alert-dismissable");
					div.appendChild(document.createTextNode("Form was successfully updated."));
					notice.append(div);
					
						var button = document.createElement("button");
						button.setAttribute("type","button");
						button.setAttribute("class","close");
						button.setAttribute("data-dismiss","alert");
						button.setAttribute("aria-hidden","true");
						button.innerHTML = "&times;";
						//prompt("", button.);
						div.appendChild(button);
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
		}
	});
}

function unlockedForm(ksq_seq_no, ssnid, redirect){
	//alert(ssnid);
	$.ajax({
		type: "POST",
		url: getDomain() + '/forms/unlockedForm.json',
		data: { ksq_seq_no: ksq_seq_no, ssnid : ssnid },
		success: function() { 
			if(redirect != null)
				window.location=redirect;
		}
	});
}

function dropDownChange(element){
	((element.parentNode).parentNode).parentNode.getElementsByTagName("input")[0].value = $(element).text();//element.innerText; //value for selected text
	((element.parentNode).parentNode).parentNode.getElementsByTagName("input")[1].value = $(element).val(); //hidden input for selected id
	//showHideDropdown(element.parentNode);
}

function dropDownChangeLabel(key){
	
	dropDownValue = $("#form_"+ key).val();
	el = $("#form_"+ key).parent();
	newValue = el.find("li[value="+dropDownValue+"]").text();
	if(newValue == "" ){
		newValue = "<Please select>"
	}
	el.find("input[type='text']").val(newValue);
}

function copyForm(ksq_seq_no, ssnid){
	$.ajax({
		type: "GET",
		url: getDomain() + '/forms/copyForm.json',
		data: { ksq_seq_no: ksq_seq_no, ssnid : ssnid },
		success: function(json) {
			stat = json["status"];
			if (stat["code"] == 200) {
				loadSearchForms(ssnid, json["response"]["form"]["ksq_seq_no"]);
			}else if(stat["code"] == 401){
				window.location = getDomain() + '/mainforms/code401';	
			}
		}
	});
}

function formatRow(copiedDiv){
	classAtt = copiedDiv.className;
	copiedDiv.style.background = "red";
	setTimeout(function(){ 
		//rowGray" : " rowWhite
		arr = classAtt.split(" ");
		if(jQuery.inArray( "rowGray", arr ) > -1){
			copiedDiv.style.background = "GRAY";
		}else if(jQuery.inArray( "rowWhite", arr ) > -1){
			copiedDiv.style.background = "WHITE";
		}
	}, 2000);
}

//hide/show Related Policy field if Document type is Endorsement or id 3
function showRelatedPolicy(value){
	
	if(value == 3){ // id for Endorsement (document Type)
		$(".forEndorsement").show();
	}else{
		$(".forEndorsement").hide();
	}
	
}
/*
function confirm(heading, question, cancelButtonTxt, okButtonTxt, callback) {

    var confirmModal = document.createElement("div");
    confirmModal.setAttribute("class", "modal fade");
    confirmModal.setAttribute("id", "popup_window");
    
    	var divDialog = document.createElement("div");
    	divDialog.setAttribute("class", "modal-dialog");
    	confirmModal.appendChild(divDialog);
    	
    		var divContent = document.createElement("div");
    		divContent.setAttribute("class", "modal-content");
    		divDialog.appendChild(divContent);
    		
    			var divHeader = document.createElement("div");
    			divHeader.setAttribute("class", "modal-content");
    			divContent.appendChild(divHeader);
    			
    				var button = document.createElement("button");
    				button.setAttribute("type", "button");
    				button.setAttribute("class", "close");
    				button.setAttribute("data-dismiss", "modal");
    				button.setAttribute("aria-hidden", "true");
    				button.appendChild(document.createTextNode("x "));
    				divHeader.appendChild(button);
    				
    				var h4 = document.createElement("h4");
    				h4.setAttribute("class", "modal-title");
    				h4.appendChild(document.createTextNode(heading));
    				divHeader.appendChild(h4);
    			
    			var divBody = document.createElement("div");
    			divBody.setAttribute("class", "modal-body");
    			divContent.appendChild(divBody);
    				
    				var p = document.createElement("p");
    				p.appendChild(document.createTextNode(question));
    				divBody.appendChild(p);
    			
    			var divFooter = document.createElement("div");
    			divFooter.setAttribute("class", "modal-footer");
    			divContent.appendChild(divFooter);
    				
    				var button = document.createElement("button");
    				button.setAttribute("class", "btn btn-primary");
    				button.appendChild(document.createTextNode("Yes"));
    				divFooter.appendChild(button);
    				
    				var button = document.createElement("button");
    				button.setAttribute("class", "btn btn-default");
    				button.setAttribute("data-dismiss", "modal");
    				button.appendChild(document.createTextNode("No"));
    				divFooter.appendChild(button);
    				
 	
    $(confirmModal).find('#okButton').click(function(event) {
      callback();
      $(this).modal('hide');
    });

    $(confirmModal).modal('show');     
  };
  */
/*
function showHideDropdown(element){
	
	/*var ulTag = (element.parentNode).getElementsByTagName("ul")[0];
	alert(ulTag.style.display);
 	if (ulTag.style.display == "none" || ulTag.style.display == "" || ulTag.style.display == null ){
		ulTag.style.display == "block";
	}else{
 		ulTag.style.display == "none";
 	}*
 	
 	//alert(($(element).parent()).find("ul").html());
 	($(element).parent()).find("ul").toggle();
 	
}*/
