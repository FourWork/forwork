<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!-- Header & Menu -->
	<%-- <%@ include file="../includes/header.jsp" %> --%>

	<!-- Main content -->
	<div class="container">
      <div class="row justify-content-center text-center">
        <div class="col-lg-5 col-md-7 mt-5">
          <div class="card bg-secondary border-0 mb-0">
          <!-- card -->
            <div class="card-header bg-transparent pb-5">
            	<div>
            		<h1>회원가입</h1>
            		<hr class="my-4"/>
            	</div>
            	
			    <div class="container">
			    	<div class="row">
						<div class="form-group col-md-12 mt-3 form-inline">
					        <label for="example-email-input" class="form-control-label col-md-5 align-self-center">이메일:</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="email" name="userid" id="userid">
					        </div>
						</div>
						<div class="form-group col-md-12 form-inline">
<%--							<button class="btn btn-primary col-md-4" id="id-check" type="button" onclick="idCheck()">ID중복체크</button>--%>
							<div class="check-font col-md-12" id="check"></div>
						</div>
					    <div class="form-group col-md-12 form-inline">
					        <label for="example-password-input" class="form-control-label col-md-5 align-self-center">비밀번호 :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="password" name="userpw"
								   placeholder="8자이상 특수문자포함"
								   pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$">
					        </div>
					    </div>
					    <div class="form-group col-md-12 form-inline">
					        <label for="example-password-input" class="form-control-label col-md-5 align-self-center">비밀번호 확인 :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="password" name="userpwck">
					        </div>
					    </div>
					    <div class="form-group col-md-12 form-inline">
					        <label for="example-name-input" class="form-control-label col-md-5 align-self-center">이름 :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="text" name="real_name">
					        </div>
					    </div>
					    <div class="form-group col-md-12 form-inline">
					        <label for="example-tel-input" class="form-control-label col-md-5 align-self-center">전화번호 :</label>
					        <div class="col-md-7">
					        	<input class="form-control" type="text" name="userphone"
					        	placeholder="xxx-xxxx-xxxx"
								id="userphone" maxlength="13" pattern="^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$">
					        </div>
					    </div>
				    </div>
			    </div>
			    <button class="btn btn-primary mt-2" type="submit">회원가입</button>
			    </form>
            </div>
            <!-- card -->
          </div>
        </div>
      </div>
    </div>
<!-- Footer -->
<%-- <%@ include file="../includes/footer.jsp" %> --%>

	<script>
	function check() {
		if(!document.user.userid.value){
			alert("비밀번호를 입력하세요.")
			return false;
		}else if(document.user.userpw.value !== document.user.userpwck.value){
			alert("비밀번호를 다시 입력하세요.")
			return false;
		}else if(!document.user.real_name.value){
			alert("이름을 입력하세요.")
			return false;
		}else if(!document.user.userphone.value){
			alert("번호를 입력하세요.")
			return false;
		}else if (!ischeckId){
			alert("아이디 중복확인을 하세요.")
			return false;
		}
	}
	var ischeckId = false;
	var expId = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		$('#userid').blur(function(){
			var id = $('#userid').val();

			$.ajax({
				url : '/member/idCheck?userid='+id,
				type : 'get',
				success : function (data){
					console.log(data);
					if (data == 1){
						$("#check").text("사용중인 아이디입니다.");
					}else if (data == 0){
						if (!expId.test(id)){
							$("#check").text("이메일 형식이 아닙니다.");
						}else {
							$("#check").text("사용가능한 아이디입니다.");
							ischeckId = true;
						}
					}
				}
				,error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}

			})
		});
	var autoHypenPhone = function(str){
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if( str.length < 4){
			return str;
		}else if(str.length < 7){
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		}else if(str.length < 11){
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		}else{
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}

		return str;
	}

	var phoneNum = document.getElementById('userphone');

	phoneNum.onkeyup = function(){
		this.value = autoHypenPhone( this.value ) ;
	}

	</script>