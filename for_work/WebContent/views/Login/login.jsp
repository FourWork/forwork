<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ForWork</title>
<link rel="stylesheet" href="/views/CSS/login.css">

</head>
<body>
	<!-- header -->
	<div id="header">
		<img src="/Img/logo.png" id="logo">
	</div>

	<!-- wrapper -->
	<div id="wrapper">
		<form method="get">
			<!-- content-->
			<div id="content">
				<!-- EMAIL -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일<span class="optional"></span></label>
					</h3>
					<span class="box int_email"> <input type="text" id="email"
						class="int" maxlength="100" placeholder="abcd1234@gmail.com">
					</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
				</div>

				<!-- PW -->
				<div>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="password" id="pswd1"
						class="int" maxlength="20"> <span id="alertTxt">사용불가</span>
						<img src="/Img/pw.jpg" id="pswd1_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- Login BTN-->
				<div class="btn_area">
					<button type="submit" id="btnLogin" value="로그인"
						formaction="login.do">
						<span>로그인</span>
					</button>
				</div>

				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin" value="회원가입"
						formaction="/member/join.do">
						<span>회원가입</span>
					</button>
				</div>
				
			</div>
			<!-- content-->
		</form>
	</div>

	<!-- wrapper -->
	<script src="main.js"></script>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ForWork</title>
<link rel="stylesheet" href="/views/CSS/login.css">

</head>
<body>
	<!-- header -->
	<div id="header">
		<img src="/Img/forworklogo.JPG" id="logo">
	</div>

	<!-- wrapper -->
	<div id="wrapper">
		<form method="get">
			<!-- content-->
			<div id="content">
				<!-- EMAIL -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일<span class="optional"></span></label>
					</h3>
					<span class="box int_email"> <input type="text" id="email"
						class="int" maxlength="100" placeholder="abcd1234@gmail.com">
					</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
				</div>

				<!-- PW -->
				<div>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="text" id="pswd1"
						class="int" maxlength="20"> <span id="alertTxt">사용불가</span>
						<img src="/Img/pw.jpg" id="pswd1_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- Login BTN-->
				<div class="btn_area">
					<button type="submit" id="btnLogin" value="로그인"
						formaction="login.do">
						<span>로그인</span>
					</button>
				</div>

				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin" value="회원가입"
						formaction="/member/join.do">
						<span>회원가입</span>
					</button>
				</div>
				
			</div>
			<!-- content-->
		</form>
	</div>

	<!-- wrapper -->
	<script src="main.js"></script>
</body>
>>>>>>> 4dc84dc50dd09c3398d232ff0add9ecaf14fe764
</html>