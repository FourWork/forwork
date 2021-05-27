<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<!-- projectOffice.js -->
	<script type="text/javascript" src="/resources/js/projectOffice.js"></script>	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
.grid-container {
padding:20px;
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1fr;
  grid-template-rows: 0.6fr 0.5fr 0.5fr 2.4fr;
  gap: 5px 10px;
  grid-template-areas:
    "title project-date project-date approval"
    "PM PA PA PA"
    "project-term project-term project-term project-term"
    "project-detail project-detail project-detail project-detail";
}

.title { grid-area: title;
text-align:center;
 }

.project-date {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1fr 1fr 1fr;
  gap: 0px 0px;
  grid-template-areas:
    "registered-date"
    "checked-date"
    "completed-date";
  grid-area: project-date;
  text-align:center;
}

.registered-date { grid-area: registered-date; }

.checked-date { grid-area: checked-date; }

.completed-date { grid-area: completed-date; }

.approval {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr;
  gap: 0px 0px;
  grid-template-areas:
    "approval-status button-group";
  grid-area: approval;
}

.approval-status { grid-area: approval-status; }

.button-group { grid-area: button-group; }

.PM { grid-area: PM; }

.PA { grid-area: PA; }

.project-term { grid-area: project-term; }

.project-detail { grid-area: project-detail; }

	</style>
</head>
	<body>
	
		 <div class="grid-container">
		  <div class="title"> <c:out value="${project.project_title}"/> </div>
		  <div class="project-date">
          <div class="registered-date"><td> <fmt:formatDate pattern="yyyy-MM-dd"
                           value="${timeline.register_date}" /> </td></div>
          <div class="checked-date"><td> <fmt:formatDate pattern="yyyy-MM-dd"
                           value="${timeline.check_date}" /> </td></div>
          <div class="completed-date"><td><fmt:formatDate pattern="yyyy-MM-dd"
                           value="${timeline.complete_date}" /></td></div>
		  </div>
		  <div class="approval">
		  <!-- 승인상태에 따라 색깔있는 배지표현 -->
		  <c:set var = "approval_id" scope = "session" value = "${project.approval_id}"/>
		  	 <c:choose>
				<c:when test = "${approval_id ==1 }">
				<div class='approval-status'>상태:<span class='badge badge-warning'>승인대기</span></div><div class='button-group'><button type='button' data-approval_id='2' class='btn btn-success'>승인</button><button type='button' data-approval_id='3' class='btn btn-danger'>반려</button></div>
		  	  </c:when>
				<c:when test = "${approval_id ==2 }">
				<div class='approval-status'>상태:<span class='badge badge-success'>승인</span></div><div class='button-group'><button type='button' data-approval_id='4' class='btn btn-primary'>완료</button></div>
			
		  	  </c:when>
				<c:when test = "${approval_id ==3 }">
				<div class='approval-status'>상태:<span class='badge badge-"secondary'>반려</span></div><div class='button-group'></div>
				
		  	  </c:when>
				<c:when test = "${approval_id ==4 }">
				<div class='approval-status'>상태:<span class='badge badge-primary'>완료</span></div><div class='button-group'></div>
		  	  </c:when>
		  	 </c:choose>
		  	 
		  	 
		    
		  </div>
		  <div class="PM"><c:out value="${project.name}"/></div>
		  <div class="PA">
			  <c:forEach items="${memberList}" var="member">
			 	<c:out value="${member.name}"/>
			  </c:forEach>
		  </div>
		  <div class="project-term"><c:out value="${project.project_start_date}"/>~<c:out value="${project.project_end_date}"/></div>
		  <div class="project-detail"></div>
		</div>
	</body>
	<script>
	$(document).ready(function(){
		
		 $(document).on("click", "[class^=btn]", function(e){
			 console.log("btn click!");
			 
		      var p_id = '<c:out value ="${project_id}"/>';
		      var a_id = $(this).data("approval_id");
		      projectOfficeService.update({
		             project_id:p_id,
		             approval_id:a_id
		          },function(result){
		             alert("RESULT: "+result);

		          })
/* 		            self.location="main"; */
		          
		})
		
		
	})
	

	</script>
</html>
<%@ include file="../footer.jsp" %>