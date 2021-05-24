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
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
	margin-bottom: 10px;
}

.postTitle {
	font-weight: bold;
	font-size: 20px;
	width: 900px;
}

table {
	border-collapse: collapse;
	margin-bottom: 20px;
	clear: both;
	position: absolute;
	top: 70px;
}

td {
	border-bottom: 1px solid gray;
	padding: 5px;
}

.contentBox {
	min-height: 200px;
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
	left: 5px;
}

.editBtn button {
	margin-left: 10px;
}

#realListBtn, .realEditBtn, #removeBtn {
	border: none;
	border-radius: 7px;
	width: 60px;
	height: 30px;
	font-size: 14px;
}

button:HOVER {
	background-color: gray;
}

.commentWrap {
	margin: 10px 0px 0px 245px;
	position: relative;
	top: -100px;
	width: 880px;
}

.writeCommentBtn, .editCommentBtn {
	position: absolute;
	right: 15px;
	top: 14px;
	width: 80px;
	height: 78px;
	border: 1px solid #D8D8D8;
	border-radius: 7px;
	text-align: center;
	line-height: 78px;
	font-size: 15px;
	background-color: #EAEAEA;
	cursor: pointer;
}

.writeCommentBtn:HOVER, .editCommentBtn:HOVER {
	background-color: #C6C6C6;
}

.writeCommentBox {
	border: 1px solid gray;
	border-radius: 5px;
	height: 105px;
	width: 880px;
}

.writeTextarea, .editTextarea {
	border: none;
	position: absolute;
	top: 15px;
	left: 15px;
	overflow: auto;
}

.commentInfo {
	list-style: none;
	padding: 20px 0px;
	border-bottom: 1px solid gray;
	cursor: pointer;
	position: relative;
	max-height: 210px;
}

ul {
	padding: 0px 20px;
}

.memberName, .commentDate {
	display: inline-block;
}

.memberName {
	font-weight: bold;
	margin-right: 7px;
}

.commentDate {
	font-size: 13px;
}

.commentListBox {
	border: 1px solid gray;
	border-radius: 8px;
	margin-top: 15px;
}

.commentSection {
	margin: 0px;
}

.commentEdit {
	position: absolute;
	top: 20px;
	right: 50px;
	font-size: 14px;

}
.commentDel {
	position: absolute;
	top: 20px;
	right: 15px;
	font-size: 14px;
}

.commentEdit:HOVER, .commentDel:HOVER {
	font-weight: bold;
}

.editArea {
	border: 1px solid gray;
	position: relative;
	border-radius: 5px;
	height: 110px;
	width: 838px;
	margin-top: 15px;
	display: none;
}

.pagingBtnArea {
	position: relative;
	top: 10px;
}

.pagingBtnArea div {
	float: right;
	margin-right: 3px;
}

