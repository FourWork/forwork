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

<div class="modal fade"  id="taskUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Task 수정</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <form action="updateTaskAction.do?task_id=${task.task_id }" method="post">
					      <div class="modal-body">
							<h4>Task_ID : ${task.task_id }</h4><br>
							<label>Task 내용 : </label><input type="text" name="task_content" value="${task.task_content }"><br>
							<label>Task 담당자 : </label><input type="text" name="responsibility" value=" ${task.responsibility }">
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
