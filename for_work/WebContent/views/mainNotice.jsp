<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	int project_id = Integer.parseInt(request.getParameter("project_id"));
	request.setAttribute("project_id", project_id);
%>

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

.noticePreList {
	margin-top: 20px;
	width: 600px;
}

.noticePreList a {
	text-decoration: none;
	color: #000;
}

.noticePreList a:hover {
	font-weight: bold;
}

.title {
	font-size: 20px;
	font-weight: bold;
	margin-top: 30px;
}

</style>
<title>4WORK NOTICE</title>
</head>
<body>

	<div class="noticePreList">
		<div>
			<div class="title">공지 사항</div>
		</div>
		<table class="table table-hover">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="noticePre" items="${noticePre}">
				<tr>
					<td>${noticePre.post_id}</td>
					<td style="width: 50%"><a
						href="detailAction.do?post_id=${noticePre.post_id}&board_id=${noticePre.board_id}&project_id=${project_id}">${noticePre.post_title}</a></td>
					<td><fmt:parseDate var="dt" value="${noticePre.post_date}"
							pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate> <fmt:formatDate
							value="${dt}" pattern="yyyy.MM.dd" /></td>
				</tr>
			</c:forEach>
		</table>

	</div>

</body>
</html>
