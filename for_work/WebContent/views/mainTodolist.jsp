<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>

<style type="text/css">
* {
	box-sizing: border-box;
}
.doneContent, .todoContent {
	min-width: 150px;
}

.bi {
	color: #000;
}

.bi-check2-circle:hover, .bi-x:hover {
	color: red;
}

.todoLine {
	padding: 10px;
	border-bottom: 1px solid gray;
	clear: both;
	height: 50px;
}

.doneBox, .todoBox {
	clear: both;
}

.todoLine:last-child {
	border-bottom: none;
}

.doneLine {
	padding: 10px;
	border-top: 1px solid gray;
	height: 50px;
}

.todolistBox {
	border: 2px solid gray;
	border-radius: 15px;
	min-height: 500px;
	width: 350px;
	padding: 20px;
	margin: 30px 0px 0px 50px;
}

#addTodolist button {
	border: none;
	background-color: #FFFFFF;
}

.todoContent, .doneContent, .refreshBtn {
	float: left;
	height: 30px;
}

.btn, .allDelBtn {
	float: right;
	padding: 0px;
}

.bi-plus {
	font-size: 20px;
	font-weight: bold;
	color: black;
}

.todoBox {
	margin-top: 10px;
}

.doneContent {
	text-decoration: line-through;
	color: gray;
}

.bi-arrow-counterclockwise:hover, .bi-trash-fill:hover, .bi-plus:hover {
	text-decoration: none;
	color: red;
	font-weight: bold;
}

#inputBox {
	border: 2px solid black;
	border-radius: 10px;
	height: 35px;
}

</style>

<title>4WORK</title>
</head>
<body>

	<div class="todolistBox">
	
		<form action="insertTodolistAction.do" method="post" id="addTodolist">
			<input type="hidden" name="member_id" value="${member_id}"> 
			<input type="text" name="todolist_content" size=31 id="inputBox">
			<button onclick="addTodolist.submit"><i class="bi bi-plus"></i></button>
		</form>
		
		<div class="todoBox">
			<div class="refreshBtn"><a href="allTodolistAction.do?member_id=${member_id}"><i class="bi bi-arrow-counterclockwise"></i></a></div>
			<div class="allDelBtn">done list<a href="deleteAllDonelistAction.do?member_id=${member_id}"><i class="bi bi-trash-fill"></i></a></div>
				<c:forEach var="doing" items="${doing}">
					<div class="todoLine">
						<div class="todoContent">${doing.todolist_content}</div>
						<div class="btn">
						<a href="updateDonelistAction.do?todolist_id=${doing.todolist_id}&member_id=${member_id}"><i class="bi bi-check2-circle"></i></a>
						<a href="deleteTodolistAction.do?todolist_id=${doing.todolist_id}&member_id=${member_id}"><i class="bi bi-x"></i></a>
						</div>
					</div>
				</c:forEach>
		</div>

		<div class="doneBox">
				<c:forEach var="done" items="${done}">
					<div class="doneLine">
						<div class="doneContent">${done.todolist_content}</div> 
						<div class="btn"><a href="deleteTodolistAction.do?todolist_id=${done.todolist_id}&member_id=${member_id}"><i class="bi bi-x"></i></a></div>
					</div>
				</c:forEach>
		</div>
		
	</div>

</body>
</html>
