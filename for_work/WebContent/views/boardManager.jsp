<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>게시판 관리</h1>

	<form action="insertBoardAction.do" method="post">
		<input type="hidden" name="project_id" value="${project_id}">
		새 게시판 <input type="text" size=30 name="board_name"> <input type="submit" value="추가">
	</form>
	
	<c:forEach var="boardMenu" items="${boardMenu}">
		<div>
			${boardMenu.board_name}
			<a href="updateBoardFormAction.do?board_id=${boardMenu.board_id}">수정</a>
			<a href="deleteBoardAction.do?project_id=${boardMenu.project_id}&board_id=${boardMenu.board_id}">삭제</a>
		</div>
	</c:forEach>

	<a href="boardMainAction.do?project_id=${project_id}">게시판 홈</a>
</body>
</html>