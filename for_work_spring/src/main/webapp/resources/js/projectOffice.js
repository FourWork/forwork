console.log("ProjectOffice Module.....");

var projectOfficeService=(function(){
	function getStatusId(param, callback, error){
		var project_id = param.project_id;
		$.get("/PMOpage/"+project_id+"/status_id.json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function displayTime(timeValue){
		
		var dateObj = new Date(timeValue);
		var str="";
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth()+1;
		var dd = dateObj.getDate();
		
		return[yy,'-',(mm > 9 ? '' : '0')+mm,'-',
			(dd>9 ?'' :'0')+dd].join('');
	}
	
	
//	function update(param, callback, error){
//		console.log("AAAAAAAAAA");
//		$.ajax({
//			url: "/PMOPage/3/update",
//			success: function(){
//				console.log("성공");
//			}
//		})	
//	}
	
//	function update(param, callback, error){
//		$.ajax({
//			type: 'PUT',
//			url: "/PMOPage/"+{project_id}+"/update",	
//			data: JSON.stringify(param),
//			contentType: "application/json; charset=utf-8",
//			success : function(result, status, xhr){
//				if(callback){
//					callback(result);
//				}
//			},
//			error:function(xhr, status, er){
//				if(error){
//					error(er)
//				}
//			}
//		});
//	}
	
	function update(param, callback, error){
		$.ajax({
			type: 'PUT',
			url: '/PMOPage/'+param.project_id+'/update',	
			data: JSON.stringify(param),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr, status, er){
				if(error){
					error(er)
				}
			}
		});
	}
	
return {
	getStatusId:getStatusId,
	displayTime:displayTime,
	update:update,
	hello:hello
	};
})();