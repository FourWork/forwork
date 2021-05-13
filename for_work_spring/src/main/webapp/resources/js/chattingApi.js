/**
 * 
 */
 
 // 즉시 실행되는 함수
let chattingService = (function() {

	function getMessages(chatroomId, callback, error) {
		$.ajax({
			type : 'get',
			url : '/message/chatroom/' + chatroomId,
			datatType : "json",
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
		getMessages : getMessages
	};

})();