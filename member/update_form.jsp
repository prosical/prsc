<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>${member.id } 회원정보 수정</h2>
	
	<form action="./update" method="post">
		<input type="hidden" name="id" value="${member.id }"/>
		비밀번호: <input type="password" name="pw" required/> <br/>
		이름: <input type="text" name="name" value="${member.name }" required/> <br/>
		이메일: <input type="text" name="email" value="${member.email }" required/> <br/>
		주소: <input type="text" name="address" value="${member.address }" required/> <br/><br/>
		<input type="submit" value="확인"/> &nbsp;
		<input type="reset" value="초기화"/>
	</form>

</body>
</html>