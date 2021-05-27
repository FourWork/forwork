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
	
	
	
//	function update(param, callback, error){
//		console.log("AAAAAAAAAA");
//		$.ajax({
//			type:'PUT',
//			url: "/PMOPage/4/update",
//			success: function(){
//				console.log("성공");
//			},
//			error: function(){
//				console.log("에러");
//			}
//		});	
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
	
	function update(dto, callback, error){
		$.ajax({
			method: "PUT",
			url: '/PMOpage/'+dto.project_id+'/update',	
			data: JSON.stringify(dto),
			contentType: "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr, status, er){
				console.log(dto);
				if(error){
					error(er)
				}
			}
		});
	}
	
return {
	getStatusId:getStatusId,
	update:update
	};
})();