/*function changeTextValue(text, element){
     element.innerText = text;
}*/


$('#uldrop li').on("click", function(){
	$('#rdf').val($(this).text());
});

$('#test').click(function(){
	alert($(this).val());
});