.pagingBtnArea button {
	min-width: 40px;
	height: 40px;
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
						
						<div class="btnArea">
							<div class="listBtn">
								<button id="realListBtn">목록</button>
							</div>
							<div class="editBtn">
								<button class="realEditBtn">수정</button>
								<button id="removeBtn" type="button">삭제</button>
							</div>
						</div>						
						
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
					</div>
					<!-- postWrap end -->					
				</div>
				<!-- col-10 -->
			</div>
			
			<div class="row">
			
				<div class="commentWrap">
					
					<div class="writeCommentBox">
						<textarea rows="3" cols="102" name="commentContent" class="writeTextarea"></textarea>
						<div class="writeCommentBtn">등록</div>
					</div>
					
					<div class="commentListBox">
						<ul class="commentSection">
							<li class="commentInfo">
								<div class="memberName">member01</div>
								<div class="commentDate">2021-05-20 09:54</div>
								<div class="commentEdit">수정</div>
								<div class="commentDel">삭제</div>
								<div class="commentContent">Hello!</div>
								<div class="editArea">
									<textarea rows="3" cols="95" name="commentEditContent" class="editTextarea">Hello!</textarea>
									<div class="editCommentBtn">수정</div>
								</div>
								<input type='hidden' name='comment_id' value='9'>								
							</li>
						</ul>
					</div>
						
					<div class="pagingBtnArea">

					</div>
					
				</div>
				<!-- comment wrap end -->
				
			
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
	</div> 
	<!-- board modal end -->

	<script type="text/javascript" src="/resources/js/post.js"></script>
	<script type="text/javascript" src="/resources/js/comment.js"></script>
	
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
	
	<script type="text/javascript">
		
		var pno = '<c:out value="${post.post_id}"/>';
		var commentUL = $(".commentSection");
		var newComment = $("textarea[name='commentContent']");
		var member_id = 9;
		
		showList(1);
		
		function showList(page) {
			
			console.log("show list " + page)
			
			commentService.getList({post_id:pno, page:page||1}, function(data) {
				
				var commentCnt = data.commentCnt;
				var list = data.list;
				
				if (page == -1) {
					pageNum = Math.ceil(commentCnt/5.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				
				if (list == null || list.length == 0) {
					commentUL.html("");
					$(".commentListBox").hide();
					return;
				}
				
				$(".commentListBox").show();
				
				for (var i = 0, len = list.length || 0; i < len; i++) {
					str += "<li class='commentInfo'>";
					str += "<div class='memberName'>member" + list[i].member_id + "</div>";
					str += "<div class='commentDate'>" + list[i].comment_date + "</div>";
					
					str += "<div class='commentEdit'>수정</div>";
					str += "<div class='commentDel'>삭제</div>";
					
					str += "<div class='commentContent'>" + list[i].comment_content + "</div>";
					
					str += "<div class='editArea'>";
					str += "<textarea rows='3' cols='95' name='commentEditContent' class='editTextarea'>" + list[i].comment_content + "</textarea>";
					str += "<div class='editCommentBtn'>수정</div></div>";
						
					str += "<input type='hidden' name='comment_id' value='" + list[i].comment_id + "'></li>";
				}
				
				commentUL.html(str);
				showCommentPage(commentCnt);
				
				$(".commentInfo:last").css("border", "none");
				
				
			}); // end function
			
		} // end showList
 		
		var pageNum = 1;
		var commentPage = $(".pagingBtnArea");
		
		function showCommentPage(commentCnt) {
			var endNum = Math.ceil(pageNum / 5.0) * 5;
			var startNum = endNum - 4;
			
			var prev = startNum != 1;
			var next = false;
			
			if (endNum * 5 >= commentCnt) {
				endNum = Math.ceil(commentCnt/5.0);
			}
			
			if (endNum * 5 < commentCnt) {
				next = true;
			}
			
			var str = '<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">';
			
			if (prev) {
				str += '<div class="btn-group me-2" role="group" aria-label="First group">';
				str += '<a href="' + (startNum - 1) + '"><button type="button" class="btn btn-outline-secondary pagingBtn">이전</button></a></div>';
			}
			
			for(var i = startNum; i <= endNum; i++) {
				var active = pageNum == i ? "active" : "";
				
				str += '<div class="btn-group me-2" role="group" aria-label="Second group">';
				str += '<a href="' + i + '"><button type="button" class="btn btn-outline-secondary pagingBtn ' + active + '">' + i + '</button></a></div>'
			}
			
			if (next) {
				str += '<div class="btn-group me-2" role="group" aria-label="Third group">';
				str += '<a href="' + (endNum + 1) + '"><button type="button" class="btn btn-outline-secondary pagingBtn">다음</button></a></div>';
			}
			
			str += "</div>";
			
			commentPage.html(str);
			
		} // end showCommentPage
		
		commentPage.on("click", "a", function(e) {
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			console.log("targetPageNum: " + targetPageNum);
			
			pageNum = targetPageNum;
			showList(pageNum);
		});
 		
		$(".writeCommentBtn").on("click", function(e) {
			
			if (!newComment.val()) {
				alert("내용을 입력하세요.");
				return;
			}
			
			var comment = {
					comment_content:newComment.val(),
					member_id:member_id,
					post_id:pno
			};
			
			commentService.add(comment, function(result) {
				alert(result);
				
				newComment.val("");
				
				showList(-1);
			});
		});
		
			
	 		$(document).on("click", ".commentEdit", function(e) {
	 			$(".editArea").not($(this).parent().find(".editArea")).hide();
				$(".editArea").filter($(this).parent().find(".editArea")).toggle();							 				
	 		});
		
	 		$(document).on("click", ".editCommentBtn", function(e) {
	 			var comment_id = $(this).parent().parent().find("input[name='comment_id']").val();
	 			var editAreaText = $(this).parent().find("textarea[name='commentEditContent']");
	 			
	 			var comment = {comment_id:comment_id, comment_content:editAreaText.val()};
	 			
	 			commentService.update(comment, function(result) {
	 				if (result == 'success') alert("댓글이 수정되었습니다.");
	 				showList(pageNum);
	 			});
	 		});
	 		
	 		$(document).on("click", ".commentDel", function(e) {
	 			var comment_id = $(this).parent().find("input[name='comment_id']").val();
	 			
	 			var check = confirm("정말 삭제하시겠습니까?");		
	 			if (check) {
		 			commentService.remove(comment_id, function(result) {
		 				if (result == 'success') alert("댓글이 삭제되었습니다.");
		 				showList(pageNum);
		 			});	 				
	 			}
	 			
	 		});
			
		
 		
		
	</script>
	
</body>
</html>
<%@ include file="../footer.jsp"%>
