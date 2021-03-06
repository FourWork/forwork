<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="taskId" class="col-form-label">일정 내용</label> 
						<input type="text" class="form-control" id="calendar_content" name="calendar_content" >
						<label for="taskId" class="col-form-label">시작 날짜</label> 
						<input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date" >
						<label for="taskId" class="col-form-label">종료 날짜</label> 
						<input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="addCalendar">추가</button>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal" id="sprintSettingModalClose">취소</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>