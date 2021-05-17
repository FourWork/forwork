<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Favicon -->
	<link rel="icon" href="../../../resources/assets/img/brand/favicon.png" type="image/png">
  
	<!-- Fonts -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  
	<!-- Icons -->
	<link rel="stylesheet" href="../../resources/assets/vendor/nucleo/css/nucleo.css" type="text/css">
	<link rel="stylesheet" href="../../../resources/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  
	<!-- Argon CSS -->
	<link rel="stylesheet" href="../../../resources/assets/css/argon.css?v=1.2.0" type="text/css">

 	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script type="text/javascript" src="/resources/js/portfolio.js"></script>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="../CSS/myprofile.css">

</head>
<body>
<div class="header_myProfile">
      <div class="container_myProfile">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">Hello 달러 중괄호 member.name 중괄호</h1>
            <p class="text-white mt-0 mb-5">This is your profile page. You can see the progress you've made with your work and manage your projects or assigned tasks</p>
         	<button type="button" class="btn btn-primary">Add Portfolio</button></a>
          </div>
        </div>
      </div>
    </div>

<script type="text/javascript">
$(document).ready(function(){
	console.log(portfolioService);
	
	var m_id = '<c:out value ="${member_id}"/>';
	console.log("m_id" + m_id);
	
	var p_id = '<c:out value ="${portfolio_id}"/>';
	console.log("p_id"+p_id);
	
	portfolioService.getList({
		member_id : m_id
		}, function(list){
			//리스트를 콘솔에 찍음
		for(var i=0, len = list.length||0; i<len ;i++){
			console.log(list[i]);
		}
	});
	
	portfolioService.get({
		portfolio_id : p_id
	}, function(wrapper){
		console.log(wrapper.portfolio);
		console.log(wrapper.pfLangList);
	})
});
</script>
</body>
</html>
<%@ include file="../footer.jsp" %>