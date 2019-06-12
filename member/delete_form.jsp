<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 탈퇴 페이지입니다. 본인확인을 위해서 비밀번호를 입력해주세요.</h2>
	
	<form action="./delete" method="post">
		<input type="hidden" name="id" value="${id }"/>
		비밀번호: <input type="password" name="pw"/><br/><br/>
		<input type="submit" value="확인"/>
		<input type="reset" value="초기화"/>
	</form>

</body>
</html>