<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ReviewBoard</title>

<!-- Bootstrap -->
<link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- bootstrap.js -->
<script src="../resources/assets/js/bootstrap.min.js"></script>

</head>

<style>
.wrapper {
	padding-left: 100px;
	padding-right: 100px;
}
.navbar-brand {
	color: #00FFFF;
}

.navbar li a:hover {
	background-color: #555;
	color: #00BFFF;
}

</style>


<body class="hold-transition register-page">
<jsp:include page="../include/header.jsp"/>

<div class="register-box">
    <div class="register-logo">
        <a href="#">
            <b>MEMBER</b>
        </a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">회원가입 페이지</p>

        <form action="<c:url value='/member'/>" method="post">
            <table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idChk"></span></p>
							</td>							
						</tr>
						<tr>
							<td><input type="text" name="memberId" id="member_id"
								class="form-control tooltipstered" maxlength="14"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="숫자와 영어로 4-14자">
								</td>
							
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="password"
								name="memberPw" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="영문과 특수문자를 포함한 최소 8자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="password_check"
								name="pw_check" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="비밀번호가 일치해야합니다."></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>닉네임을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="nickname" id="nickname"
								class="form-control tooltipstered" maxlength="6"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="한글로 최대 6자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="email" id="email"
								class="form-control tooltipstered" maxlength="20"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="email"></td>
						</tr>
						

						<tr>
							<td style="padding-top: 10px; text-align: center">
								<p><strong>회원가입하셔서 더 많은 서비스를 이용하세요!</strong></p>
							</td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="회원가입" 
								class="btn btn-primary form-control tooltipstered" id="signup-btn"
								style="background-color: orange; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
							</td>
						</tr>

					</table>
        </form>

        
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->
<script>
$(function() {
	
	const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false;
	
	//회원가입 검증~~
	//ID 입력값 검증.
	$('#member_id').on('keyup', function() {
		if($("#member_id").val() === ""){
			$('#member_id').css("background-color", "blue");
			$('#idChk').html('<b style="font-size:14px;color:red;">[아이디는 필수 정보에요!]</b>');
			chk1 = false;
		}
		
		//아이디 유효성검사
		else if(!getIdCheck.test($("#member_id").val())){
			$('#member_id').css("background-color", "pink");
			$('#idChk').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자]</b>');	  
			chk1 = false;
		} 
		//ID 중복확인 비동기 처리
		else {
			const memberId = $('#member_id').val();
			$.ajax({
				type: "POST",
				url: "/member/idCheck",
				headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
				data: memberId ,
				datatype: "json",
				success: function(data) {
					console.log(data);
					if(data.confirm === "OK") {
						$('#member_id').css("background-color", "aqua");
						$('#idChk').html('<b style="font-size:14px;color:green;">[ID 사용 가능!]</b>');
						chk1 = true;
					} else {
						$('#member_id').css("background-color", "pink");
						$('#idChk').html('<b style="font-size:14px;color:red;">[중복된 ID입니다!]</b>');
						chk1 = false;
					}
				},
				error : function(error) {
	                
	                console.log("error : " + error);
	            }
			});
		}
	});
	
	//패스워드 입력값 검증.
	$('#password').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#password").val() === ""){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보!]</b>');
			chk2 = false;
		}		         
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
		    $('#password').css("background-color", "pink");
			$('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk2 = false;
		} else {
			$('#password').css("background-color", "aqua");
			$('#pwChk').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk2 = true;
		}
		
	});
	
	//패스워드 확인란 입력값 검증.
	$('#password_check').on('keyup', function() {
		//비밀번호 확인란 공백 확인
		if($("#password_check").val() === ""){
		    $('#password_check').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[패스워드확인은 필수정보!]</b>');
			chk3 = false;
		}		         
		//비밀번호 확인란 유효성검사
		else if($("#password").val() != $("#password_check").val()){
		    $('#password_check').css("background-color", "pink");
			$('#pwChk2').html('<b style="font-size:14px;color:red;">[위에랑 똑같이!!]</b>');
			chk3 = false;
		} else {
			$('#password_check').css("background-color", "aqua");
			$('#pwChk2').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk3 = true;
		}
		
	});
	
	//이름 입력값 검증.
	$('#nickname').on('keyup', function() {
		//이름값 공백 확인
		if($("#nickname").val() === ""){
		    $('#nickname').css("background-color", "pink");
			$('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 필수정보!]</b>');
			chk4 = false;
		}		         
		//이름값 유효성검사
		else if(!getName.test($("#nickname").val())){
		    $('#nickname').css("background-color", "pink");
			$('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 한글로 ~]</b>');
			chk4 = false;
		} else {
			$('#nickname').css("background-color", "aqua");
			$('#nameChk').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk4 = true;
		}
		
	});
	
	
	
	$('#signup-btn').click(function(e) {
		if(chk1 && chk2 && chk3 && chk4) {
			const id = $("#member_id").val();
			const pw = $("#password").val();
			const name = $("#nickname").val();
			const email = $("#email").val();
			const member = {
				memberId: id,
	            memberPw: pw,
	            nickname: name,
	            email: email
			};
			console.log(member);
			
			$.ajax({
				type: "POST",
				url: "/member",
	            headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
	            dataType: "text",
	            data: JSON.stringify(member),
	            success: function(result) {
	            	console.log("result: " + result);
	            	if(result === "joinSuccess") {
	            		alert("회원가입 성공!");
	            		self.location = "/";
	            	}
	            }
			});
		} else {
			alert('입력정보를 다시 확인하세요.');			
		}
	});
	
});


</script>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>










