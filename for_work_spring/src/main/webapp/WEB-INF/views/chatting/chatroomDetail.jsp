<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<title>chatting</title>
<style type="text/css">
#chatroom-title-container {
	width: 100%;
	background-color: rgb(212, 214, 241);
	height: 80px;
}

#chatroom-title {
	margin-left: 45px;
	line-height: 80px;
	font-weight: bold;
	font-size: 20px;
}

#out {
	float: right;
	background-color: rgb(190, 194, 236);
	padding: 15px;
	border-radius: 10px;
	font-size: 13px;
	text-decoration: none;
	margin-right: 20px;
	margin-top: 20px;
}

}
.bubble {
	margin: 5px 0;
	display: inline-block;
	max-width: 300px;
	font-size: 14px;
	position: relative;
}

.my-bubble {
	background-color: #fff46d;
	border-radius: 14px 14px 0px 14px;
	padding: 7px 15px 7px 15px;
	margin-bottom: 30px;
	float: right;
	clear: both;
}

.friend-bubble {
	background-color: rgb(190, 194, 236);
	border-radius: 14px 14px 14px 0;
	padding: 7px 15px 7px 15px;
	margin-left: 50px;
	margin-top: -45px;
	margin-bottom: 30px;
	float: left;
	clear: both;
}

.friend-profile {
	float: left;
	clear: both;
}

.friend-name {
	margin-left: 60px;
}

.chatbox {
	padding: 10px;
	overflow-y: scroll;
	position: relative;
}

#chat-send {
	background-color: #4a90e2;
	width: 60px;
	height: 60px;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	margin-left: 10px;
	float: left;
}

.text-box {
	background-color: #fafafa;
	padding: 10px;
}

.text-box #message {
	height: 60px;
	float: left;
	width: calc(100% - 70px);
	border-radius: 3px;
	background-color: #ffffff;
	border: solid 0.5px #d7d7d7;
	resize: none;
	padding: 10px;
	font-size: 14px;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: white;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #4a90e2;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox {
	float: right;
	font-size: 11px;
	width: 120px;
	margin-right: 10px;
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.more {
	text-align: center;
	background-color: rgb(190, 194, 236);
	color: white;
	height: 50px;
	line-height: 50px;
}
/* The Modal (background) */
.profile-modal2 {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.profile-modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  margin-left: 40%;
  padding: 20px;
  border: 1px solid #888;
  width: 30%; /* Could be more or less, depending on screen size */
  height: 60%;
}

/* The Close Button */
.profile-close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.profile-close:hover,
.profile-close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.modal-pic {
	margin-left: 20%;
}

