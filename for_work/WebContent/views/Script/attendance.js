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
			 		var check = window.prompt($(this).val()+"하시려면 "+$(this).val()+"을 입력해주세요", "");
					//출근 또는 퇴근 실행
					if(check == $(this).val()){
						if(check == "출근"){
							location.href="/for_work/attendance/commute";
						}else{
							if($("#commute").html() != "-"){
								location.href="/for_work/attendance/off";
							}else{
								alert("아직 출근하지 않았습니다.");
							}
							}
					}else{
						alert("잘못된 입력입니다.")}
				})
				 })
	 
	 
	 