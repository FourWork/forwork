<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	
	<title>채팅방 목록</title>
	<!-- CSS -->
	<!-- <style type="text/css">
		#chat-list {
			width: 22%;
			height: 780px;
			background-color: rgb(173, 175, 196);
			line-height: 80px;
		}
		
		#chat-list li a {
			color: white !important;
		}
		
		#chat-list li {
			list-style: none;
			padding-left: 46px;
			margin-left: -40px;
		}
		
		#chat-list li:hover {
			opacity: 0.8;
			background-color: rgb(197, 199, 219);
		}
		
	</style> -->
</head>
<body>
	<%-- <div id="chat-list">
	<ul>
		<c:forEach var="chatroom" items="${chatrooms}">
			<li><a href="ChatroomDetail.do?chatroomId=${chatroom.chatroom_id}">${chatroom.chatroom_name }</a></li>
		</c:forEach>
	</ul>
	</div> --%>
</body>
</html>

<%@ include file="/views/footer.jsp" %>