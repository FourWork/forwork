	google.charts.load('current', {packages: ['corechart', 'bar']});
 	google.charts.setOnLoadCallback(drawAxisTickColors);
 	function drawAxisTickColors(){
 	   	var data = google.visualization.arrayToDataTable([
 	         ['요일', '근무시간', { role: 'style' }],
 	         
 	         ['월요일', 8, 'blue'],            
 	         ['화요일', 8, 'blue'],            
 	         ['수요일', 0, 'blue'],
 	         ['목요일', 8, 'blue'],
 	         ['금요일', 8, 'blue'],
 	         ['토요일', 1, 'red'],
 	         ['일요일', 1, 'red']
 	      ]);
 	      
 	      var options = {
 	    	        title: '주간 근무 현황',
 	    	        
 	    	      };
 	      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
 	      chart.draw(data, options);
 	 }

	 $(function(){
		 var now = new Date();
		 var month = now.getMonth()+1;
		 var date = now.getDate();
		 month = month >=10 ? month : "0" + month;
		 date  = date  >= 10 ? date : "0" + date;
		 $('#today').html(month+"월 "+date+"일");
		 
		 });
		 
		  $(function(){
	$("button").click(function() {	
 		var check = window.prompt($(this).val()+"하실거면 "+$(this).val()+"을 입력해주세요", "");
		//출근 또는 퇴근 실행
		if(check == $(this).val()){
			if(check == "출근"){
				location.href="/for_work/attendance/commute";
			}else{
				location.href="/for_work/attendance/off";
				}
		}else{
			alert("잘못된 입력입니다.")}
	})
	 })
	 
	 