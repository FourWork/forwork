/**
 * 
 */
 
 // 즉시 실행되는 함수
let chattingService = (function() {

	function getMessages(chatroomId, callback, error) {
		$.ajax({
			type : 'get',
			url : '/message/chatroom/' + chatroomId,
			dataType : "json",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function getChatroomName(chatroomId, callback, error) {
		$.ajax({
			type : 'get',
			url : '/chatroom/' + chatroomId,
			dataType : "json",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				console.log("error");
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function insertMessage(message, callback, error) {
		$.ajax({
			type : 'post',
			url : '/message/new',
			data : JSON.stringify(message),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function getChatrooms(userId, callback, error) {
		$.ajax({
			type : 'get',
			url : '/chatroom/member' + userId,
			dataType : "json",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	function updateReadStatus(chatroomId, memberId, callback, error){
		$.ajax({
			type : 'put',
			url : '/message/read/chatroom/' + chatroomId + '/member/' + memberId,
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	return {
		getMessages : getMessages,
		getChatroomName : getChatroomName,
		insertMessage : insertMessage,
		getChatrooms : getChatrooms,
		updateReadStatus : updateReadStatus,
	};

})();