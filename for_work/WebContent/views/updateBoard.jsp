<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="updateBoardAction.do" method="post">
		<input type="hidden" name="project_id" value="${board.project_id}">
		<input type="hidden" name="board_id" value="${board.board_id}">
		게시판 이름 <input type="text" size=30 name="board_name" value="${board.board_name}"> <br>
		<input type="submit" value="수정 완료">
	</form>

</body>
</html>