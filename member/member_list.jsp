<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 리스트</h1>
	<c:forEach var="member" items="${list }">
		<hr/>
		아이디: ${member.id } <br/>
		이메일: ${member.email } <br/>
		가입일자: ${member.rdate } <br/>
		<hr/>
	</c:forEach>
	<a href="../">메인화면</a>
</body>
</html>