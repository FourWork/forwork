<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	session.setAttribute("userId", "1");
	session.setAttribute("chatroomId", "3");
%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title>chatting</title>
  </head>
  <body>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
    <textarea id="chattingRoom" rows="10" cols="50">
    
    </textarea>
    	<input type="text" id="message" />
   		<input type="button" onclick="sendMessage()" value="send"/>
   		<input type="button" onclick="disconnect()" value="disconnect"/>
  <script type="text/javascript">
  	
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
  	// 소켓에 들어온메세지가 있을 때
  	webSocket.onmessage = function(message){
  		console.log(message);
  		let parsedMsg = JSON.parse(message.data);
  		chatRoom.value += "Recevied From Server " + parsedMsg.content + "\n";
  	}
  	
  	function sendMessage(){
  		let date = new Date();
  		let sendTime = moment(date).format('YYYY-MM-DD HH:mm:ss');
  		let msg = {
  			"content": message.value,
  			"sender": "1",
  			"chatroomId": "3",
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