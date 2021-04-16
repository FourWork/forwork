<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="header.jsp"%>
<%
session.setAttribute("member_id", "1");
session.setAttribute("name", "test");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- 부트스트랩 4.x를 사용한다. -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	$(function() { // task move
		$(".column").sortable(
				{
					// 드래그 앤 드롭 단위 css 선택자	
					connectWith : ".column",
					// 움직이는 css 선택자	
					handle : ".card-header",
					// 움직이지 못하는 css 선택자	
					cancel : ".no-move",
					// 이동하려는 location에 추가 되는 클래스	
					placeholder : "card-placeholder",
					start : function(event, ui) {
						$(this).attr('data-previndex', ui.item.index());
					},
					update : function(event, ui) {
						var previdx = $(this).attr('data-previndex');
						var nowidx = ui.item.index();
						var task_id = $(ui.item).find('.task_id').html();
						var col_name = $(ui.item).closest('.column').find(
								'.card-title').html();

						if (typeof previdx != 'undefined') {
							$.ajax({
								type : "POST",
								url : "moveTask.do",
								data : {
									"previdx" : previdx,
									"nowidx" : nowidx,
									"task_id" : task_id,
									"col_name" : col_name
								},
								success : function(data) {
									if (data == 'success') {
										console.log("성공");
									}
								},
								error : function(e) {
									console.log('error : ' + e);
								}
							})
						}
					}
				});
		// 해당 클래스 하위의 텍스트 드래그를 막는다.	
		
		$('.addRes').click(function(){
			var task_id = $(this).closest('.card').find('.task_id').html();		
			var now = $(this).closest('.card').find('#resp').find('b');
		$.ajax({
				type : "POST",
				url : "addRes.do",
				data : {
					"task_id" : task_id
				},
				success : function(data){
					$(now).html('<%=session.getAttribute("name")%>');
				}
			}); 
		});

	});
</script>
</head>
<style>
/* 마우스 포인터을 손가락으로 변경 */
.card:not (.no-move ) .card-header {
	cursor: pointer;
}

.column {
	border: 1px solid lightgray;
}

.card-placeholder {
	border: 1px dotted black;
	margin: 0 1em 1em 0;
	height: 50px;
	margin-left: auto;
	margin-right: auto;
	background-color: lightgray;
}

.card-text {
	margin-left: 12px;
}

