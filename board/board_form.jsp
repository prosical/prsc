<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>게시물 작성</h2>
	
	<form action="write" method="post">
		작성자: ${name } (${id }) <br/><br/>
		<input type="hidden" value="${name}" name="name"/>
		제목: <input type="text" name="title" size="20" required/> <br/> <br/>
		내용: <textarea rows="10" cols="50" name="content"></textarea>
		 <br/>
		 <br/>
		 <input type="submit" value="확인"/> &nbsp; &nbsp;
		<input type="reset" value="초기화"/>
	</form>
	
</body>
</html>