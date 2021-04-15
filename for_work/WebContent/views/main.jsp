<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<!-- Option 1: Bootstrap Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
	
<style type="text/css">
div {
	border: 1px solid gray; /* 레이아웃 확인용 */
}
</style>

<title>4WORK</title>
</head>
<body>
	<div class="container">
		<div class="row">
		
			<div class="col">
				
				<div class="col">
					캘린더
				</div> <!-- calendar col -->
				
				<div class="col">
					공지 사항 미리 보기
				</div> <!-- notice col -->
			
			</div> <!-- col -->
			
			<div class="col">
				
				<div class="col">
					to-do list
				</div> <!-- TODOLIST col -->
				
				<div class="col">
					프로젝트 진행률
				</div> <!-- project info col -->
				
			</div> <!-- col -->
		</div>
	</div>
</body>
</html>
<%@ include file="footer.jsp"%>