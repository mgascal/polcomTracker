function deleteSession(sessionId){	
	$.ajax({
		url		: '/sessions/endSession.json',
		type 	: 'POST',		
		data	: { session_id: sessionId },
		success : function() {
			window.location = "/mainforms/showsessions";
		}
	});		
}

function logoutSession(userId){
	$.ajax({
		url		: '/sessions/destroy.json',
		type 	: 'POST',
		data	: { user_id: userId },
		success : function(){
			window.location = "/";
		}
	});
}