<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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
	right: 10px;
}
.listBtn {
	position: absolute;
	left: 10px;
}
.editBtn button {
	margin-left: 15px;
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
							<li class="list-group-item"><a href="main?project_id=${board.project_id}"><i class="bi bi-house-door"></i> 게시판 홈</a></li>
							<c:forEach var="menu" items="${menu}">
								<li class="list-group-item">
									<a href="list?project_id=${menu.project_id}&board_id=${menu.board_id}">
									<i class="bi bi-clipboard"></i> ${menu.board_name}</a></li>
							</c:forEach>
						</ul>
						<a href="manager?project_id=${board.project_id}" class="boardManagerBtn"><i class="bi bi-pencil-square"></i> 게시판 관리</a>
					</div>

				</div>
				<div class="col-10">
					<div class="postWrap">
						<div class="title">${board.board_name}</div>
						
						<table>
							<tr>
								<td colspan="3" class="postTitle">${post.post_title}</td>
							</tr>
							<tr>
								<td style="width: 70px; font-size: 13px">${post.post_writer}</td>
								<td style="width: 70px; font-size: 13px">조회 ${post.hitcount}</td>
								<td style="font-size: 13px">
									<fmt:parseDate var="dt" value="${post.post_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate> 
									<fmt:formatDate value="${dt}" pattern="yyyy.MM.dd HH:mm" />
								</td>
							</tr>
							<tr>
								<td colspan="3"><div class="contentBox">${post.post_content}</div></td>
							</tr>
						</table>
						
						<div class="btnArea">
							<div class="listBtn">
								<button>목록</button>
							</div>
							<div class="editBtn">
								<button class="realEditBtn">수정</button>
								<button id="removeBtn" type="button">삭제</button>
							</div>
						</div>
						
					</div>
				</div>
				<!-- col-10 -->
			</div>
		</div>
	</div>
	
	<form id="actionForm" action="/board/list" method="get">
		<input type="hidden" name="project_id" value="${board.project_id}">
		<input type="hidden" name="board_id" value="${board.board_id}">
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
		<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
	</form>
	
	<form id="actionUpdateForm" action="/board/updatePost" method="get">
		<input type="hidden" name="project_id" value="${board.project_id}">
		<input type="hidden" name="board_id" value="${board.board_id}">
		<input type="hidden" name="post_id" value="${post.post_id}">
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="type" value='<c:out value="${cri.type}"/>'>
		<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
	</form>
	
		<!-- board modal -->
	<div class="modal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">게시글 삭제</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p>글을 삭제하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="cancelBtn">취소</button>
	        <button type="button" class="btn btn-primary" id="realRemoveBtn">삭제</button>
	      </div>
	    </div>
	  </div>
	</div> <!-- board modal end -->
	

	<script type="text/javascript" src="/resources/js/post.js"></script>
	
	<script type="text/javascript">
	
		$(document).ready(function() {
			var post_id = '<c:out value="${post.post_id}"/>';
			var removeBtn = $("#removeBtn");
			var realRemoveBtn = $("#realRemoveBtn");
			var modal = $(".modal");
			
			removeBtn.on("click", function(e) {
				
				$(".modal").modal("show");
				
				$("#cancelBtn").on("click", function(e) {
					$(".modal").modal("hide");
				});
				
				realRemoveBtn.on("click", function(e) {
					
					postService.remove(post_id, function(result) {
						if (result == "success") alert("게시글이 삭제되었습니다.");
						modal.modal("hide");
						
						$("#actionForm").submit();
					});
					
				});
				
			});
			
			$(".listBtn button").on("click", function(e) {
				e.preventDefault();
				$("#actionForm").submit();
			});
			
			$(".realEditBtn").on("click", function(e) {
				e.preventDefault();
				$("#actionUpdateForm").submit();
			});
		});
	
	</script>
	
</body>
</html>
<%@ include file="../footer.jsp"%>