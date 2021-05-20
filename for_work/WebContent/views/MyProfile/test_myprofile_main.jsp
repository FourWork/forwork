<%@page import="org.forwork.domain.Portfolio"%>
<%@page import="org.forwork.domain.Member"%>
<%@page import="org.forwork.dao.PortfolioDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
session.setAttribute("member_id", 1);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="portfolio" items="${list }">
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        ${portfolio.portfolio_title }
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <table border ="1" bordercolor="blue" width="100%" align="center">
			<tr align="left">
				<td>${portfolio.portfolio_start_date }</td>
				<td>~</td>
				<td>${portfolio.portfolio_end_date }</td>
			</tr>
			<tr>
				<p><td colspan="3">${portfolio.portfolio_detail }</td><p>
			</tr>
			<tr>
			<!-- 언어 출력 -->

				<p><td colspan="3">사용언어</td><p>
				
		
			</tr>
		</table>
      </div>
    </div>
  </div>
  </div>
  	</c:forEach>

  <table border ="1" bordercolor="red" width="100%" align="center">
 <tr>
 <td>
 ${member.name }
 </td>
 <td>
  ${member.email }
 </td>
 </tr>
 <tr>
<td>
이름
</td>
<td>
이메일</td>
 </tr>
  </table>
  


 <!-- <div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        포트폴리오제목
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <table border ="1" bordercolor="blue" width="100%" align="center">
			<tr align="left">
				<td>시작날짜</td>
				<td>~</td>
				<td>끝날짜</td>
			</tr>
			<tr>
				<p><td colspan="3">세부내용</td><p>
			</tr>
			<tr>
				<p><td colspan="3">사용언어</td><p>
			</tr>
		</table>
      </div>
    </div>
  </div> -->
					
</body>
</html>