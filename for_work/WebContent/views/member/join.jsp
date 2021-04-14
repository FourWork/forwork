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
            <img src="/Img/forworklogo.JPG" id="logo">
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
                        <input type="text" id="pswd1" name="pw" class="int" maxlength="20" >
                        <span id="alertTxt">사용불가</span>
                        <img src="../Img/pw.jpg" id="pswd1_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pw">비밀번호 확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="text" id="pswd2" class="int" maxlength="20">
                        <img src="../Img/pw.jpg" id="pswd2_img1" class="pswdImg">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" name="name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box"></span>
                </div>

                

                 <!-- MOBILE -->
               <!--   <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box"></span>    
                </div> --> 


                <!-- JOIN BTN-->
                <div class="btn_area" >
                    <button type="submit" id="btnJoin">
                        <span>가입하기</span>
                    </button>
                </div>
                
                
                
		
            </div> 
            </form>
            <!-- content-->

        </div> 
        <!-- wrapper -->
    <script src="main.js"></script>
    </body>
</html>