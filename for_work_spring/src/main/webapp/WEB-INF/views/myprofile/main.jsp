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
.portfolio-term { grid-area: portfolio-term; }
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

	<script type="text/javascript">
$(document).ready(function(){
	console.log(portfolioService);
	
	var m_id = '<c:out value ="${member_id}"/>';
	console.log("m_id" + m_id);
	
	var p_id='';
	
	var profileInfoDIV = $(".profile_info");
	var portfolioUL = $(".portfolio-list");
	
	$("#addBtn").on("click",function(){
		self.location="/myprofile/add"
	})
/*  showInfo();  */
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
				str +="<li class= 'left clearfix' portfolio_id="+list[i].portfolio_id+"'>";
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
				str +=portfolioService.displayTime(list[i].portfolio_start_date)+"-"+portfolioService.displayTime(list[i].portfolio_end_date)+"</div>";
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