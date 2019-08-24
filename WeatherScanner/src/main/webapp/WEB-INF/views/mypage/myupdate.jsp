<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />

<!--/.header-top-->
<!--header-top end -->
<body>

	<!--subscription strat -->
	<section id="works" class="works">
		

			<div class="container" >
				<div class="section-header">
					<h2>MyPage</h2>
					<p></p>
				</div>
			<center><div>
				<div class="input-group"style="width: 50%;">
					<div class="input-group-prepend" style="text-align:left;">
						<span class="input-group-text">아이디</span><span id="idChk"></span>
					</div>
					<input type="text" name="memberId" id="member_id" class="form-control" placeholder="아이디"
						value="${member.memberId }" readonly="readonly">
				</div>
				<br>
				<br>
				<div class="input-group"style="width: 50%;">
					<div class="input-group-prepend" style="text-align:left;">
						<span class="input-group-text">Email</span>
					</div>
					<input type="text" class="form-control" placeholder="Email"
						name="email" id="email" value="${member.email}">
				</div>
				<br>
				<div class="input-group"style="width: 50%;">
					<div class="input-group-prepend" style="text-align:left;">
						<span class="input-group-text">비밀번호 변경</span><span id="pwChk"></span>
					</div>
					<input type="password" class="form-control"
						placeholder="영문과 특수문자를 포함한 최소 8자" id="password" name="memberPw">
				</div>
				<br>
				<div class="input-group"style="width: 50%;">
					<div class="input-group-prepend" style="text-align:left;">
						<span class="input-group-text">비밀번호 확인</span><span id="pwChk2"></span>
					</div>
					<input type="password" class="form-control"
						placeholder="비밀번호가 일치해야합니다." id="password_check" name="pw_check">
				</div>
			</div>
		</div></center>
		
			<div class="row">
				<div class="col-sm-12">
					<div class="subscription-input-group">
<!--					<button type="submit" class="btn btn-success myBtn">
							<i class="fa fa-save">
-->
						<input type="button" value="회원정보 수정"
							class="btn btn-primary form-control tooltipstered"
							id="subscribe-btn" style="width:50%;">
						<div>${message}</div>

					</div>
				</div>

			</div>
		

	</section>

	<jsp:include page="../include/footer.jsp" />
<script>
$(function() {
	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getName= RegExp(/^[가-힣]+$/);
	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	let chk2 = false, chk3 = false, chk4 = false;
	
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
	
	
	$('#subscribe-btn').click(function(e) {
		console.log("수정버튼 클릭!");
		if(chk2 && chk3) {
			const id = $("#member_id").val();
			const pw = $("#password").val();
			const email = $("#email").val();
			const member = {
				memberId: id,
	            memberPw: pw,
	            email: email
			};
			console.log(member);
			
			$.ajax({
				type: "POST",
				url: "/mypage/myModify",
	            headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
	            dataType: "text",
	            data: JSON.stringify({
	            		memberId: id,
	    	            memberPw: pw,
	    	            email: email}),
	            success: function(result) {
	            	console.log("result: " + result);
	            	if(result === "upSuccess") {
	            		alert("회원정보 수정 성공!");
	            		self.location = "/mypage/myModify?id="+id;
	            	}
	            },
	            error:function(request,status,error){
	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            }
			});
		} else {
			alert('입력정보를 다시 확인하세요.');			
		}
	});
	
});

	</script>

	<!--/.container-->

	<!--/.blog-->
	<!--blog end -->