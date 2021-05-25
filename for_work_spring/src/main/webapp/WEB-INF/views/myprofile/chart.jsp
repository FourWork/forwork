<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DrawChart!</title>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript" src="/resources/js/portfolio.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- JSON 값 받아와서 차트그리기 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
        
        var m_id = '<c:out value ="${member_id}"/>';
        
        function drawChart(){
        	var langCount= $.ajax({
    			type:'get',
    			url:'/myprofile/'+m_id+'/chart.json',
    			dataType:"json",
    			async:false
    		}).responseText;
        	
        	console.log("춤");
    		console.log(langCount); 
    		console.log(m_id);
    		
    		// 문자열 langCount를 jsonarray로 parse
    		var contact = JSON.parse(langCount);
    		console.log(contact.length);
        
				
			var str='';
			var array=[['Programming Language','Count']];
			
		      
			for(var i = 0 ; i<contact.length;i++){

				var language= contact[i].language;
				var Count= contact[i].LANGUAGE_COUNT;
				var countNum=parseInt(Count);
				var innerArr=[];
				innerArr.push(language);
				innerArr.push(countNum);
				array.push(innerArr);
				}

			console.log(array);
			var data = google.visualization.arrayToDataTable(array);
			var options = {'title': 'Portfolio_language'}; 
			var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(data, options);
        }
        $(document).ready(function(){
			$(".alert-heading").click(function(){
				var submenu = $(".alert-heading-content");
				if( submenu.is(":visible")){
				submenu.slideUp();
				}else{
				submenu.slideDown();
				}
			});
		});
	</script>
</head>
<body>
<div class="card-body">
		<!-- 차트 들어갈 곳.. -->
		<div id="piechart" style="width: 500px; height: 400px;"></div>
</div>
</body>
</html>