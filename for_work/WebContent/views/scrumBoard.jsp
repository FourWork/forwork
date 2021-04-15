<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="header.jsp"%>
<!doctype html>
<html lang="eng">
<head>

<!-- Required meta tags -->
<meta charset="utf-8">
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

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
    
<!-- dropdown 쓰려면 이 세 코드 있어야함 -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>

<title>스크럼 보드 만드는 중</title>
</head>
<body>
	<div class="container-fluid pt-3">
		<!-- 전체 화면의 틀 -->

		<div class="row flex-row flex-sm-nowrap py-3">
			<!-- 스크럼 보드 위의 프로젝트 정보 있는 div -->

			<div class="col-8">
				<!-- 프로젝랑 스프린트 정보 있는 div -->
				<div class="row flex-row flex-sm-nowrap py-1">
					<!-- 프로젝트 정보만 -->
					<div class="col-5">
						<h3 class="font-weight-light text-black">Project Name</h3>
						<!-- 프로젝트 제목 -->
					</div>
					<div class="col-7">
						<!-- 프로젝트 기간 보여주는 div -->
						<h5>2021/04/01 ~ 2021/06/18</h5>
					</div>
				</div>
				<div class="row flex-row flex-sm-nowrap py-1">
					<!-- 스프린트 정보만 -->
					<div class="col-1">
						<h6>1차</h6>
					</div>
					<div class="col-4">
						<h4 class="font-weight-light text-black">Team4 Sprint01</h4>
						<!-- 프로젝트 제목 -->
					</div>
					<div class="col-4">
						<!-- 프로젝트 기간 보여주는 div -->
						<h6 class=>2021/04/01 ~ 2021/04/15</h6>
					</div>
					<div class="col-1">
						<h6>색</h6>
					</div>
				</div>
				<div class="row flex-row flex-sm-nowrap py-1">
					<!-- 스프린트&Task 카드 추가 버튼 div -->
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#sprintAdd">Sprint 추가</button>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#taskAdd">Task 추가</button>

					<!-- sprint add btn -->
					<jsp:include page="sprintAddModal.jsp" />

					<!-- modal add btn -->
					<jsp:include page="taskAddModal.jsp" />

				</div>
				</div>

				<div class="col-4 border-1">
					<!-- 프로젝트 진행률 부분 -->
					<div class="row flex-row flex-sm-nowrap py-1">
						<h3>프로젝트 성취율</h3>
					</div>
					<div class="row flex-row flex-sm-nowrap py-1">
						<label>전체 진행률</label>
					</div>
					<div class="row flex-row flex-sm-nowrap py-1">
						<label>전체 진행률</label>
					</div>
				</div>
				</div>
			

			<div class="row flex-row flex-sm-nowrap py-3">
				<!-- 스크럼보드의 전체 틀 / row : 가로로 그룹 지을 컬럼들의 집합 / flex-row : 수평 진행 방향 설정 / nowrap : 줄 안바꿈 -->

				<div class="col-sm-6 col-md-4 col-xl-3">
					<!-- Stories -->
					<div class="card bg-light">
						<!-- card : 컬럼 하나의 레이아웃 -->
						<div class="card-body">
							<!-- card-body :카드 내용이 들어갑니다. .card-title로 제목을, .card-text로 내용을 구분합니다. -->
							<h6 class="card-title text-uppercase text-truncate py-2">Stories</h6>
							<c:forEach var="task" items="${list }">
								<c:if
									test="${task.task_type_id ==1}">
									<div class="items border border-light">
										<!-- card-body에서 title을 빼고 나머지 Task들만 묶은 border -->
										<div class="card draggable shadow-sm" id="task1"
											draggable="true" ondragstart="drag(event)">
											<!-- Task 하나 -->
											<div class="card-body p-2">
												<!-- Task 하나의 내용처리 -->
												<div class="card-title">
													<!-- Task 하나의 제목 -->
													<div class="dropdown float-right">
														<a class="btn btn-default" href="#" role="button"
															id="dropdownMenuLink" data-toggle="dropdown"
															aria-haspopup="true" aria-expanded="false"> ... </a>
														<div class="dropdown-menu"
															aria-labelledby="dropdownMenuLink">
															<a class="dropdown-item" href="#">담당자 추가</a> 
															<a class="dropdown-item" href="#">To-do List에 추가</a> 
															<a class="dropdown-item" href="detailUpdateAction.do?task_id=${task.task_id }" >Task 수정</a>
															<a class="dropdown-item" href="detailDeleteAction.do?task_id=${task.task_id }">Task 삭제</a>
														</div>
													</div>
													
													<p>${task.task_id }</p>
												</div>
												<div class="card-text">
													<p id="taskContent">
														<!-- Task 내용 -->
							
														${task.task_content } <br>

													</p>
													<h6 class="font-weight-light text-black" id="resp">
														담당 : <b>${task.responsibility }</b>
													</h6>
													<!-- 담당자 -->
													<h6 class="font-weight-light text-black" id="taskWriter">
														created by <b>${task.writer }</b>
													</h6>
													<!-- 작성자 -->

												</div>
											</div>
										</div>
										<div class="dropzone rounded" ondrop="drop(event)"
											ondragover="allowDrop(event)" ondragleave="clearDrop(event)">
											&nbsp;</div>
										<!-- Task 카드 아래에 공간 띄우기 -->
									</div>
								</c:if>
							</c:forEach>								
							
						</div>
					</div>
				</div>

				<div class="col-sm-6 col-md-4 col-xl-3">
					<!-- To-do -->
					<div class="card bg-light">
						<!-- card : 컬럼 하나의 레이아웃 -->
						<div class="card-body">
							<!-- card-body :카드 내용이 들어갑니다. .card-title로 제목을, .card-text로 내용을 구분합니다. -->
							<h6 class="card-title text-uppercase text-truncate py-2">To-do</h6>
							<c:forEach var="task" items="${list }">
								<c:if test="${task.task_type_id ==2 }">
									<div class="items border border-light">
										<!-- card-body에서 title을 빼고 나머지 Task들만 묶은 border -->
										<div class="card draggable shadow-sm" id="task1"
											draggable="true" ondragstart="drag(event)">
											<!-- Task 하나 -->
											<div class="card-body p-2">
												<!-- Task 하나의 내용처리 -->
												<div class="card-title">
													<!-- Task 하나의 제목 -->
													<div class="dropdown float-right">
														<a class="btn btn-default" href="#" role="button"
															id="dropdownMenuLink" data-toggle="dropdown"
															aria-haspopup="true" aria-expanded="false"> ... </a>
														<div class="dropdown-menu"
															aria-labelledby="dropdownMenuLink">
															<a class="dropdown-item" href="#">담당자 추가</a> <a
																class="dropdown-item" href="#">To-do List에 추가</a> 
																<a class="dropdown-item" href="detailUpdateAction.do?task_id=${task.task_id }" >Task 수정</a>
															<a class="dropdown-item" href="detailDeleteAction.do?task_id=${task.task_id }">Task 삭제</a>
														</div>
													</div>											

												</div>
												<div class="card-text">
													<p>
														<!-- Task 내용 -->
														${task.task_content } <br>
													</p>
													<h6 class="font-weight-light text-black">
														담당 : <b>${task.responsibility }</b>
													</h6>
													<h6 class="font-weight-light text-black">
														created by <b>${task.writer }</b>
													</h6>
												</div>
											</div>
										</div>
										<div class="dropzone rounded" ondrop="drop(event)"
											ondragover="allowDrop(event)" ondragleave="clearDrop(event)">
											&nbsp;</div>
										<!-- Task 카드 아래에 공간 띄우기 -->
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 col-xl-3">
					<!-- Doing -->
					<div class="card bg-light">
						<!-- card : 컬럼 하나의 레이아웃 -->
						<div class="card-body">
							<!-- card-body :카드 내용이 들어갑니다. .card-title로 제목을, .card-text로 내용을 구분합니다. -->
							<h6 class="card-title text-uppercase text-truncate py-2">Doing</h6>
							<c:forEach var="task" items="${list }">
								<c:if test="${task.task_type_id ==3 }">
									<div class="items border border-light">
										<!-- card-body에서 title을 빼고 나머지 Task들만 묶은 border -->
										<div class="card draggable shadow-sm" id="task1"
											draggable="true" ondragstart="drag(event)">
											<!-- Task 하나 -->
											<div class="card-body p-2">
												<!-- Task 하나의 내용처리 -->
												<div class="card-title">
													<!-- Task 하나의 제목 -->
													<div class="dropdown float-right">
														<a class="btn btn-default" href="#" role="button"
															id="dropdownMenuLink" data-toggle="dropdown"
															aria-haspopup="true" aria-expanded="false"> ... </a>
														<div class="dropdown-menu"
															aria-labelledby="dropdownMenuLink">
															<a class="dropdown-item" href="#">담당자 추가</a> <a
																class="dropdown-item" href="#">To-do List에 추가</a> 
																<a class="dropdown-item" href="detailUpdateAction.do?task_id=${task.task_id }" >Task 수정</a>
															<a class="dropdown-item" href="detailDeleteAction.do?task_id=${task.task_id }">Task 삭제</a>
														</div>
													</div>											

												</div>
												<div class="card-text">
													<p>
														<!-- Task 내용 -->
														${task.task_content }
													</p>
													<h6 class="font-weight-light text-black">
														담당 : <b>${task.responsibility }</b>
													</h6>
													<h6 class="font-weight-light text-black">
														created by <b>${task.writer }</b>
													</h6>
												</div>
											</div>
										</div>
										<div class="dropzone rounded" ondrop="drop(event)"
											ondragover="allowDrop(event)" ondragleave="clearDrop(event)">
											&nbsp;</div>
										<!-- Task 카드 아래에 공간 띄우기 -->
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 col-xl-3">
					<!-- Done -->
					<div class="card bg-light">
						<!-- card : 컬럼 하나의 레이아웃 -->
						<div class="card-body">
							<!-- card-body :카드 내용이 들어갑니다. .card-title로 제목을, .card-text로 내용을 구분합니다. -->
							<h6 class="card-title text-uppercase text-truncate py-2">Done</h6>
							<c:forEach var="task" items="${list }">
								<c:if test="${task.task_type_id == 4 }">
									<div class="items border border-light">
										<!-- card-body에서 title을 빼고 나머지 Task들만 묶은 border -->
										<div class="card draggable shadow-sm" id="task1"
											draggable="true" ondragstart="drag(event)">
											<!-- Task 하나 -->
											<div class="card-body p-2">
												<!-- Task 하나의 내용처리 -->
												<div class="card-title">
													<!-- Task 하나의 제목 -->
													<div class="dropdown float-right">
														<a class="btn btn-default" href="#" role="button"
															id="dropdownMenuLink" data-toggle="dropdown"
															aria-haspopup="true" aria-expanded="false"> ... </a>
														<div class="dropdown-menu"
															aria-labelledby="dropdownMenuLink">
															<a class="dropdown-item" href="#">담당자 추가</a> <a
																class="dropdown-item" href="#">To-do List에 추가</a> 
																<a class="dropdown-item" href="detailUpdateAction.do?task_id=${task.task_id }" >Task 수정</a>
															<a class="dropdown-item" href="detailDeleteAction.do?task_id=${task.task_id }">Task 삭제</a>
														</div>
													</div>											

												</div>
												<div class="card-text">
													<p>
														<!-- Task 내용 -->
														${task.task_content }
													</p>
													<h6 class="font-weight-light text-black">
														담당 : <b>${task.responsibility }</b>
													</h6>
													<h6 class="font-weight-light text-black">
														created by <b>${task.writer }</b>
													</h6>
												</div>
											</div>
										</div>
										<div class="dropzone rounded" ondrop="drop(event)"
											ondragover="allowDrop(event)" ondragleave="clearDrop(event)">
											&nbsp;</div>
										<!-- Task 카드 아래에 공간 띄우기 -->
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

		</div>
</body>
</html>













<%@ include file="footer.jsp"%>