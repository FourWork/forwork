<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style type="text/css">
.header {
	background-color: #EAEAEA;
}

td {
	border: 1px solid gray;
	text-align: center;
}

table {
	border-collapse: collapse;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	font-weight: bold;
}

.seq, .hitcount {
	min-width: 50px;
}

.writer {
	min-width: 80px;
}

.title {
	min-width: 200px;
}

.regdate {
	min-width: 150px;
}
</style>
</head>
<body>
	<a href="insertPost.do">글쓰기</a>

	<ul>
		<c:forEach var="boardMenu" items="${boardMenu}">
			<li><a
				href="listAction.do?project_id=${boardMenu.project_id}&board_id=${boardMenu.board_id}">${boardMenu.board_name}</a></li>
		</c:forEach>
	</ul>
	<a href="boardManagerAction.do?project_id=${boardName.project_id}">게시판 관리</a>

	<h2>${boardName.board_name}</h2>
	<a
		href="insertPost.do?project_id=${boardName.project_id}&board_id=${boardName.board_id}">글
		작성하기</a>
	<table>
		<tr>
			<td class="header seq">글 번호</td>
			<td class="header title">글 제목</td>
			<td class="header writer">작성자</td>
			<td class="header regdate">작성일</td>
			<td class="header hitcount">조회수</td>
		</tr>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.post_id}</td>
				<td><a href="detailAction.do?post_id=${board.post_id}&board_id=${boardName.board_id}">${board.post_title}</a></td>
				 <td>${board.post_writer}</td>
				<td><fmt:parseDate var="dt" value="${board.post_date}"
						pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate> <fmt:formatDate
						value="${dt}" pattern="yyyy.MM.dd HH:mm" /></td>
				<td>${board.hitcount}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<!-- 페이징 영역 -->
	<!-- 이전 영역 -->
	<%-- 	<c:if test="${listModel.startPage > 5}">
		<a href="listAction.do?pageNum=${listModel.startPage - 1}">[이전]</a>
	</c:if>

	<!-- 페이지 목록 -->
	<c:forEach var="pageNo" begin="${listModel.startPage}"
		end="${listModel.endPage}">
		<c:if test="${listModel.requestPage == pageNo}">
			<b>
		</c:if>
		<a href="listAction.do?pageNum=${pageNo}">[${pageNo}]</a>
		<c:if test="${listModel.requestPage == pageNo}">
			</b>
		</c:if>
	</c:forEach>

	<!-- 다음 영역 -->
	<c:if test="${listModel.endPage < listModel.totalPageCount}">
		<a href="listAction.do?pageNum=${listModel.endPage + 1}">[다음]</a>
	</c:if> --%>
	<br>
	<br>

	<!-- 	<form action="listAction.do" method="post">
		<input type="checkbox" name="area" value="title" id="title"><label
			for="title">제목</label> <input type="checkbox" name="area"
			value="writer" id="writer"><label for="writer">작성자</label> <input
			type="text" name="searchKey" size="10"> <input type="submit"
			value="검색">
	</form> -->
</body>
</html>