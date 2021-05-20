
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../header.jsp"%>
<%
	session.setAttribute("member_id", "1");
	session.setAttribute("name", "이가영");
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- 부트스트랩 4.x를 사용한다. -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<!-- task.js => js모듈화 -->
<script type="text/javascript" src="/resources/js/task.js"></script>

<!-- sprint.js -->
<script type="text/javascript" src="/resources/js/sprint.js"></script>


<!-- Task처리 -->
<script type="text/javascript">

$(document).ready(function(){
	
	var task_type_id = '<c:out value="${task.task_type_id}"/>';
	
	var listStoriesDiv = $("#storiesColumn");
	var listTodoDiv = $("#todoColumn");
	var listDoingDiv = $("#doingColumn");
	var listDoneDiv = $("#doneColumn");

	showList();
	
	// Task List 불러오기
	function showList(){
		
		taskService.listTask(function(list){
			
			var part1="<div class='card draggable shadow-sm' id='task1'><div class='card-header'></div><div class='card-body p-2 ui-sortable-handle'><div class='card-title'><p class='task_id'>";			 
			var part2="</p><div class='dropdown float-right'><a class='btn btn-default' href='#' role='button' id='dropdownMenuLink' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'> ... </a><div class='dropdown-menu' aria-labelledby='dropdownMenuLink'><a class='dropdown-item addRes' href='#'>담당자 추가</a><a class='dropdown-item' href='#'>To-do List에 추가</a><a class='dropdown-item' href='#' id='taskEdit' data-task_id='";
			var part3="'>Task수정&삭제</a></div> </div> </div><div class='card-text'><p id='taskContent'>";
			var part4=" <br> </p><h6 class='font-weight-light text-black' id='resp'> 담당 : <b>";
			var part5="</b></h6><h6 class='font-weight-light text-black' id='taskWriter'>created by <b>";
			var part6="</b></h6></div> </div> </div>";	
			
			var str1="<h6 class='card-title text-uppercase text-truncate py-2'>Stories</h6>";
			var str2="<h6 class='card-title text-uppercase text-truncate py-2'>To-Do</h6>";
			var str3="<h6 class='card-title text-uppercase text-truncate py-2'>Doing</h6>";
			var str4="<h6 class='card-title text-uppercase text-truncate py-2'>Done</h6>";
			
			listStoriesDiv.html(str1);
			listTodoDiv.html(str2);
			listDoingDiv.html(str3);
			listDoneDiv.html(str4);

			if(list==null || list.length==0){
				listStoriesDiv.html(str1);
				listTodoDiv.html(str2);
				listDoingDiv.html(str3);
				listDoneDiv.html(str4);
				
				return;
			}
			
			for(var i =0, len=list.length ; i < len ; i++){
				if(list[i].task_type_id==1){
					str1 += part1 + list[i].task_id + part2 + list[i].task_id + part3 + list[i].task_content + part4 + list[i].name + part5 + list[i].writer + part6;				
					listStoriesDiv.html(str1);
				}
				
				if(list[i].task_type_id==2){
					str2 += part1 + list[i].task_id + part2 + list[i].task_id + part3 + list[i].task_content + part4 + list[i].name + part5 + list[i].writer + part6;	
					listTodoDiv.html(str2);
				}
				
				if(list[i].task_type_id==3){
					str3 += part1 + list[i].task_id + part2 + list[i].task_id + part3 + list[i].task_content + part4 + list[i].name + part5 + list[i].writer + part6;	
					listDoingDiv.html(str3);
				}
				
				if(list[i].task_type_id==4){
					str4 += part1 + list[i].task_id + part2 + list[i].task_id + part3 + list[i].task_content + part4 + list[i].name + part5 + list[i].writer + part6;	
					listDoneDiv.html(str4);
				}	
			}		
		}); // end function
	}// end showList
	
	// Task 추가 Modal 띄우기
	var taskModal = $("#taskModal");
	
	var taskModalId = taskModal.find("input[name='task_id']");
	var taskModalContent = taskModal.find("input[name='task_content']");
	var taskModalRes = taskModal.find("input[name='name']");
	var taskModalWriter = taskModal.find("input[name='writer']");

	var taskModalRegisterBtn = $("#taskRegisterBtn");
	var taskModalUpdateBtn = $("#taskUpdateBtn");
	var taskModalDeleteBtn = $("#taskDeleteBtn");
	
	$("#taskAddBtn").on("click", function(e){
		
		taskModal.find("input").val("");
		taskModalId.closest("div").hide();
		taskModalRes.closest("div").hide();
		taskModalWriter.closest("div").hide();
		
		taskModal.find("button[id!='taskModalClose']").hide();
		
		taskModalRegisterBtn.show();
		
		$("#taskModal").modal("show");
	});
	
	taskModalRegisterBtn.on("click", function(e) {
		
		var task = {
				task_content :taskModalContent.val(),
				task_index : 1,
				writer : "홍길동"
		};
				
		
	
	taskService.insertTask(task, function(result) {
		
		alert("Task가 추가되었습니다.");
		
		taskModal.find("input").val("");
		taskModal.modal("hide");
		
		showList();
	});
	
	});
	
	//task 수정&삭제 Modal 띄우기
	$("#column_container").on("click", "#taskEdit", function(e){
		
		var task_id = $(this).data("task_id");
		
		taskService.detailTask(task_id, function(task){
			
			taskModalContent.val(task.task_content);
			taskModalRes.val(task.name).attr("readonly","readonly");
			taskModalWriter.val(task.writer).attr("readonly","readonly");
			taskModal.data("task_id", task.task_id);
			taskModalId.closest("div").hide();
			taskModalRes.closest("div").show();
			taskModalWriter.closest("div").show();
			
			taskModal.find("button[id!='taskModalClose']").hide();
			taskModalUpdateBtn.show();
			taskModalDeleteBtn.show();
			
			$("#taskModal").modal("show");
		
		});
		
	});
	
	//task 수정하기
	taskModalUpdateBtn.on("click", function(e) {
		
		var task = {task_id:taskModal.data("task_id"), task_content:taskModalContent.val()};
		
		taskService.updateTask(task, function(result){
			
			alert("Task가 수정되었습니다.");
			taskModal.modal("hide");
			showList();
			
		});
	});
	
	//task 삭제하기
	taskModalDeleteBtn.on("click", function(e){
		
		var task_id = taskModal.data("task_id");
		
		taskService.deleteTask(task_id, function(result){
		
			alert("Task가 삭제되었습니다.");
			taskModal.modal("hide");
			showList();
		});
	});
	
	
	
});