.task_id {
	visibility: hidden;
	margin: 0px;
	height: 0px;
}
</style>
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
					<table class="table">
							<thead>
								<tr>
									<th scope="col">Sprint 이름</th>
									<th scope="col">Sprint 시작일</th>
									<th scope="col">Sprint 종료일</th>
									<th scope="col">Sprint 색</th>
								</tr>
							</thead>
							<c:forEach  var="sprint" items="${sprintList }">
							<tbody>
								<tr>
									<td>${sprint.sprint_title }</td>
									<td>${sprint.sprint_start_date }</td>
									<td>${sprint.sprint_end_date }</td>
									<td style= "background-color: ${sprint.sprint_color };" class="sprint_color_cell"></td>
								</tr>
							</tbody>
							</c:forEach>
						</table>
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
			<div class="col-sm-6 col-md-4 col-xl-3 column bg-light mx-2">
				<h6 class="card-title text-uppercase text-truncate py-2">Stories</h6>
				<c:forEach var="task" items="${list }">
					<c:if test="${task.task_type_id ==1}">
						<div class="card draggable shadow-sm" id="task1">
							<!-- Task 하나 -->
							<div class="card-header"></div>
							<div class="card-body p-2 ui-sortable-handle">
								<!-- Task 하나의 내용처리 -->
								<div class="card-title">
									<p class="task_id">${task.task_id}</p>
									<!-- Task 하나의 제목 -->
									<div class="dropdown float-right">
										<a class="btn btn-default" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> ... </a>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
											<a class="dropdown-item addRes" href="#">담당자 추가</a> <a
												class="dropdown-item" href="#">To-do List에 추가</a> 															
                      <a class="dropdown-item" href="detailUpdateAction.do?task_id=${task.task_id }" >Task 수정</a>
														<a class="dropdown-item" href="detailDeleteAction.do?task_id=${task.task_id }">Task 삭제</a>

										</div>
									</div>
								</div>
								<!-- task delete Modal -->
								<div class="card-text">
									<p id="taskContent">
										<!-- Task 내용 -->

										${task.task_content } <br>

									</p>
									<h6 class="font-weight-light text-black" id="resp">
										담당 : <b>${task.name}</b>
									</h6>
									<!-- 담당자 -->
									<h6 class="font-weight-light text-black" id="taskWriter">
										created by <b>${task.writer }</b>
									</h6>
									<!-- 작성자 -->

								</div>
							</div>


						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="col-sm-6 col-md-4 col-xl-3 column bg-light mx-2">
				<h6 class="card-title text-uppercase text-truncate py-2 no-move">To-do</h6>
				<c:forEach var="task" items="${list }">
					<c:if test="${task.task_type_id ==2}">
						<div class="card shadow-sm" id="task1">
							<!-- Task 하나 -->
							<div class="card-header"></div>
							<div class="card-body p-2">
								<!-- Task 하나의 내용처리 -->
								<div class="card-title">
									<p class="task_id">${task.task_id}</p>
									<!-- Task 하나의 제목 -->
									<div class="dropdown float-right">
										<a class="btn btn-default" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> ... </a>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
											<a class="dropdown-item addRes" href="#">담당자 추가</a> <a
												class="dropdown-item" href="#">To-do List에 추가</a> 															
                      <a class="dropdown-item" href="detailUpdateAction.do?task_id=${task.task_id }" >Task 수정</a>
															<a class="dropdown-item" href="detailDeleteAction.do?task_id=${task.task_id }">Task 삭제</a>

										</div>
									</div>
								</div>
								<div class="card-text">
									<p id="taskContent">
										<!-- Task 내용 -->

										${task.task_content } <br>

									</p>
									<h6 class="font-weight-light text-black" id="resp">
										담당 : <b>${task.name}</b>
									</h6>
									<!-- 담당자 -->
									<h6 class="font-weight-light text-black" id="taskWriter">
										created by <b>${task.writer }</b>
									</h6>
									<!-- 작성자 -->

								</div>
							</div>

						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="col-sm-6 col-md-4 col-xl-3 column bg-light mx-2">
				<h6 class="card-title text-uppercase text-truncate py-2">Doing</h6>
				<c:forEach var="task" items="${list }">
					<c:if test="${task.task_type_id ==3}">
						<div class="card shadow-sm" id="task1">
							<!-- Task 하나 -->
							<div class="card-header"></div>
							<div class="card-body p-2">
								<!-- Task 하나의 내용처리 -->
								<div class="card-title">
									<p class="task_id">${task.task_id}</p>
									<!-- Task 하나의 제목 -->
									<div class="dropdown float-right">
										<a class="btn btn-default" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> ... </a>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
											<a class="dropdown-item addRes" href="#">담당자 추가</a> <a
												class="dropdown-item" href="#">To-do List에 추가</a> 															
                      <a class="dropdown-item" href="detailUpdateAction.do?task_id=${task.task_id }" >Task 수정</a>
															<a class="dropdown-item" href="detailDeleteAction.do?task_id=${task.task_id }">Task 삭제</a>
										</div>
									</div>
								</div>

								<div class="card-text">
									<p id="taskContent">
										<!-- Task 내용 -->

										${task.task_content } <br>

									</p>
									<h6 class="font-weight-light text-black" id="resp">
										담당 : <b>${task.name}</b>
									</h6>
									<!-- 담당자 -->
									<h6 class="font-weight-light text-black" id="taskWriter">
										created by <b>${task.writer }</b>
									</h6>
									<!-- 작성자 -->

								</div>
							</div>

						</div>

					</c:if>
				</c:forEach>
			</div>
			<div class="col-sm-6 col-md-4 col-xl-3 column bg-light mx-2">
				<h6 class="card-title text-uppercase text-truncate py-2">Done</h6>
				<c:forEach var="task" items="${list }">
					<c:if test="${task.task_type_id ==4}">
						<div class="card shadow-sm" id="task1">
							<!-- Task 하나 -->
							<div class="card-header"></div>
							<div class="card-body p-2">
								<!-- Task 하나의 내용처리 -->
								<div class="card-title">
									<p class="task_id">${task.task_id}</p>
									<!-- Task 하나의 제목 -->
									<div class="dropdown float-right">
										<a class="btn btn-default" href="#" role="button"
											id="dropdownMenuLink" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false"> ... </a>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
											<a class="dropdown-item addRes" href="#">담당자 추가</a> <a
												class="dropdown-item" href="#">To-do List에 추가</a> 															
                      <a class="dropdown-item" href="detailUpdateAction.do?task_id=${task.task_id }" >Task 수정</a>
															<a class="dropdown-item" href="detailDeleteAction.do?task_id=${task.task_id }">Task 삭제</a>
										</div>
									</div>
								</div>
								<div class="card-text">
									<p id="taskContent">
										<!-- Task 내용 -->

										${task.task_content } <br>

									</p>
									<h6 class="font-weight-light text-black" id="resp">
									담당 : <b>${task.name}</b>
									</h6>
									<!-- 담당자 -->
									<h6 class="font-weight-light text-black" id="taskWriter">
										created by <b>${task.writer }</b>
									</h6>
									<!-- 작성자 -->

								</div>
							</div>

						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>


</body>
</html>

