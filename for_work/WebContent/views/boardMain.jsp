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

	<ul>
		<c:forEach var="boardMenu" items="${boardMenu}">
			<li><a
				href="listAction.do?project_id=${boardMenu.project_id}&board_id=${boardMenu.board_id}">${boardMenu.board_name}</a></li>
		</c:forEach>
	</ul>
	
	<a href="boardManagerAction.do?project_id=${boardName.project_id}">게시판 관리</a>
	
	<c:forEach var="noticePre" items="${noticePre}">
		<ul>
			<li><a href="detailAction.do?post_id=${noticePre.post_id}&board_id=${noticePre.board_id}">${noticePre.post_title}</a></li>
			<li>${noticePre.post_content}</li>
			<li>${noticePre.post_date}</li>
		</ul>
	</c:forEach>

	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	<c:forEach var="boardList" items="${boardList}">
		<tr>
			<td>${boardList.post_id}</td>
			<td><a href="detailAction.do?post_id=${boardList.post_id}&board_id=${boardList.board_id}">${boardList.post_title}</a></td>
			<td>${boardList.post_writer}</td>
			<td>${boardList.post_date}</td>
		</tr>
	</c:forEach>
	</table>
	
</body>
</html>