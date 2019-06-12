<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>게시물 목록 확인</h2>
	<table border="1">
		<tr>
			<th>게시물 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>게시일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr>
				<th>${list.boardnum }</th>
				<th><a href="detail/${list.boardnum }">${list.title }</a></th>
				<th>${list.name }</th>
				<th>${list.bdate }</th>
				<th>${list.hit }</th>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="write">글쓰기</a>
	<a href="../">메인화면으로</a>
</body>
</html>