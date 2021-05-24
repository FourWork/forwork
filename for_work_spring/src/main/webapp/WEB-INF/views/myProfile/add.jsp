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
<script type="text/javascript">
$(document).ready(function(){
	console.log("===================");
	console.log("JS TEST");
	
	var m_id = '<c:out value ="${member_id}"/>';
	console.log("m_id" + m_id);
	
	//for portfolioService add test
	 portfolioService.add({
		portfolio: { 
	        "portfolio_title":"haHa ControllerTest_Title",
	        "portfolio_detail":"haHa ControllerTest_Detail"
	        },
	    pfLangList:[
	        {
	            "portfolio_language":"haHa language1"
	         },
	        {
	            "portfolio_language":"haHa language2"
	         },
	        {
	            "portfolio_language":"haHa language3"
	         },
	        {
	            "portfolio_language":"haHa language4"
	        }
	     ], member_id : m_id},
	 function(result){
    	 alert("RESULT: "+result);
     }
	); 
	
});
</script>
</body>
</html>
<%@ include file="../footer.jsp" %>