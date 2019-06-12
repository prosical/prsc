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

	<h2>상세보기</h2>
	
	<br/>
	<form action="." method="post">
	<table border="1">
		<tr>
			<td> 글번호 </td>
			<td>${board.boardnum }<input type="hidden" name="boardnum" value="${board.boardnum }"></td>
		</tr>
		<tr>
		<td> 제목 </td>
			<td><input type="text" name="title" value= "${board.title }"> </td>
			</tr>
		<tr>
			<td> 작성자</td>
			<td><input type="hidden" name="name" value="${board.name }">${board.name }</td>
		</tr>
		<tr>
			<td>게시일</td>
			<td>${board.bdate }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${board.hit }</td>
		</tr>
		<tr>
			<td> 본문 </td>
			<td> <textarea rows="10" cols="50" name="content">${board.content }</textarea></td>
		</tr>
		
	</table>
		<input type="submit" value="확인"> &nbsp;
		<input type="reset" value="초기화">
	</form>
	<a href="../list">목록으로</a> &nbsp; &nbsp; 
	<a href="../delete/${board.boardnum }">삭제하기</a>

</body>
</html>