<!doctype html>
<%@page import="org.forwork.socket.WebSocket" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    -->
    <textarea id="message" rows="10" cols="50">
    
    </textarea>
    	<input type="text" name="msg" id="texts" />
   		<input type="submit" onclick="sendMessage()" value="send"/>
   		<input type="submit" onclick="disconnect()" value="disconnect"/>
  
  <script type="text/javascript">
  	
  	let webSocket = new WebSocket("ws://localhost:8081/for_work/websocket");
  	
  	let messageArea = document.getElementById("message");
  	
  	webSocket.onopen = function(message){
  		messageArea.value += "server connect...\n";	
  	};
  	
  	webSocket.onclose = function(message){
  		messageArea.value += "server disconnect...\n";
  	}
  	webSocket.onerror = function(message){
  		messageArea.value += "error....\n";
  	}
  	webSocket.onmessage = function(message){
  		messageArea.value += "Recevied From Server " + message.data + "\n";
  	}
  	
  	function sendMessage(){
  		var message = document.getElementById("texts");
  		messageArea.value += "send to server " + message.value + "\n";
  		webSocket.send(message.value);
  		message.value = "";
  	}
  	
  	function disconnect(){
  		webSocket.close();
  	}
  	
  </script>
   </body>
</html>