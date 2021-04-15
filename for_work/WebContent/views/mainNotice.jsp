<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4WORK NOTICE</title>
</head>
<body>
	<h3>공지 사항</h3>
	
	
	<c:forEach var="noticePre" items="${noticePre}">
		<div>번호 : ${noticePre.post_id}</div>
		<div><a href="detailAction.do?post_id=${noticePre.post_id}&board_id=${noticePre.board_id}">제목 : ${noticePre.post_title}</a></div>
		<div>내용 : ${noticePre.post_content}</div>
		<div>날짜 : ${noticePre.post_date}</div>
		<br>
	</c:forEach>
	
</body>
</html>