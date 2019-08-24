<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test="${empty login }">

	<a href="https://kauth.kakao.com/oauth/authorize?client_id=fd4f87b0a1c6e0be3ef4cd9b8a05b285&redirect_uri=http://localhost:8080/weather/kakaoLogin&response_type=code">
		<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg">
	</a>
		
</c:if>

<c:if test="${not empty login }">
	<h1>로그인성공입니다. </h1>
	<img src="${login.image}">
	<p>
	 	닉네임 : ${login.nickname} <br>
	 	이메일 : ${login.email}
	</p>
	<input type="button" value="로그아웃" onclick="location.href='/weather/logout'">
</c:if>
</body>
</html>