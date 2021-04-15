<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${board.board_name}</h2>
	
	<a href="listAction.do?project_id=${board.project_id}&board_id=${post.board_id}">글 목록</a>
	<table>
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<tr>
			<td>${post.post_id}</td>
			<td>${post.post_title}</td>
			<td>${post.post_writer}</td>
			<td>${post.post_date}</td>
		</tr>
		<tr>
			<td colspan="5"><div>${post.post_content}</div></td>
		</tr>
	</table>
	
	<a href="updatePostFormAction.do?post_id=${post.post_id}&board_id=${board.board_id}">수정</a>
	<a href="deletePostAction.do?post_id=${post.post_id}&project_id=${board.project_id}&board_id=${board.board_id}">삭제</a>
	
</body>
</html>