.member-detail {
	margin-left: 5%;
}
</style>
</head>
<body>
	<div id="chatroom-title-container">
		<span id="chatroom-title" data-chatroom-id="${chatroomId }"></span>
		<a onclick="out()"><span id="out">나가기</span></a>
	</div>
	<div class="more">
		<a onclick="loadMore()">더 보기</a>
	</div>
	<div class="chatbox"></div>
	
	<div id="profile-modal" class="profile-modal2">
	  <div class="profile-modal-content">
	    <span class="profile-close">&times;</span>
	    <img class="modal-pic" src="/resources/Img/profile.png" width="50%" > <div></div>
	    <br>
	    <div class="member-detail">
	    	User Name: <p id="profile-detail-name"></p>
		   	Email Address: <p id="profile-detail-email"></p>
		    Status: <p id="profile-detail-status"></p>
	    </div>
	  </div>
	</div>

	<div class="filebox">
		<label for="ex_filename">업로드</label> <input type="file"
			id="ex_filename" class="upload-hidden" onchange="sendFile()">
	</div>

	<div class="text-box">
		<input type="text" onkeyup="isEnterKey()" id="message" /> <input
			type="button" onclick="sendMessage()" value="send" id="chat-send" />
		<div class="clearfix"></div>
	</div>
	<!-- <input type="button" onclick="disconnect()" value="disconnect"/> -->
	<input type="text" value="${member.name }" id="userName"
		style="display: none;">
	<div id="filePath" style="display: none;"></div>

	<script type="text/javascript">
  	let chatroomId = document.getElementById("chatroom-title").dataset.chatroomId;
  	let sender = document.getElementById("user").value;
  	let page = 1;
  	const AMOUNT = 20;
  	let members;
  	let chatbox = document.querySelector(".chatbox");
  	
  	document.addEventListener("DOMContentLoaded", function(){
  		let userId = document.getElementById("user").value;
  		let chatroomTitle = document.getElementById("chatroom-title");
  		chattingService.getChatroomName(chatroomId, function(result){
  			chatroomTitle.innerHTML = result.chatroom_name;
  		});
  		
  		let criteria = {
  			"pageNum" : page,
  			"amount" : AMOUNT
  		}
  		page += 1;
  		chattingService.getMessagesWithPaging(criteria, chatroomId, function(messages){
  			let html = ""
  			messages.forEach( msg => {
  				html += showMessage(msg);
  			});
  			chatbox.innerHTML = html;
  			deleteColorOfUnread();
  		});
  		
  		chattingService.updateReadAll(chatroomId, sender, function(result){
  			console.log(result);
  		})
  		
  		chattingService.getMembers(chatroomId, function(result){
  			console.log(result);
  			members = result;
  		})
	});
  	
  	function loadMore(){
  		let criteria = {
  	  			"pageNum" : page,
  	  			"amount" : AMOUNT
  	  	}
  		page += 1;
  		chattingService.getMessagesWithPaging(criteria, chatroomId, function(messages){
  			let html = ""
  			messages.forEach( msg => {
  				html += showMessage(msg);
  			});
  			chatbox.innerHTML = html + chatbox.innerHTML;
  		});
  	}
  	
  	function deleteColorOfUnread(){
  		let unread = document.querySelector('#unread' + chatroomId);
  		if (unread){
  			unread.remove("unread-color");
  		}
  	}

  	let stompClient = null;
  	let socket = new SockJS("/websocket");

  	stompClient = Stomp.over(socket);
  	stompClient.connect({}, function(frame){
  		console.log('connected: ' + frame);
  		stompClient.subscribe("/topic/chatroom/" + chatroomId, function(response){
  			let msg = JSON.parse(response.body);
  			document.querySelector(".chatbox").innerHTML += showMessage(msg);
  			readMessage(msg.message_id);
  		});
  	}, function(error) {
  	    alert(error);
  	}); 
  	
  	function isEnterKey(){
  		if (window.event.keyCode == 13) {
        	sendMessage();
       }
  	}
  	
  	function showMessage(msg){
  		let html = "";
  		if (msg.sender.member_id == userId){
			if (msg.file_path){
				html += '<a href="/message/file/download?fileName=' + msg.file_path + '">' + '<span class="bubble my-bubble">' + msg.message + '</span></a>'
			} else {
				html += '<span class="bubble my-bubble">' + msg.message + '</span>'
			}
		} else {
			html += 
  					'<div class="bubble friend-profile friend-name">' + msg.sender.name + '</div>'
					+ '<img class="bubble friend-profile profile-btn" data-member-id="'+ msg.sender.member_id +'" src="/resources/Img/profile.png" width="38" onclick="clicked(this)">';
			if (msg.file_path){
				html += '<a href="/message/file/download?fileName=' + msg.file_path + '"><span class="bubble friend-bubble">' + msg.message + '</span><a/>';
			} else{
				html += '<span class="bubble friend-bubble">' + msg.message + '</span>';
			}
		}
  		return html;
  	}
  	
  	function sendMessage(){
  	  	let senderName = document.getElementById("userName").value;
  	  	let filePath = document.getElementById("filePath").innerHTML;
  	  	console.log(filePath);
  		let message = (document.getElementById("message").value || document.getElementById('ex_filename').files[0].name);
  		let date = new Date();
  		let sendTime = moment(date).format('YYYY-MM-DD HH:mm:ss');
  		let messageId = "";
  		console.log("sender: " + sender);
  		let saveMsg = {
  		  			"message": message,
  		  			"chatroom_id": chatroomId,
  		  			"send_time": sendTime,
  		  			"sender": sender,
  		  			"file_path": filePath,
  		 }
  		
  		// ajax는 비동기로 데이터 가져오는 걸 시킨 후 다른 일들을 수행하기 때문에
  		// ajax에서 받아온 데이터로 할 작업은 callback에서 해줘야 함
  		chattingService.insertMessage(saveMsg, function(result){
  			console.log("result: " +result);
  			messageId = result;
  			console.log("messageId: " + messageId);
  			
  			let msg = {
  		  			"message_id" : messageId,
  		  			"message": message,
  		  			"chatroom_id": chatroomId,
  		  			"send_time": sendTime,
  		  			"sender" : {
  		  				"member_id": sender,
  		  				"name" : senderName
  		  			}
  		  		}
  		  		console.log(msg);
  		  		stompClient.send("/app/chatroom/" + chatroomId, {}, JSON.stringify(msg))
  		  		members.forEach(mem => {
  		  			stompClient.send("/app/user/" + mem, {}, JSON.stringify(msg))
  		  		})
  		  		document.getElementById("message").value = "";
  		})
  	}
  	
  	function sendFile(){
  		let formData = new FormData();
  		formData.append("file", document.getElementById('ex_filename').files[0]);
  		chattingService.saveFile(formData, function(result){
  			document.getElementById("filePath").innerHTML = result;
  			sendMessage();
  		});
  	}
  
  	// 받은 메세지 하나 읽음 처리 
  	function readMessage(messageId){
  		console.log("sender: " + sender);
  		console.log("message id: " + messageId)
  		chattingService.updateReadStatus(messageId, sender, function(result){
  			console.log(result);
  		})
  	}
  	
  	function out(){
		if(confirm("채팅방을 나가시겠습니까?")){
			chattingService.deleteChatroomMemberRelation(chatroomId, sender, function(result){
				console.log(result);
				let url = "/chatting/tmpMain?userId=" + sender;
				window.location.href = url;
			})
		}
  	}

  	
  	/* 
  	webSocket.onclose = function(){
  	}
  	webSocket.onerror = function(){
  	}
  	
  	function disconnect(){
  		webSocket.close();
  	} */
  	
  	const modal = document.getElementById("profile-modal");
  	const btn = document.querySelector(".profile-btn");
  	const span = document.getElementsByClassName("profile-close")[0];

  	// When the user clicks on the button, open the modal
  	function clicked(event) {
  		let clickedMemberId = event.dataset.memberId;
  		chattingService.getMemberDetail(clickedMemberId, function(result){
  			document.getElementById("profile-detail-name").innerHTML = result.name;
  			document.getElementById("profile-detail-email").innerHTML = result.email;
  			document.getElementById("profile-detail-status").innerHTML = result.status;
  		})
  	  	modal.style.display = "block";
  	}

  	// When the user clicks on <span> (x), close the modal
  	span.onclick = function() {
  	  modal.style.display = "none";
  	}

  	// When the user clicks anywhere outside of the modal, close it
  	window.onclick = function(event) {
  	  if (event.target == modal) {
  	    modal.style.display = "none";
  	  }
  	}
  	
  </script>
</body>
</html>
<%@ include file="../footer.jsp"%>