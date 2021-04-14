<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/header.jsp" %>
<%
	/* String chatroomId = request.getParameter("chatroomId"); */
	/* session.setAttribute("userId", "1");
	session.setAttribute("chatroomId", chatroomId); */
%>
<!DOCTYPE html>
<html>
  <head>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <title>chatting</title>
    <style type="text/css">
    	#chatroom-title {
    		width: 100%;
    		background-color: rgb(197, 199, 219);
    		height: 80px;
    	}
    </style>
  </head>
  <body>
  	<div id="chatroom-title">
  		dsdf
  	</div>
  	<ul>
		<c:forEach var="message" items="${messages}">
			<li>${message.message }</li>
		</c:forEach>
	</ul>
	
    <textarea id="chattingRoom" rows="10" cols="50">
    </textarea>
    	<input type="text" id="message" />
   		<input type="button" onclick="sendMessage()" value="send"/>
   		<input type="button" onclick="disconnect()" value="disconnect"/>
   		<input type="text" value="${userId }" id="user">
  <script type="text/javascript">
  	let sender = document.getElementById("user").value;
  	let webSocket = new WebSocket("ws://localhost:8081/for_work/broadsocket");
  	
  	let chatRoom = document.getElementById("chattingRoom");
  	let message = document.getElementById("message");
  	
  	webSocket.onopen = function(){
  		chatRoom.value += "connected to server...\n"
  	};
  	
  	webSocket.onclose = function(){
  		chatRoom.value += "disconnected...\n";
  	}
  	webSocket.onerror = function(){
  		chatRoom.value += "error....\n";
  	}
  	// 소켓에 들어온 메세지가 있을 때
  	webSocket.onmessage = function(message){
  		let parsedMsg = JSON.parse(message.data);
  		if (parsedMsg.sender == sender){
  			chatRoom.value += "나: " + parsedMsg.content + "\n";
  		} else {
  			chatRoom.value += parsedMsg.sender + ": " + parsedMsg.content + "\n";	
  		}
  	}
  	
  	// TODO: 시간 단위(1시간?)만큼의 메세지 불러와서 띄워주기
  	function loadMessage(){
  		
  	}
  	
  	function sendMessage(){
  		let url = document.location.href;
  		let param = url.substring(url.indexOf('chatroomId=') + 11);
  		console.log(param);
  		let date = new Date();
  		let sendTime = moment(date).format('YYYY-MM-DD HH:mm:ss');
  		console.log("sender: " + sender);
  		let msg = {
  			"content": message.value,
  			"sender": sender,
  			"chatroomId": param,
  			"sendTime": sendTime
  		}
		webSocket.send(JSON.stringify(msg));
  	}
  	
  	function disconnect(){
  		webSocket.close();
  	}
  	
  </script>
   </body>
</html>
<%@ include file="/views/footer.jsp" %>