</script>

<!-- Sprint처리 -->
<script type="text/javascript">

$(document).ready(function() {
	
	var sprintTb = $("#sprintList");
	
	showSprints();
	
	// sprint List 출력
	function showSprints() {
		
		sprintService.listSprint(function(list){
			
			var str = "";
			if(list==null || list.length==0){
				sprintTb.html("");
				
				return;
			}
			for(var i=0, len=list.length||0; i<len;i++){
				str += "<tr><td data-sprint_id='"+list[i].sprint_id+"'>"+list[i].sprint_title+"</td>";
				str += "<td>"+list[i].sprint_start_date+"</td>";
				str += "<td>"+list[i].sprint_end_date+"</td>";
				str += "<td><button style='background-color: "+list[i].sprint_color+"' id='colorbutton' disabled></td></tr>";
			}
			
			sprintTb.html(str);
		});//end function
	}// end showSprints
	
	// Sprint 모달 띄우기
	var sprintModal = $("#sprintAdd");
	
	var sprintModalTitle = sprintModal.find("input[name='sprint_title']");
	var sprintModalStartDate = sprintModal.find("input[name='sprint_start_date']");
	var sprintModalEndDate = sprintModal.find("input[name='sprint_end_date']");
	var sprintModalColor = sprintModal.find("input[name='sprint_color']");
	
	var sprintModalRegisterBtn = $("#sprintRegisterBtn");
	var sprintModalUpdateBtn = $("#sprintUpdateBtn");
	var sprintModalDeleteBtn = $("#sprintDeleteBtn");
	
	$("#sprintAddBtn").on("click", function(e){
		
		sprintModal.find("input").val("");
		sprintModal.find("button[id !='sprintModalClose']").hide();
		
		sprintModalRegisterBtn.show();
		
		$("#sprintAdd").modal("show");
	});
	
	// Sprint 추가 
	sprintModalRegisterBtn.on("click", function(e) {
		
		var sprint ={
				sprint_title : sprintModalTitle.val(),
				sprint_start_date : sprintModalStartDate.val(),
				sprint_end_date : sprintModalEndDate.val(),
				sprint_color : sprintModalColor.val()
		};
	
		sprintService.insertSprint(sprint, function(result) {
			
			alert("Sprint정보가 추가되었습니다.");
			
			sprintModal.find("input").val("");
			sprintModal.modal("hide");
			
			showSprints();
		});
		
	});
	
	// Sprint 수정&삭제
	$("#sprintList").on("click","td",function(e){
		
		
		var sprint_id = $(this).data("sprint_id");
		
		
		sprintService.getSprint(sprint_id, function(sprint){
			
			sprintModalTitle.val(sprint.sprint_title);
			
			var startVal = String(sprint.sprint_start_date).substring(0,10);			
			sprintModalStartDate.val(startVal);
			
			var endVal = String(sprint.sprint_end_date).substring(0,10);	
			sprintModalEndDate.val(endVal);
			
			sprintModalColor.val(sprint.sprint_color);
			sprintModal.data("sprint_id", sprint.sprint_id);
			
			sprintModal.find("button[id !='sprintModalClose']").hide();
			sprintModalUpdateBtn.show();
			sprintModalDeleteBtn.show();
			
			$("#sprintAdd").modal("show");
			
			
		});
	
});

	sprintModalUpdateBtn.on("click", function(e){
		
		var startValue = String(sprintModalStartDate.val());
		var endValue = String(sprintModalEndDate.val());
		
		var sprint = {
				sprint_id : sprintModal.data("sprint_id"), 
				sprint_title : sprintModalTitle.val(),	
				sprint_start_date : sprintModalStartDate.val(),	
				sprint_end_date : sprintModalEndDate.val(),	
				sprint_color : sprintModalColor.val() 
				};
		
		
		
		sprintService.updateSprint(sprint, function(result){
			
			alert("Sprint정보가 수정되었습니다.");
			sprintModal.modal("hide");
			showSprints();
		});
	});

	
	sprintModalDeleteBtn.on("click", function(e){
		
		var sprint_id = sprintModal.data("sprint_id");
		
		sprintService.deleteSprint(sprint_id, function(result){
			
			alert("Sprint정보가 삭제되었습니다.");
			sprintModal.modal("hide");
			showSprints();
		});
	});
	
});

