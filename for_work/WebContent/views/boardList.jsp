<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="header.jsp"%>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

<link rel="stylesheet" href="CSS/boardStyle.css" type="text/css">

<div class="wrap">
	<div class="container">
		<div class="row">
			<div class="col-2">
				<div class="boardMenu">
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><a href="#"><i
								class="bi bi-house-door"></i> 홈</a></li>
						<li class="list-group-item"><a href="#"><i
								class="bi bi-check2-square"></i> 공지 사항</a></li>
						<li class="list-group-item"><a href="#"><i
								class="bi bi-clipboard"></i> 기본 게시판</a></li>
					</ul>
					<a href="#" class="boardMenuPlus"><i
						class="bi bi-plus-square-dotted"></i></a>
				</div>
			</div>
			<div class="col-10">
				<div class="listWrap">
					<div class="boardName">기본 게시판</div>
					<form action="" method="post" class="searchBar">
						<input type="checkbox" name="area" value="title" id="title"><label for="title">제목</label>
						<input type="checkbox" name="area" value="writer" id="writer"><label for="writer">작성자</label> 
						<input type="text" name="searchKey" size="10"> 
						<input type="submit" value="검색">
					</form>
					<input type="button" value="글쓰기" class="writeBtn" onclick="javascipt:window.location='insertPost.do'">

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col" style="width: 55%; text-align: center">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="">
								<tr>
									
								</tr>						
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- col-10 -->
		</div>
	</div>
</div>






<%@ include file="footer.jsp"%>