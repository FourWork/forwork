console.log("Portfolio Module.....");

var portfolioService=(function(){
	function add(portfolio, callback){
		console.log("portfolio..........");
	}
	function getList(param,callback,error){
		var member_id = param.member_id;
		$.getJSON("/memer_id/"+member_id+".json",
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
		getList: getList
		};
})();