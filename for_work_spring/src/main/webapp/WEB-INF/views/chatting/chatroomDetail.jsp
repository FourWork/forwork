<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
  <head>
  	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
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
		
		.filebox input[type="file"] { /* 파일 필드 숨기기 */ 
			position: absolute; 
			width: 1px; 
			height: 1px; 
			padding: 0; 
			margin: -1px; 
			overflow: hidden; 
			clip:rect(0,0,0,0); 
			border: 0; 
		}

    </style>
  </head>
  <body>
  	<div id="chatroom-title-container">
  		<span id="chatroom-title" data-chatroom-id="${chatroomId }" >${chatroomName }</span>
  	</div>
  	<div class="chatbox">
		<c:forEach var="message" items="${messages}">
			<div>
				<c:if test="${message.sender.member_id == userId }">
					<span class="bubble my-bubble">${message.message }</span>
				</c:if>
				<c:if test="${message.sender.member_id != userId }">
					<div class="bubble friend-profile friend-name">${message.sender.name }</div>
					<img class="bubble friend-profile" src="../Img/profile.png" width="38">
					<span class="bubble friend-bubble">${message.message }</span>
				</c:if>
			</div>
		</c:forEach>
	</div>

	<div class="filebox"> 
		<label for="ex_filename">업로드</label> 
		<input type="file" id="ex_filename" class="upload-hidden" onchange="sendFile()"> 
	</div>

   	<div class="text-box">
   		<input type="text" onkeyup="isEnterKey()" id="message" />
   		<input type="button" onclick="sendMessage()" value="send" id="chat-send" />
     		<div class="clearfix"></div>
   	</div>
	<!-- <input type="button" onclick="disconnect()" value="disconnect"/> -->
	<input type="text" value="${userId }" id="user" style="display:none;">
	<input type="text" value="${member.name }" id="userName" style="display:none;">
   	<div id="filePath" style="display:none;"></div>
   	
  <script type="text/javascript">
  	let chatroomId = document.getElementById("chatroom-title").dataset.chatroomId;
  	let sender = document.getElementById("user").value;
  	let members;
  	
  	document.addEventListener("DOMContentLoaded", function(){
  		let userId = document.getElementById("user").value;
  		let chatroomTitle = document.getElementById("chatroom-title");
  		chattingService.getChatroomName(chatroomId, function(result){
  			chatroomTitle.innerHTML = result.chatroom_name;
  		});
  		
  		let chatbox = document.querySelector(".chatbox");
  		chattingService.getMessages(chatroomId, function(messages){
  			let html = ""
  			messages.forEach( msg => {
  				if (msg.sender.member_id == userId){
  					console.log(msg)
  					if (msg.file_path){
  						html += '<a href="/message/file/download?fileName=' + msg.file_path + '">' + '<span class="bubble my-bubble">' + msg.message + '</span></a>'
  					} else {
  						html += '<span class="bubble my-bubble">' + msg.message + '</span>'
  					}
  				} else {
  					html += 
	  	  					'<div class="bubble friend-profile friend-name">' + msg.sender.name + '</div>'
	  						+ '<img class="bubble friend-profile" src="/resources/Img/profile.png" width="38">';
  					if (msg.file_path){
  						html += '<a href="/message/file/download?fileName=' + msg.file_path + '"><span class="bubble friend-bubble">' + msg.message + '</span><a/>';
  					} else{
  						html += '<span class="bubble friend-bubble">' + msg.message + '</span>';
  					}
  				}
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
  		/* setConnected(true); */
  		console.log('connected: ' + frame);
  		stompClient.subscribe("/topic/chatroom/" + chatroomId, function(response){
  			showMessage(JSON.parse(response.body));
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
  		console.log(msg);
		let chatBubble = document.createElement('span');
    	
        chatBubble.innerHTML =  msg.message;   
        chatBubble.classList.add('bubble');
        
        if (msg.sender.member_id == sender){
        	chatBubble.classList.add('my-bubble');
  		} else {
  			let name = document.createElement('div');
  	    	let img = document.createElement('img');
  	    	
  			chatBubble.classList.add('friend-bubble');
  			name.innerHTML = msg.sender.name;
  	        name.classList.add('bubble');
  	        name.classList.add('friend-profile');
  	        name.classList.add('friend-name');
  	        
  	        img.src = '/resources/Img/profile.png';
  	        img.width = 38;
  	      	img.classList.add('bubble');
	        img.classList.add('friend-profile');
	  	    document.querySelector('.chatbox').appendChild(name);
	        document.querySelector('.chatbox').appendChild(img);
  		}
        document.querySelector('.chatbox').appendChild(chatBubble);
        readMessage(msg.message_id);
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
  			console.log("here")
  			console.log(result);
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

  	
  	/* 
  	webSocket.onclose = function(){
  	}
  	webSocket.onerror = function(){
  	}
  	
  	// TODO: 시간 단위(1시간?)만큼의 메세지 불러와서 띄워주기
  	function loadMessage(){
  		
  	}

  	function disconnect(){
  		webSocket.close();
  	} */
  	
  </script>
   </body>
</html>
<%@ include file="../footer.jsp" %>