<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
 		<sec:authorize access="isAnonymous()"> // 로그인안한 유저만 보이게 함
		<a href="/member/login">로그인</a>
	</sec:authorize>
		<sec:authorize access="isAuthenticated()"> // 로그인한 유저만 보이게 함
		<a href="/logout">로그아웃</a>
	</sec:authorize>
	
	<h1>${member.name}</h1>
	
	<button type="button" class="btn btn-primary" id="targetCreateProjectForm" data-toggle="modal" data-target="#CreateProjectForm">프로젝트 생성</button>

	

<div class="card" style="width: 18rem;">
  <div class="card-body">
	<h5 class="card-title">프로젝트 이름</h5>
	<a href="#" class="card-link">1차스프린트</a>
  </div>
  <ul class="list-group list-group-flush">
	<li class="list-group-item">프로젝트 권한:PA/PM</li>
	<li class="list-group-item">시작날짜:2021-05-24</li>
	<li class="list-group-item">마감날짜:2021-06-25</li>
	<li class="list-group-item">프로젝트 상태:승인대기/반려/승인</li>
  </ul>
  <div class="card-body">
	<a href="#" class="card-link">프로젝트 수정</a>
	<a href="#" class="card-link">프로젝트 삭제</a>
  </div>
</div>
	
<div class="card" style="width: 18rem;">
  <div class="card-body">
	<h5 class="card-title">프로젝트 이름</h5>
	<a href="#" class="card-link">1차스프린트</a>
  </div>
  <ul class="list-group list-group-flush">
	<li class="list-group-item">프로젝트 권한:PA/PM</li>
	<li class="list-group-item">시작날짜:2021-05-24</li>
	<li class="list-group-item">마감날짜:2021-06-25</li>
	<li class="list-group-item">프로젝트 상태:승인대기/반려/승인</li>
  </ul>
  <div class="card-body">
	<a href="#" class="card-link">프로젝트 수정</a>
	<a href="#" class="card-link">프로젝트 삭제</a>
  </div>
</div>	
	
	</body>
</html>
<%@ include file="./create_project_form.jsp" %>
<%@ include file="../footer.jsp" %>