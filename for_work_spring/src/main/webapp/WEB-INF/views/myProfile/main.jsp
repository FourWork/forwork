<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<!-- Portfolio.js -->
	<script type="text/javascript" src="/resources/js/portfolio.js"></script>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- CSS -->
<!-- 	<link rel="stylesheet" type="text/css" href="../CSS/myprofile.css"> -->
	
<style>
	
.grid-container {
  display: grid;
  grid-template-columns: 1.2fr 0.7fr;
  grid-template-rows: 300px 1fr;
  gap: 0px 0px;
  grid-template-areas:
    "title-container title-container"
    "portfolio-container myprofile-title-container";
}

.portfolio-container { padding:10px;
padding-right:20px;
grid-area: portfolio-container; }

.myprofile-title-container { grid-area: myprofile-title-container; display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1.2fr 0.6fr 1.2fr;
  gap: 0px 0px;
  grid-template-areas:
    "profile_photo"
    "profile_info"
    "profile_chart";}

.title-container { grid-area: title-container; display: grid;
  grid-template-columns: 1.2fr 0.7fr;
  grid-template-rows: 1fr 1fr 1fr;
  gap: 0px 0px;
  grid-template-areas:
    ". ."
    ". ."
    "add-portfolio .";}

ul{
list-style:none;
padding-left:0px;
}

.grid-container2 {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 0.8fr 1.4fr 0.8fr;
  gap: 0px 0px;
  grid-template-areas:
    "portfolio-term"
    "portfolio-detail"
    "portfolio_language_List";
}
.portfolio-term { grid-area: portfolio-term; 
position: relative;}
.portfolio-detail { grid-area: portfolio-detail; }
.portfolio_language_List { grid-area: portfolio_language_List; }


.add-portfolio { grid-area: add-portfolio;
padding:10px;
padding-right:25px;
}

.btn-primary {
    color: #fff;
    background-color: #303c6c;
    border-color: #303c6c;
    float:right;
    position:relative;
	top:55px;
}

.badge badge-pill badge-primary{
padding:3px;
}

.profile_photo { grid-area: profile_photo; }
.profile_info { grid-area: profile_info; }
.profile_chart { grid-area: profile_chart; }


#icon_edit{
position: absolute;
right: 3px;
top: 3px;

}

#icon_delete{
position: absolute;
right: 50px;
top: 3px;

}


</style>

</head>
<body>
<div class="grid-container">
  <div class="portfolio-container">
  
	  <div id="accordion">
<!-- portfolio-list ul 시작 -->
	  <ul class="portfolio-list">
	  <div class="card">
	  <li class="left clearfix" portfolio_id='1'>
	    <div class="card-header" id="headingOne">
	      <h5 class="mb-0">
	        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	          	포트폴리오 제목
	        </button>
	      </h5>
	    </div>
	    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
	      <div class="card-body">
			<div class="grid-container2">
				<div class="portfolio-term">
				포트폴리오 기간
				</div>
	 			<div class="portfolio-detail">
	 			포트폴리오 상세
	 			</div>
	  			<div class="portfolio_language_List">
	  			<span class="badge badge-pill badge-primary">Java</span>
	  			<span class="badge badge-pill badge-primary">CSS</span>
	  			<span class="badge badge-pill badge-primary">JavaScript</span>
	  			</div>
			</div>
	      </div>
	    </div>
	   </li>
	  </div>

	  <div class="card">
	  	<li class="left clearfix" portfolio_id='2'>
	    <div class="card-header" id="headingTwo">
	      <h5 class="mb-0">
	        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          	포트폴리오2 제목
	        </button>
	      </h5>
	    </div>
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
	      <div class="card-body">
			<div class="grid-container2">
				<div class="portfolio-term">
				포트폴리오2 기간
				</div>
	 			<div class="portfolio-detail">
	 			포트폴리오2 상세
	 			</div>
	  			<div class="portfolio_language_List">
	  			포트폴리오2 언어
	  			</div>
			</div>
	      </div>
	    </div>
		</li>
	  </div>
	  </ul> 
	  <!-- portfolio-list ul 끝 -->	 
	</div>
  </div>
  <div class="myprofile-title-container">
	  <div class="profile_photo"></div>
	  <div class="profile_info"></div>
	  <div class="profile_chart"></div>
  </div>
  <div class="title-container">
		<div class="add-portfolio">
			<button id="addBtn" class="btn btn-primary" type="submit">Add Portfolio</button>
		</div>
  </div>
</div>
	<div class="card-body">
		<!-- 차트 들어갈 곳.. -->
		<div id="piechart" style="width: 500px; height: 400px;"></div>
	</div>
	
<div id="deleteModal" class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">포트폴리오 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <input type="hidden" id="portfolio_id" value="">
      <div class="modal-body">
        <p>정말 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button id="realDeleteBtn" type="button" class="btn btn-danger">삭제</button>
        <button id="backToList" type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">



