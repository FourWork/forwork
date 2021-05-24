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
	 
		<%-- <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="member"/>
 		</sec:authorize> --%>

 		<sec:authorize access="isAnonymous()"> // 로그인안한 유저만 보이게 함
		<a href="/member/login">로그인</a>
	</sec:authorize>
		<sec:authorize access="isAuthenticated()"> // 로그인한 유저만 보이게 함
		<a href="/logout">로그아웃</a>
	</sec:authorize>
	
	<h1>${member.name}</h1>
	
	
	
	</body>
</html>