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
	<table border="1">
		<tr>
			<td width="10%"> 글번호 </td>
			<td width="5%"> ${board.boardnum }</td>
			<td  width="10%">게시일</td>
			<td  width="30%"> ${board.bdate }</td>
		</tr>
		<tr>
			<td> 제목 </td>
			<td width="30%"> ${board.title } </td>
			<td> 작성자</td>
			<td> ${board.name }</td>
		</tr>
		<tr>
			
			<td width="10%">조회수</td>
			<td width="20%"> ${board.hit }</td>
		</tr>
		<tr>
			<td  width="10%"> 본문 </td>
			<td width="30%"> ${board.content }</td>
		</tr>
	
		
	</table>
	
	<a href="../list">목록으로</a> &nbsp; &nbsp; 
		<a href="../delete/${board.boardnum }">삭제하기</a>&nbsp; &nbsp; 
	<a href="../update/${board.boardnum }">수정하기</a>&nbsp; &nbsp; 

</body>
</html>