<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADD PAGE</title>
<script type="text/javascript" src="/resources/js/portfolio.js"></script>
	<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
    
						<!-- 수정영역 -->
			<!-- <form action="insertPortfolioAction.do" method="post"> -->
<input type="hidden" name="member_id" value="">
	<div class="column_left" style="width:66.6%">
		<div class="card_">
            <div class="card-header">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">포트폴리오 추가하기</h3>
                </div>
                <div class="col-4 text-right">
                   <input id="PortfolioSubmit" class="btn btn-primary" type="submit" value="제출하기">
                </div>
              </div>
            </div>
            <div class="portfolio">
			<h6 class="heading-small text-muted mb-4">Portfolio information</h6>
				<div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label">포트폴리오 제목</label>
                        <input type="text" name="portfolio_title">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label">포트폴리오 기간</label><br>
                        <label class="form-control-label">
                        <div class="portfolio_date">시작 날짜</div></label>
                        <input type="date" name="portfolio_start_date">
                        <label class="form-control-label">
                       	<div class="portfolio_date">종료 날짜</div></label>
                        <input type="date" name="portfolio_end_date">
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4">
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">포트폴리오 상세</h6>
                <div class="pl-lg-4">
					<div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label">포트폴리오 요약</label>
                        <textarea rows="5" class="form-control" name="portfolio_detail"></textarea>
                      </div>
                    </div>
                </div>
   <!-- 언어 -->
               <hr class="my-4">
                <h6 class="heading-small text-muted mb-4">포트폴리오 사용 언어</h6>
                <div class="pl-lg-4">
                  <div class="row">
                     <div class="col-md-12">
                      <div class="form-group">
						<p>포트폴리오 언어 선택</p>
							<label><input type="checkbox" name="portfolio_language" value="Django"> Django</label>
							<label><input type="checkbox" name="portfolio_language" value="AngularJS"> AngularJS</label>
							<label><input type="checkbox" name="portfolio_language" value="Java"> Java</label>
							<label><input type="checkbox" name="portfolio_language" value="Retrofit"> Retrofit</label>
							<label><input type="checkbox" name="portfolio_language" value="REST API"> REST API</label>
							<label><input type="checkbox" name="portfolio_language" value="Keras"> Keras</label><br>
							<label><input type="checkbox" name="portfolio_language" value="Docker"> Docker</label>
							<label><input type="checkbox" name="portfolio_language" value="C#"> C#</label>
							<label><input type="checkbox" name="portfolio_language" value="Android"> Android</label>
							<label><input type="checkbox" name="portfolio_language" value="Arduino"> Arduino</label>
							<label><input type="checkbox" name="portfolio_language" value="Hyperledger"> Hyperledger</label>
							<label><input type="checkbox" name="portfolio_language" value="CSS"> CSS</label><br>
							<label><input type="checkbox" name="portfolio_language" value="JavaScript"> JavaScript</label>
							<label><input type="checkbox" name="portfolio_language" value="Firebase"> Firebase</label>
							<label><input type="checkbox" name="portfolio_language" value="Python"> Python</label>
							<label><input type="checkbox" name="portfolio_language" value="Node.js"> Node.js</label>
							<label><input type="checkbox" name="portfolio_language" value="Git"> Git</label>
							<label><input type="checkbox" name="portfolio_language" value="ES6"> ES6</label><br>
							<label><input type="checkbox" name="portfolio_language" value="MySQL"> MySQL</label>
							<label><input type="checkbox" name="portfolio_language" value="iOS"> iOS</label>
							<label><input type="checkbox" name="portfolio_language" value="SQL"> SQL</label>
							<label><input type="checkbox" name="portfolio_language" value="Linux"> Linux</label>
							<label><input type="checkbox" name="portfolio_language" value="Go"> Go</label>
							<label><input type="checkbox" name="portfolio_language" value="OpenStack"> OpenStack</label><br>
							<label><input type="checkbox" name="portfolio_language" value="PHP"> PHP</label>
							<label><input type="checkbox" name="portfolio_language" value="HTML"> HTML</label>
							<label><input type="checkbox" name="portfolio_language" value="Gradle"> Gradle</label>
							<label><input type="checkbox" name="portfolio_language" value="Tensorflow"> Tensorflow</label>
							<label><input type="checkbox" name="portfolio_language" value="NLP"> NLP</label>
							<label><input type="checkbox" name="portfolio_language" value="MongoDB"> MongoDB</label><br>
							<label><input type="checkbox" name="portfolio_language" value="Redis"> Redis</label>
							<label><input type="checkbox" name="portfolio_language" value="Objective-C"> Objective-C</label>
							<label><input type="checkbox" name="portfolio_language" value="Pandas"> Pandas</label>
							<label><input type="checkbox" name="portfolio_language" value="OpenGL"> OpenGL</label>
							<label><input type="checkbox" name="portfolio_language" value="C++"> C++</label>
							<label><input type="checkbox" name="portfolio_language" value="Spring"> Spring</label><br>
							<label><input type="checkbox" name="portfolio_language" value="ReactJS"> ReactJS</label>
							<label><input type="checkbox" name="portfolio_language" value="C"> C</label>
							<label><input type="checkbox" name="portfolio_language" value="jQuery"> jQuery</label>
							<label><input type="checkbox" name="portfolio_language" value="Kotlin"> Kotlin</label>
							<label><input type="checkbox" name="portfolio_language" value="React Native"> React Native</label>
							<label><input type="checkbox" name="portfolio_language" value="PyTorch"> PyTorch</label><br>
							<label><input type="checkbox" name="portfolio_language" value="Unity"> Unity</label>
							<label><input type="checkbox" name="portfolio_language" value="NoSQL"> NoSQL</label>
							<label><input type="checkbox" name="portfolio_language" value="Terraform"> Terraform</label>
							<label><input type="checkbox" name="portfolio_language" value="Raspberry Pi"> Raspberry Pi</label>
							<label><input type="checkbox" name="portfolio_language" value="WebGL"> WebGL</label>
							<label><input type="checkbox" name="portfolio_language" value="Kibana"> Kibana</label><br>
							<label><input type="checkbox" name="portfolio_language" value="GCP(Google Cloud Platform)"> GCP(Google Cloud Platform)</label>
							<label><input type="checkbox" name="portfolio_language" value="Vue.js"> Vue.js</label>
							<label><input type="checkbox" name="portfolio_language" value="Realm"> Realm</label>
							<label><input type="checkbox" name="portfolio_language" value="Logstash"> Logstash</label>
							<label><input type="checkbox" name="portfolio_language" value="Ruby on Rails"> Ruby on Rails</label>
							<label><input type="checkbox" name="portfolio_language" value="XML"> XML</label><br>
							<label><input type="checkbox" name="portfolio_language" value="Swift"> Swift</label>
							<label><input type="checkbox" name="portfolio_language" value="Fluentd"> Fluentd</label>
							<label><input type="checkbox" name="portfolio_language" value="Webpack"> Webpack</label>
							<label><input type="checkbox" name="portfolio_language" value="RxJava"> RxJava</label>
							<label><input type="checkbox" name="portfolio_language" value="COcos2d"> COcos2d</label>
							<label><input type="checkbox" name="portfolio_language" value="Linux kernel"> Linux kernel</label>
						</div>
                    </div>
                  </div>
                </div>
           	 </div>
          </div>
		</div>
			<!-- </form> -->
			





<script type="text/javascript">
$(document).ready(function(){
	console.log("===================");
	console.log("JS TEST");
	
	var m_id = '<c:out value ="${member_id}"/>';
	console.log("m_id" + m_id);
	var formInputTitle= $("input[name='portfolio_title']").val();
	console.log("제목!!"+ formInputTitle);
	var formInputDetail=$("textarea[name='portfolio_detail']").val();
	var formInputStartDate=$("input[name='portfolio_start_date']").val();
	var formInputEndDate=$("input[name='portfolio_end_date']").val();
	
	$("#PortfolioSubmit").click(function(){
		var langArray = [];
		
		$('input[name="portfolio_language"]:checked').each(function(i){
			langArray.push($(this).val());
		});
		//for portfolioService add 
		 portfolioService.add({
			portfolio: { 
		        "portfolio_title":formInputTitle,
		        "portfolio_detail":formInputDetail,
		        "portfolio_start_date":formInputStartDate,
		        "portfolio_end_date":formInputEndDate,
		        },
		    pfLangList:langArray,
		    member_id : m_id},
		 function(result){
	    	 alert("RESULT: "+result);
	     }
		); 
		
	})
	

	
});
</script>
</body>
</html>
<%@ include file="../footer.jsp" %>