<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- 부트스트랩 4.x를 사용한다. -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>

<title>Insert title here</title>
<style type="text/css">
#calendar {
	max-width: 1100px;
	margin: 40px auto;
}
</style>
</head>
<body>
	<div id='calendar'></div>
	<%@ include file="calendarModal.jsp"%>


	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				timeZone : 'UTC',
				initialView : 'dayGridMonth',
			    headerToolbar: {
			        center: 'addEventButton'
			    },
			    customButtons: {
			         addEventButton: {
			        	text : "일정 추가",
			             click:function(){
			            	 var modal = $("#calendarModal");
			            	 modal.modal("show");
			            	 $("#addCalendar").on("click",function(){
			            		 var project_id = "1";
			            		 var start = $("#calendar_start_date").val();
			            		 var start_date = new Date(start);
			            		 var end = $("#calendar_end_date").val();
			            		 var end_date = new Date(end);
			            		 var content = $("#calendar_content").val();
			            		 if(content ==""){
			            			 alert("일정 내용을 입력해주세요.");
			            		 }else if(isNaN(start_date) || isNaN(end_date)){
			            			 alert("날짜를 입력해주세요.");
			            		 }
		            			 else if(end_date - start_date < 0){
			            			 alert("종료 날짜가 시작 날짜보다 이전입니다.");			            			 
			            		 }
			            		 else{
			            			 var cal = {
			            					 "calendar_content":content,
			            					 "calendar_start_date":start,
			            					 "calendar_end_date":end,
			            					 "project_id":project_id
			            			 }
			            			 $.ajax({
			            				 url:"/calendar/add",
			            				 method:"POST",
			            				 contentType:"application/json",
			            				 data:JSON.stringify(cal),
			            				 success:function(data){
			            					 console.log(data);
			            				 }
			            			 })

			            		 }
			            		 modal.modal("hide");
			            		 calendar.render();
			            	 })
			            	
			             }
			     	}
			     },
				editable : true,
				selectable : true,
				events: "http://localhost:8081/calendar/get/1.json"
			});
			calendar.render();
		});
	</script>
	
</body>
</html>

<%@ include file="footer.jsp"%>