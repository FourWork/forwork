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
						<c:forEach var="boardMenu" items="">
							
						</c:forEach>
					</ul>
					<a href="#" class="boardMenuPlus"><i
						class="bi bi-plus-square-dotted"></i></a>
				</div>
			</div>
			<div class="col-10">
				<div class="col">
					<div class="col">

						<div class="noticePreList">

							<div class="row row-cols-1 row-cols-md-3 g-4">
								<div class="col noticePre">
									<div class="card h-100">
										<div class="card-body">
											<h5 class="card-title">
												<i class="bi bi-exclamation"></i> 공지 사항 제목
											</h5>
											<p class="card-text">공지 사항 내용 미리 보기</p>
											<p class="card-text">2021-04-09</p>
										</div>
									</div>
								</div>
								<div class="col noticePre">
									<div class="card h-100">
										<div class="card-body">
											<h5 class="card-title">
												<i class="bi bi-exclamation"></i> Card title
											</h5>
											<p class="card-text">This is a short card.</p>
											<p class="card-text">2021-04-09</p>
										</div>
									</div>
								</div>
								<div class="col noticePre">
									<div class="card h-100">
										<div class="card-body">
											<h5 class="card-title">
												<i class="bi bi-exclamation"></i> Card title
											</h5>
											<p class="card-text">This is a longer card with
												supporting text below as a natural lead-in to additional
												content.</p>
											<p class="card-text">2021-04-09</p>
										</div>
									</div>
								</div>

							</div>

						</div>
						<!-- noticePre -->

					</div>
					<!-- col -->

					<div class="col">

						<div class="boardPreList">

							<div class="boardPre">
								<div class="boardTitle">
									<i class="bi bi-card-list"></i> 기본 게시판
								</div>
								<div class="PostWrap">
									<div class="PostTitle">게시글 제목</div>
									<div class="PostContent">게시글 내용</div>
									<div class="PostWriter">게시글 작성자</div>
									<div class="PostDate">게시글 작성 날짜</div>
									<div class="PostHitcount">게시글 조회수</div>
								</div>
								<div class="PostWrap">
									<div class="PostTitle">게시글 제목</div>
									<div class="PostContent">게시글 내용</div>
									<div class="PostWriter">게시글 작성자</div>
									<div class="PostDate">게시글 작성 날짜</div>
									<div class="PostHitcount">게시글 조회수</div>
								</div>
							</div>

							<div class="boardPre">
								<div class="boardTitle">
									<i class="bi bi-card-list"></i> 게시판 이름1
								</div>
								<div class="PostWrap">
									<div class="PostTitle">게시글 제목</div>
									<div class="PostContent">게시글 내용</div>
									<div class="PostWriter">게시글 작성자</div>
									<div class="PostDate">게시글 작성 날짜</div>
									<div class="PostHitcount">게시글 조회수</div>
								</div>
								<div class="PostWrap">
									<div class="PostTitle">게시글 제목</div>
									<div class="PostContent">게시글 내용</div>
									<div class="PostWriter">게시글 작성자</div>
									<div class="PostDate">게시글 작성 날짜</div>
									<div class="PostHitcount">게시글 조회수</div>
								</div>
							</div>

							<div class="boardPre">
								<div class="boardTitle">
									<i class="bi bi-card-list"></i> 게시판 이름2
								</div>
								<div class="PostWrap">
									<div class="PostTitle">게시글 제목</div>
									<div class="PostContent">게시글 내용</div>
									<div class="PostWriter">게시글 작성자</div>
									<div class="PostDate">게시글 작성 날짜</div>
									<div class="PostHitcount">게시글 조회수</div>
								</div>
								<div class="PostWrap">
									<div class="PostTitle">게시글 제목</div>
									<div class="PostContent">게시글 내용</div>
									<div class="PostWriter">게시글 작성자</div>
									<div class="PostDate">게시글 작성 날짜</div>
									<div class="PostHitcount">게시글 조회수</div>
								</div>
							</div>

							<div class="boardPre">
								<div class="boardTitle">
									<i class="bi bi-card-list"></i> 게시판 이름3
								</div>
								<div class="PostWrap">
									<div class="PostTitle">게시글 제목</div>
									<div class="PostContent">게시글 내용</div>
									<div class="PostWriter">게시글 작성자</div>
									<div class="PostDate">게시글 작성 날짜</div>
									<div class="PostHitcount">게시글 조회수</div>
								</div>
								<div class="PostWrap">
									<div class="PostTitle">게시글 제목</div>
									<div class="PostContent">게시글 내용</div>
									<div class="PostWriter">게시글 작성자</div>
									<div class="PostDate">게시글 작성 날짜</div>
									<div class="PostHitcount">게시글 조회수</div>
								</div>
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

<%@ include file="footer.jsp"%>