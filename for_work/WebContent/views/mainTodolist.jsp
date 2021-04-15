<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.doneBox li {
	text-decoration: line-through;
	color: gray;
}
</style>

<script type="text/javascript">
	$(function() {
		window.location.href = 'allTodolistAction.do?member_id=${member_id}';
	});
</script>
<title>4WORK</title>
</head>
<body>

	<div class="todolistBox">
	
		<form action="insertTodolistAction.do" method="post" id="addTodolist">
			<input type="hidden" name="member_id" value="${member_id}"> 
			<input type="text" name="todolist_content">
			<button onclick="javascript:addTodolist.submit">추가</button>
		</form>
		
		<a href="allTodolistAction.do?member_id=${member_id}">목록 새로고침</a>
		
		<div class="todoBox">
			 <a href="deleteAllDonelistAction.do?member_id=${member_id}">완료
				항목 전체 삭제</a> 
 			<ul>
				<c:forEach var="doing" items="${doing}">
					<c:if test="${doing != null}">
						<li>
							${doing.todolist_content} 
							<a href="updateDonelistAction.do?todolist_id=${doing.todolist_id}&member_id=${member_id}">완료</a>
							<a href="deleteTodolistAction.do?todolist_id=${doing.todolist_id}&member_id=${member_id}">삭제</a>
						</li>
					</c:if>
					<c:if test="${doing == null}">
						<li>할 일을 추가해 보세요.</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>

		<div class="doneBox">
			<ul>
				<c:forEach var="done" items="${done}">
					<c:if test="${done != null}">
						<li>
							${done.todolist_content} 
							<a href="deleteTodolistAction.do?todolist_id=${done.todolist_id}&member_id=${member_id}">삭제</a>
						</li>
					</c:if>
					<c:if test="${done == null}">
						<li>완료된 할 일이 없습니다.</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		
	</div>

</body>
</html>