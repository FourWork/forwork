<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="sprintAdd" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Sprint 정보를
						입력하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="sprintNo" class="col-form-label">Sprint No.</label> <input
								type="text" class="form-control" id="sprintNo">
						</div>
						<div class="form-group">
							<label for="sprintName" class="col-form-label">스프린트 이름</label> <input
								type="text" class="form-control" id="sprintName">
						</div>
						<div class="form-group">
							<label for="sprintStartDate" class="col-form-label">시작일</label> <input
								type="date" class="form-control" id="sprintStartDate">
						</div>
						<div class="form-group">
							<label for="sprintEndDate" class="col-form-label">종료일</label> <input
								type="date" class="form-control" id="sprintEndDate">
						</div>
						<div class="form-group">
							<label for="sprintName" class="col-form-label">색</label> <input
								type="color" class="form-control" id="sprintName">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">추가</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>