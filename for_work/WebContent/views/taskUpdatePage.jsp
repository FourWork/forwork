<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="header.jsp"%>

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
   
<script type="text/javascript">
$(window).on('load', function(){
	$('#taskUpdate').modal('show');
});
</script>

</head>
<body>

<div class="modal fade " data-backdrop="static"  id="taskUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Task 수정</h5>
					      </div>
					      <form action="updateTaskAction.do?task_id=${task.task_id }" method="post">
					      <div class="modal-body">
					      <table class="table">
							  <thead>
							    <tr>
							      <th scope="col">Task_ID</th>
							      <th scope="col">Task 내용</th>
							      <th scope="col">Task 담당자</th>
							      <th scope="col">Task 작성자</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      	<td>${task.task_id }</td>
					      			<td><input type="text" name="task_content" value="${task.task_content }"></td>
					      			<td>${task.responsibility }</td>
					      			<td>${task.writer }</td>
							    </tr>
							   </tbody>
							   </table>
					      
					      </div>
					      
					      <div class="modal-footer">
					      	<!-- <a class="btn btn-secondary" href="" role="button">취소</a> -->
					        <a role="button" class="btn btn-default" href="scrumBoard.do">취소</a>
					        <button type="submit" class="btn btn-success" id="taskAddBtn">수정</button>
					      </div>
						  </form>
					    </div>
					  </div>
					</div>		

</body>
</html>
