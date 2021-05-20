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
<script type="text/javascript">

function list() {
	window.location.href = "listAction.do?project_id=${board.project_id}&board_id=${post.board_id}";
}

</script>

<style type="text/css">

* {
	box-sizing: border-box;
}

.container {
	margin: 0px;
}

.list-group-item {
	height: 37px;
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

.container a {
	text-decoration: none;
	color: #000;
}

.container a:hover {
	font-weight: bold;
}

.postWrap {
	margin-top: 30px;
	padding-left: 40px;
	position: relative;
}

.title {
	font-size: 15px;
	margin-bottom: 20px;
}

.postTitle {
	font-weight: bold;
	font-size: 20px;
	width: 900px;
}

table {
	border-collapse: collapse;
	margin-bottom: 20px;
}

td {
	border-bottom: 1px solid gray;
	padding: 5px;
}

.contentBox {
	min-height: 300px;
	padding: 20px;
}

.btnArea {
	position: relative;
}

.editBtn {
	position: absolute;
	top: 0px;
	right: 0px;
}

.listBtn {
	position: absolute;
	left: 10px;
}

</style>
<title>Insert title here</title>
</head>
<body>

	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-2">

					<div class="boardMenuList">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><a href="boardMainAction.do?project_id=${project_id}"><i class="bi bi-house-door"></i> 게시판 홈</a></li>
							<c:forEach var="boardMenu" items="${boardMenu}">
								<li class="list-group-item"><a
									href="listAction.do?project_id=${boardMenu.project_id}&board_id=${boardMenu.board_id}">
										<i class="bi bi-clipboard"></i> ${boardMenu.board_name}
								</a></li>
							</c:forEach>
						</ul>
						<a href="boardManagerAction.do?project_id=${project_id}"
							class="boardManagerBtn"> <i class="bi bi-pencil-square"></i>
							게시판 관리
						</a>
					</div>

				</div>
				<div class="col-10">
					<div class="postWrap">
						<div class="title">${board.board_name}</div>
						
						<form action="updatePostAction.do" method="post" id="editPost">
							<input type="hidden" name="board_id" value="${post.board_id}">
							<input type="hidden" name="project_id" value="${board.project_id}">
							<input type="hidden" name="post_id" value="${post.post_id}">
							<input type="hidden" name="post_writer" value="${post.post_writer}">
						<table>
							<tr>
								<td colspan="3" class="postTitle">
									<input type="text" name="post_title" size="100" value="${post.post_title}">
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<div class="contentBox">
										<textarea rows="10" cols="120" name="post_content">${post.post_content}</textarea>
									</div>
								</td>
							</tr>
						</table>
						
						</form>
						<div class="btnArea">
							<div class="listBtn">
								<button onclick="list()">목록</button>
							</div>
							<div class="editBtn">
								<button onclick="editPost.submit()">저장</button>
							</div>
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