$(document).ready(function(){
	var profileInfoDIV = $(".profile_info");
	var m_id = '<c:out value ="${member_id}"/>';
	console.log("@ShowInfo"+portfolioService);
	showInfo(); 
	
	function showInfo(){
		
		portfolioService.getInfo({
			member_id : m_id
		}, function(member){
			console.log("test"+member.name);
			var str="<div class='member_name'>"+member.name+"</div>";
			str+="<div clas='member_email'>"+member.email+"</div>";
			profileInfoDIV.html(str);
		});
	 } 
	
});	
	
	
$(document).ready(function(){
	console.log("@showPfList"+portfolioService);
	
	var m_id = '<c:out value ="${member_id}"/>';
	console.log("m_id" + m_id);
	
	function add() {
		window.location.href = "add?member_id="+m_id;
	}

	var p_id='';
	
	var deleteBtn = $("#deleteBtn");
	var portfolioUL = $(".portfolio-list");
	
	$("#addBtn").on("click",function(){
		self.location="add?member_id="+m_id;
	})
	
		$(document).on("mouseover", "li", function(e){
		var modal = $(".modal");
		var p_id = $(this).data("portfolio_id");
		/* alert(p_id); */
		var editBtn = $("#icon_edit");
		var delteBtn = $("#icon_delete");
		var realDeleteBtn = $("#realDeleteBtn");
		editBtn.on("click",function(e){
			self.location="update?portfolio_id="+p_id;	
		});
		deleteBtn.on("mouseover",function(e){
			document.getElementById("portfolio_id").value=p_id;
			realDeleteBtn.on("click",function(){
				var project_id=document.getElementById("portfolio_id").value;
				portfolioService.remove({
						portfolio_id:project_id
					},function(result){
						alert(result);
						modal.modal("hide");
						showList();
					})
				}) 
		})

		})
	
	

	

	
	showPfList();	
	
	function showPfList(){
		//배열선언
		portfolioService.getList({
			member_id : m_id
			}, function(list){
				var str="";
				if(list == null || list.length ==0){
				}
				
				for(var i = 0, len = list.length||0;i<len;i++){
					/* console.log("list"+list[i].portfolio_title); */
					str +="<li class= 'left clearfix' data-portfolio_id="+list[i].portfolio_id+">";
					str +="	<div class='card-header' id='heading"+i+"'>";
					str +="	  <h5 class='mb-0'>";
					if(i == 0){
					str +="	     <button class='btn btn-link' data-toggle='collapse' data-target='#collapse"+i+"' aria-expanded='true' aria-controls='collapse"+i+"'>";
					}else{
					str +="	     <button class='btn btn-link' data-toggle='collapse' data-target='#collapse"+i+"' aria-expanded='false' aria-controls='collapse"+i+"'>";
					}
					str +=list[i].portfolio_title;
					str +="		 </button>";
					str +="		</h5>";
					str +="	</div>";
					if(i==0){
					str +="<div id='collapse"+i+"' class='collapse show' aria-labelledby='heading"+i+"' data-parent=''#accordion'>";
					}else{
					str +="<div id='collapse"+i+"' class='collapse' aria-labelledby='heading"+i+"' data-parent=''#accordion'>";
					}
					str +="	<div class='card-body'>";
					str +="		<div class='grid-container2'>";
					str +="			<div class='portfolio-term'>";
					str +=portfolioService.displayTime(list[i].portfolio_start_date)+"-"+portfolioService.displayTime(list[i].portfolio_end_date);
					
					str +="<a><button id='icon_delete'type='button' class='btn btn-outline-danger' data-toggle='modal' data-target='#deleteModal'>";
					str +="<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash' viewBox='0 0 16 16'>";
					str +="<path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>";
					str +="<path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>";	
					str +="</svg>"+"</button></a>";
					
					str +="<a><button id='icon_edit'type='button' class='btn btn-outline-primary'>";
					str += "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-pencil-square' viewBox='0 0 16 16'>";
					str +="<path d='M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z'/>";
					str +="<path fill-rule='evenodd' d='M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z'/>";
					str +="</svg>"+"</button></a></div>";
					str +="<div class='portfolio-detail'>"+list[i].portfolio_detail+"</div>";
					
					/* console.log(list[i].portfolio_id); */
					p_id=list[i].portfolio_id;
					/* console.log(p_id); */
					str +="<div class='portfolio_language_List'>";
					for(var j =0 ,len0 = list[i].portfolioLanguage.length || 0 ; j < len0 ; j++){
						/* console.log(list[i]) */

					str+= "<span class='badge badge-pill badge-primary'>"+list[i].portfolioLanguage[j].portfolio_language+"</span>";
					};
					str+="</div></div></div></div></li>";
					/* console.log(list[i].portfolio_title); */
				}
				portfolioUL.html(str);

		});
		
	}//end showPfList
	

});



 


</script>
</body>
</html>
<%@ include file="../footer.jsp" %>