<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<c:forEach var="chatroom" items="${chatrooms}">
			<a href="ChatroomDetail.do?chatroomId=${chatroom.chatroom_id}"><li>${chatroom.chatroom_name }</li></a>
		</c:forEach>
	</ul>
</body>
</html>