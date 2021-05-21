<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/portfolio.js"></script>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>


	<script type="text/javascript">
	$(document).ready(function() {
	console.log("======TEST========")
		
	/* var p_id = '<c:out value ="${portfolio_id}"/>';
		console.log("p_id" + p_id); 
	
		portfolioService.delete(
				{
		portfolio_id : p_id
		} , function(count){
			console.log("count"+count);
			if(count === "success"){
				alert("삭제완료");
			}
		}, function(err){
			alert("error");
		});  */
		
		portfolioService.update({
				portfolio_id: 76,
				portfolio: { 
			        "portfolio_title":"HaHa ControllerTest_Title",
			        "portfolio_detail":"HaHa ControllerTest_Detail"
			        },
			    pfLangList:[
			            {
			                "portfolio_language":"HaHa language1"
			             },
			            {
			                "portfolio_language":"HaHa language2"
			             },
			            {
			                "portfolio_language":"HaHa language3"
			             },
			            {
			                "portfolio_language":"HaHa language4"
			            }
			         ]   }
				, function(result){
			console.log("수정완료");
		}); 
		
		
	});
</script>
</body>
</html>
<%@ include file="../footer.jsp" %>