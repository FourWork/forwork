<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>ForWork : 회원가입</title>
		<link rel="stylesheet" href="/views/CSS/join.css">
		
	</head>
	<body>
		<!-- header -->
		<div id="header">
			<img src="/Img/logo.png" id="logo">
		</div>


		<!-- wrapper -->
		<div id="wrapper">
		<form method="post" action="insertAction.do">
			<!-- content-->
			<div id="content">
			
				<!-- EMAIL -->
				<div>
					<h3 class="join_title"><label for="email">이메일<span class="optional"></span></label></h3>
					<span class="box int_email">
						<input type="text" name="email" id="email" class="int" maxlength="100" placeholder="abcd1234@gmail.com">
					</span>
					<span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>	
				</div>
				

				<!-- PW1 -->
				<div>
					<h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
					<span class="box int_pass">
						<input type="password" id="pswd1" name="pw" class="int" maxlength="20"
						placeholder="8자이상 특수문자포함"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$">
						<span id="alertTxt">사용불가</span>
						<img src="../Img/pw.jpg" id="pswd1_img1" class="pswdImg">
					</span>
					<span class="error_next_box"></span>
				</div>

				<!-- PW2 -->
				<div>
					<h3 class="join_title"><label for="pw">비밀번호 확인</label></h3>
					<span class="box int_pass_check">
						<input type="password" id="pswd2" name="pwck" class="int" maxlength="20">
						<img src="../Img/pw.jpg" id="pswd2_img1" class="pswdImg">
					</span>
					<span class="error_next_box"></span>
					<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
					<span id="alert-danger" style="display: none;color: #d92742; font-weight: bold;  ">비밀번호가 일치합니다.</span>
				</div>

				<!-- NAME -->
				<div>
					<h3 class="join_title"><label for="name">이름</label></h3>
					<span class="box int_name">
						<input type="text" id="name" name="name" class="int" maxlength="20">
					</span>
					<span class="error_next_box"></span>
				</div>

				

				<!-- MOBILE  추후 추가되면 프로젝트 진행-->
				<!--   <div>
					<h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
					<span class="box int_mobile">
						<input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
					</span>
					<span class="error_next_box"></span>	
				</div> --> 


				<!-- JOIN BTN-->
				<div class="btn_area" >
					<button type="submit" id="btnJoin" value="회원가입">
						<span>가입하기</span>
					</button>
				</div>
				
				
				
		
			</div> 
			</form>
			<!-- content-->

		</div> 
		<!-- wrapper -->
	<script src="main.js">
	 $('.int').focusout(function () {
	        var pwd1 = $("#password_1").val();
	        var pwd2 = $("#password_2").val();
	  
	        if ( pwd1 != '' && pwd2 == '' ) {
	            null;
	        } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	                $("#alert-success").css('display', 'inline-block');
	                $("#alert-danger").css('display', 'none');
	            } else {
	                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
	                $("#alert-success").css('display', 'none');
	                $("#alert-danger").css('display', 'inline-block');
	            }
	        }
	    });
	</script>
	</body>
</html>