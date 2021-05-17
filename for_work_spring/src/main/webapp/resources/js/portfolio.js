console.log("Portfolio Module.....");

var portfolioService=(function(){
	function add(wrapper, callback, error){
		console.log("wrapper(portfolio+pfLangList)..........");
	$.ajax({
		type: 'post',
		url: '/myprofile/'+wrapper.member_id+'/new',
		data: JSON.stringify(wrapper),
		contentType: "application/json; charset=utf-8",
		success: function(result, status, xhr){
			if(callback){
				callback(result);
			}
		},
		error: function(xhr, status, er){
		console.log("========add_if_error========")
			if(error){
				error(er);
			}
		}	
		})
	}/*add 함수 끝*/
	function getList(param,callback,error){
		var member_id = param.member_id;
		$.getJSON("/myprofile/"+member_id+"list.json",
			function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}/*getList 함수 끝*/
	
	function remove(portfolio_id, callback, error){
		//var portfolio_id = param.portfolio_id; 
		console.log("@Portfolio.js remove");
		console.log("portfolio_id"+portfolio_id);
		$.ajax({
			type:'delete',
			url: '/myprofile/'+portfolio_id,
			success: function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function update(wrapper, callback, error){
		console.log("wrapper"+ wrapper.portfolio);
		$.ajax({
			type: 'put',
			url: '/myprofile/'+wrapper.portfolio_id,
			data: JSON.stringify(wrapper),
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
	
	function get(param,callback,error){
		var portfolio_id = param.portfolio_id;
		var member_id = param.member_id;
		console.log("portfolio_id"+portfolio_id)
		$.getJSON("/myprofile/"+member_id+"/"+portfolio_id+".json",
			function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	return {add:add,
		getList: getList,
		remove: remove,
		update: update,
		get: get
		};
})();