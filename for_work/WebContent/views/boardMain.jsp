<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="header.jsp"%>
<%
	int project_id = Integer.parseInt(request.getParameter("project_id"));
	request.setAttribute("project_id", project_id);
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>

<style type="text/css">

.boardMenuList {
	border: 2px solid gray;
	min-height: 450px;
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

.noticePreList, .boardPreList {
	margin-top: 20px;
	width: 900px;
}

.title {
	font-size: 20px;
	font-weight: bold;
	margin-top: 30px;
}
.container a {
	text-decoration: none;
	color: #000;
}

.container a:hover {
	font-weight: bold;
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
						
							<c:forEach var="boardMenu" items="${boardMenu}">
								<li class="list-group-item">
									<a href="listAction.do?project_id=${boardMenu.project_id}&board_id=${boardMenu.board_id}">
									<i class="bi bi-clipboard"></i> ${boardMenu.board_name}</a></li>
							</c:forEach>
							
						</ul>
						<a href="boardManagerAction.do?project_id=${project_id}" class="boardManagerBtn"> 
							<i class="bi bi-pencil-square"></i> 게시판 관리</a>
					</div>

				</div>
				<div class="col-10">
					<div class="col">
						<div class="col">

							<div class="noticePreList">
								<div>
									<div class="title">공지 사항 </div>
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
											<td style="width: 50%"><a href="detailAction.do?post_id=${noticePre.post_id}&board_id=${noticePre.board_id}&project_id=${project_id}">${noticePre.post_title}</a></td>
											<td>
												<fmt:parseDate var="dt" value="${noticePre.post_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
												<fmt:formatDate value="${dt}" pattern="yyyy.MM.dd"/>
											</td>
										</tr>
									</c:forEach>
								</table>

							</div>
							<!-- noticePre -->

						</div>
						<!-- col -->

						<div class="col">

							<div class="boardPreList">

								<div class="boardPre">
									<div>
										<div class="title">최신 글</div>
									</div>
									<table class="table table-hover">
										<tr>
											<th>No.</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
										<c:forEach var="boardList" items="${boardList}">
											<tr>
												<td>${boardList.post_id}</td>
												<td>
													<a href="detailAction.do?post_id=${boardList.post_id}&board_id=${boardList.board_id}&project_id=${project_id}">
													${boardList.post_title}</a>
												</td>
												<td>${boardList.post_writer}</td>
												<td>
													<fmt:parseDate var="dt" value="${boardList.post_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
													<fmt:formatDate value="${dt}" pattern="yyyy.MM.dd HH:mm"/>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>

							</div>
							<!-- boardPreList -->

						</div>
						<!-- col -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>