</script>


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
					console.log(previdx);
					console.log(nowidx);

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

#colorbutton {
	border: none;
	border-radius: 50%;
	width: 20px;
	height: 20px;
}

#column_container {
	padding: none;
}

.px-0 {
	margin-right: 0 !important;
	margin-left: 0 !important;
}
</style>
<body>
	<div class="container-fluid pt-1 px-0">
		<!-- 전체 화면의 틀 -->

		<div class="row flex-row flex-sm-nowrap py-3">
			<!-- 스크럼 보드 위의 프로젝트 정보 있는 div -->

			<div class="col-8">
				<!-- 프로젝랑 스프린트 정보 있는 div -->
				<div class="row flex-row flex-sm-nowrap py-1">
					<!-- 프로젝트 정보만 -->

					<table class="table" id="project_table">
						<thead>
							<tr>
								<th scope="col">Project 이름</th>
								<th scope="col">Project 시작일</th>
								<th scope="col">Project 종료일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Team04 중간 프로젝트</td>
								<td>2021-04-05</td>
								<td>2021-04-16</td>
							</tr>
						</tbody>
					</table>

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
						<tbody id="sprintList">
						
						</tbody>
					</table>
				</div>
				
				<div class="row flex-row flex-sm-nowrap py-1">
					<!-- 스프린트&Task 카드 추가 버튼 div -->
					<button id="sprintAddBtn" class="btn btn-primary">Sprint 추가</button>
						
					<button id="taskAddBtn" class="btn btn-primary">Task 추가</button>
					

					<!-- sprint add btn -->
				<jsp:include page="sprintModal.jsp" />
				
					<!-- modal add btn -->
					<jsp:include page="taskModal.jsp" />

				</div>
				
			</div>

			<div class="col-4 border-1">
				<!-- 프로젝트 진행률 부분 -->
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Project 성취율</th>
							<th scope="col">Sprint 성취율</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>50%</td>
							<td>20%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="container-fluid" id="column_container">
			<div class="row flex-row flex-sm-nowrap py-3 ">
				<div class="col-sm-6 col-md-4 col-xl-3 column bg-light mr-1 " id="storiesColumn">
					
				</div>
				<div class="col-sm-6 col-md-4 col-xl-3 column bg-light mx-2" id="todoColumn">
					
				</div>
				<div class="col-sm-6 col-md-4 col-xl-3 column bg-light mx-2" id="doingColumn">
				
				</div>
				<div class="col-sm-6 col-md-4 col-xl-3 column bg-light mx-2" id="doneColumn">
				
				</div>
			</div>
		</div>
	</div>


</body>
</html>
