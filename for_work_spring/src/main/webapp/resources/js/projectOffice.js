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
return {
	getStatusId:getStatusId,
	displayTime:displayTime
	};
})();