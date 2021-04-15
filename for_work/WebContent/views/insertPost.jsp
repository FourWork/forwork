<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	session.setAttribute("project_id", "3");
	session.setAttribute("board_id", "10");
	session.setAttribute("member_id", "9");
	session.setAttribute("name", "최봄"); */

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="insertPostAction.do" method="post">
 		<input type="hidden" name="project_id" value="${project_id}">
		<input type="hidden" name="board_id" value="${board_id}"> 
		작성자 <input type="text" name="post_writer" size="70"> <br>
		제목 <input type="text" name="post_title" size="70"> <br>
		내용 <br>
		<textarea rows="6" cols="70" name="post_content"></textarea> <br>
		<input type="submit" value="작성">
	</form>

</body>
</html>