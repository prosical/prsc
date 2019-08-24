<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LOGIN</title>

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




<body class="hold-transition login-page">
<jsp:include page="../include/header.jsp"/>

	<div class="login-box">
		<div class="login-logo">
			<a href="#"> <b>LOGIN</b>
			</a>
		</div>

		<div class="login-box-body" style="margin-left: 100px;">
			<p class="login-box-msg">로그인 페이지</p>

			<form action="#" method="post">
				<table
					style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 60%">
					<tr>
						<td style="text-align: left">
							<p>
								<strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
									id="idCheck"></span>
							</p>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="memberId" id="signInId"
							class="form-control tooltipstered" maxlength="14"
							required="required" aria-required="true"
							style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
							placeholder="최대 14자"></td>
					</tr>
					<tr>
						<td style="text-align: left">
							<p>
								<strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span
									id="pwCheck"></span>
							</p>
						</td>
					</tr>
					<tr>
						<td><input type="password" size="17" maxlength="20"
							id="signInPw" name="memberPw" class="form-control tooltipstered"
							maxlength="20" required="required" aria-required="true"
							style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
							placeholder="최소 8자"></td>
					</tr>
					<tr>
						<td class="col-xs-4"><label> <input type="checkbox"
								name="autoLogin" checked="checked"> 자동로그인
						</label></td>
					</tr>

					<tr>
						<td style="width: 100%; text-align: center; colspan: 2;"><input
							type="button" value="로그인" class="btn form-control tooltipstered"
							id="signIn-btn"
							style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
						</td>
					</tr>
					<tr>
						<td
							style="width: 100%; text-align: center; colspan: 2; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">

							<a class="btn form-control tooltipstered"
							href="<c:url value='/member/join'/>"
							style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">
								회원가입</a>
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
	
	$('#signInId').on('keyup', function() {
		if($("#signInId").val() == ""){
			$('#signInId').css("background-color", "pink");
			$('#idCheck').html('<b style="font-size:14px;color:red;">[아이디는 필수!]</b>');
			chk1 = false;
		}		
		
		//아이디 유효성검사
		else if(!getIdCheck.test($("#signInId").val())){
			$('#signInId').css("background-color", "pink");
			$('#idCheck').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자~]</b>');	  
			chk1 = false;
		} else {
			$('#signInId').css("background-color", "aqua");
			$('#idCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk1 = true;
		}
	});
	
	//패스워드 입력값 검증.
	$('#signInPw').on('keyup', function() {
		//비밀번호 공백 확인
		if($("#signInPw").val() === ""){
		    $('#signInPw').css("background-color", "pink");
			$('#pwCheck').html('<b style="font-size:14px;color:red;">[패스워드는 필수!]</b>');
			chk2 = false;
		}		         
		//비밀번호 유효성검사
		else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){
		    $('#signInPw').css("background-color", "pink");
			$('#pwCheck').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
			chk2 = false;
		} else {
			$('#signInPw').css("background-color", "aqua");
			$('#pwCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
			chk2 = true;
		}
		
	});
	
	
	//로그인 버튼 클릭 이벤트
	$('#signIn-btn').click(function() {
		if(chk1 && chk2) {
			//ajax통신으로 서버에서 값 받아오기
			const id = $('#signInId').val();
			const pw = $('#signInPw').val();
			const autoLogin = $("input[name=autoLogin]").is(":checked");
			
			console.log("id: " + id);
			console.log("pw: " + pw);
			console.log("autoLogin: " + autoLogin);
			
			const memberInfo = {
				memberId : id,
				memberPw : pw,
				autoLogin: autoLogin
			};
			
			$.ajax({
				type: "POST",
				url: "../member/loginCheck",
				headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
				data: JSON.stringify(memberInfo),
				dataType : "text",
				success: function(data) {
					console.log("result: " + data);	
					
					if(data === "idFail") {
						$('#signInId').css("background-color", "pink");
						$('#idCheck').html('<b style="font-size:14px;color:red;">[회원가입 먼저~~]</b>');
						$('#signInPw').val("");
						$('#signInId').focus();
						chk2 = false;
				    } else if(data === "pwFail") {
						$('#signInPw').css("background-color", "pink");
						$('#signInPw').val("");
						$('#signInPw').focus();
						$('#pwCheck').html('<b style="font-size:14px;color:red;">[비밀번호가 틀렸어요!]</b>');
						chk2 = false;
					} else if(data === "loginSuccess") {
						self.location="/";
					}
					
				}
			});
			
		} else {
			alert('입력정보를 다시 확인하세요.');
		}
	
	});
	
	
	
}); 
</script>

</body>
</html>
