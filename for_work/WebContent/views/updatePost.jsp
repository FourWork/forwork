<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="updatePostAction.do" method="post">
	<input type="hidden" name="board_id" value="${post.board_id}">
	<input type="hidden" name="post_id" value="${post.post_id}">
	<input type="hidden" name="post_writer" value="${post.post_writer}">
		작성자 ${post.post_writer} <br>
		제목 <input type="text" name="post_title" size="70" value="${post.post_title}"> <br>
		내용 <br>
		<textarea rows="6" cols="70" name="post_content">${post.post_content}</textarea> <br>
		<input type="submit" value="수정 완료">
	</form>

</body>
</html>