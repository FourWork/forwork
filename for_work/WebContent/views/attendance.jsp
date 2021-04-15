<%@page import="org.forwork.dto.WeekAttendance"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		 

	google.charts.load('current', {packages: ['corechart', 'bar']});
 	google.charts.setOnLoadCallback(drawAxisTickColors);
 	function drawAxisTickColors(){
 	   	var data = new google.visualization.DataTable();
 	   	data.addColumn('string','day');
 	   	data.addColumn('number','근무시간');
 	   	data.addRows([
	         ['월요일', 0],            
 	         ['화요일', 0],            
 	         ['수요일', 0],
 	         ['목요일', 0],
 	         ['금요일', 0],
 	         ['토요일', 0],
 	         ['일요일', 0]
 	   	]);
 	   	var obj = {};
 	   	
 	   	<%List<WeekAttendance> li = (List<WeekAttendance>)request.getAttribute("week");
 	   	if(li != null){
 	   	for(int i = 0; i < li.size();i++){
 	   		double time = 0;
 	   		WeekAttendance temp = li.get(i);
 		   	int c_hour = Integer.parseInt(temp.getCommute().substring(0, 2));
			int c_min = Integer.parseInt(temp.getCommute().substring(3, 5));
			if(temp.getOff() != null){
				int o_hour = Integer.parseInt(temp.getOff().substring(0, 2));
				int o_min = Integer.parseInt(temp.getOff().substring(3, 5));
				time = ((o_hour*60+o_min)-(c_hour*60+c_min))/60.0 - 1;
			}
	 	   	String week = temp.getWeek();
	 	   	%>
	 	   	Object.assign(obj,{"<%=week%>":"<%=time%>"});
	 	   	<%
 	   	}%>   	
		for (var i = 0; i < 7; i++) {
				for ( var s in obj) {
					if (data.getValue(i, 0) == s) {
						data.setValue(i, 1, obj[s]);
					}
				}
		} 	   	
 	   	<%}%>

			var options = {
				title : '주간 근무 현황',
				colors :['blue']
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
 	
 	$(function(){
 		var date = new Date();
 		console.log(date);
 		console.log(date.getDay());
 		console.log(date.toLocaleString());
 		console.log(date.getMonth());
 		var month = date.getMonth()+1;

 		var ago = "<%=request.getParameter("ago")%>";
		if(ago == 'null'){
			ago = 0;
		}
		$("#previous").attr("href","/for_work/attendance/main?ago="+(parseInt(ago)+1));
		$("#next").attr("href","/for_work/attendance/main?ago="+(parseInt(ago)-1));

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
	#changeWeek{
		margin-top : -30px;
		margin-left : 375px;
		z-index: 10;
		position: fixed;
	}
	svg{
	margin-left: 10px;
	margin-right: 10px; 
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
	<div id = "changeWeek"><a href="" id = "previous"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
</svg></a>04.12~04.18<a href="" id = "next"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
</svg></a></div>

</html>


<%@ include file="footer.jsp" %>