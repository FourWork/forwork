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
		<div class="modal-dialog modal-lg" role="document">
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
					<form action="insertSprintAction.do" method="post">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Sprint 이름</th>
									<th scope="col">Sprint 시작일</th>
									<th scope="col">Sprint 종료일</th>
									<th scope="col">Sprint 색</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control"
										id="sprintTitle" name="sprint_title"></td>
									<td><input type="date" class="form-control"
										id="sprintStartDate" name="sprint_start_date"></td>
									<td><input type="date" class="form-control"
										id="sprintEndDate" name="sprint_end_date"></td>
									<td><input type="color" class="form-control"
										id="sprintName" name="sprint_color" value="#00ff00"></td>
								</tr>
							</tbody>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">추가</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>