<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

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

.list-group-item {
	height: 37px;
}

.managerWrap {
	margin: 15px 0px 0px 30px;
	padding: 20px;
	position: relative;
}

.boardEditList {
	border: 1px solid gray;
	padding: 20px;
	margin-top: 20px;
	width: 500px;
	min-height: 400px;
	border-radius: 20px;
	font-weight: bold;
}

#addBoard {
	position: absolute;
	right: 100px;
}

.title {
	margin-bottom: 30px;
	font-size: 20px;
}

.contentLine, .clickLine {
	display: inline-block;
}

.container a {
	text-decoration: none;
	color: #000;
}

.container a:hover {
	font-weight: bold;
}

.bi-clipboard-plus:hover {
	font-weight: bold;
	color: red;
	font-size: 17px;
}

.contentLine {
	width: 150px;
	height: 30px;
	line-height: 20px;
	padding: 7px;
}

.boardMenuList {
	padding: 10px;
}

.container {
	margin: 0px;
}

.boardMenuList {
	border: 2px solid gray;
	min-height: 450px;
	width: 185px;
	margin-top: 40px;
	font-size: 14px;
	position: relative;
	padding: 10px;
	border-radius: 10px;
	position: relative;
	left: 10px;
}

.boardManagerBtn {
	position: absolute;
	bottom: 10px;
	left: 10px;
}

button {
	border: none;
	background-color: #fff;
}

.bi-pencil, .bi-trash {
	color: #000;
	font-size: 13px;
}

.bi-pencil:hover, .bi-trash:hover {
	font-size: 15px;
	color: rad;
	font-weight: bold;
}

</style>

<title>4WORK | 게시판 관리</title>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-2">

					<div class="boardMenuList">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><a
								href="boardMainAction.do?project_id=${project_id}"><i
									class="bi bi-house-door"></i> 게시판 홈</a></li>
							<c:forEach var="boardMenu" items="${boardMenu}">
								<li class="list-group-item"><a
									href="listAction.do?project_id=${boardMenu.project_id}&board_id=${boardMenu.board_id}">
										<i class="bi bi-clipboard"></i> ${boardMenu.board_name}
								</a></li>
							</c:forEach>
						</ul>
						<a href="boardManagerAction.do?project_id=${project_id}"
							class="boardManagerBtn"><i class="bi bi-pencil-square"></i>
							게시판 관리</a>
					</div>

				</div>
				<div class="col-10">
					<div class="managerWrap">
						<div class="title">게시판 관리</div>

						<div class="boardEditList">
							<form action="updateBoardAction.do" method="post">
								<input type="hidden" name="project_id" value="${board.project_id}">
								<input type="hidden" name="board_id" value="${board.board_id}">
								게시판 이름 변경<br>
								<input type="text" size=25 name="board_name" value="${board.board_name}"> <input type="submit" value="저장">
							</form>
							<br>
							<c:forEach var="boardMenu" items="${boardMenu}">
								<div class="contentBox">
									<div class="contentLine">${boardMenu.board_name}</div>
									<div class="clickLine">
										<a
											href="updateBoardFormAction.do?board_id=${boardMenu.board_id}&project_id=${boardMenu.project_id}"><i class="bi bi-pencil"></i></a> <a
											href="deleteBoardAction.do?project_id=${boardMenu.project_id}&board_id=${boardMenu.board_id}"><i class="bi bi-trash"></i></a>
									</div>
								</div>
							</c:forEach>
						</div>
						
					</div>
				</div>
				<!-- col-10 -->
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>