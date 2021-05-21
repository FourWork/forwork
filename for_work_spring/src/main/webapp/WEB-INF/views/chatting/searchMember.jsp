<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.title-container {
		width: 100%;
   		background-color: rgb(212, 214, 241);
   		height: 80px;
   		margin: auto;
	}
	.title {
		margin-left: 43%;
   		line-height: 80px;
   		font-weight: bold;
   		font-size: 20px;
	}
	.search {
		padding-left: 2%;
		width: 97%;
		height: 40px;
		margin-top: 10px;
		border: 1px solid rgb(212, 211, 211);
	}
	.search:focus {
		outline: none !important;
        border: 1px solid #5a1ac0;
	}
	
	 .btn {
        background-color: #5a1ac0;
        padding: 15px;
        border-radius: 10px;
        color: white;
        font-size: 13px;
        text-decoration: none;
        margin-right: 20px;
      }
      
      #all {
      	height: 900px;
      }
       
       #member {
       	height: 70%;
       }
       
       #footer {
       	margin-left: 45%;
       }
</style>
</head>
<body>
	<div id="all">
		<div class="title-container"><div class="title">대화상대 초대</div></div>
		<input type="text" class="search" placeholder="이름으로 검색해보세요"/>
		<div id="member">
		</div>
		<div id="footer"><a class="btn">취소</a><a class="btn">초대</a></div>
	</div>
</body>
</html>