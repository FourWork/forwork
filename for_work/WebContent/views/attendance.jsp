<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
	session.setAttribute("member_id", 2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
 <script type="text/javascript" src="/for_work/views/Script/attendance.js"></script>
 <script type="text/javascript">

 $(function(){
		if("${commute}"!= ""){
			$("#commute").html("${commute}");
		}
		else{
			$("#commute").html("-");
		}
		 
		if("${off}" != ""){			
			$("#off").html("${off}");
		}else{
		$("#off").html("-");
		}
		 })
 </script>
<style type="text/css">
	#off{
		border: 1px solid black;
		display: inline-block;
		height : 39px;
		padding: 5px;
		margin-top: 12px;
		font-size : 18px;
		width : 80px;
		text-align: center;
		border-radius : 10px;
	}
	#commute{
		display: inline-block;
		border: 1px solid black;
		border-radius : 10px;
		height : 39px;
		padding: 5px;
		margin-top: 3px;
		font-size : 18px;
		width : 80px;
		text-align: center;
		margin-lfet : 10px;
	}
	#today{
		display: inline-block;
		font-weight: bold;
		font-size: 20px;
		margin-left: 50px;
		margin-right : 20px;
	}
	button{
		margin-left: 10px;
		margin-bottom: 3px;
	}
</style>
<title>Insert title here</title>
</head>
<body>

	<div id = "today"></div>
	<div id="commute"></div>
	<button type="button" value="출근" class ="btn btn-primary">출근</button>
	<div id="off"></div>
	<button type="button" value="퇴근" class ="btn btn-primary">퇴근</button>
	 <div id="chart_div" style="width: 900px; height: 500px;"></div>

</html>


<%@ include file="footer.jsp" %>