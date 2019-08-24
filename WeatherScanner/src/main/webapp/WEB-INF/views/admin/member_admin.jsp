<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.table-bordered{
	color:#000000;
}
.table-bordered a{
	color:#00FFBF;
}
</style>

<c:if test="${empty trig }">
	 	<jsp:include page="../include/header.jsp"></jsp:include>
	 </c:if>
	 
	 <c:if test="${trig}">
	 	<jsp:include page="../include/header_ad.jsp"/>
	 </c:if>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				
				<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width: 200px">아이디</th>
								<th style="width: 250px">닉네임</th>
								<th style="width: 350px">이메일</th>
								<th style="width: 300px">가입일자</th>
								<th style="width: 200px">삭제</th>
							</tr>
						</thead>

						<!-- 반복문으로 회원 정렬 -->
						<c:forEach var="member" items="${members }">
							<tr class="member-list">
								<td class="id"><a href="<c:url value='../board/reviewAd/${member.memberId}'/>">${member.memberId}</a></td>
								<td>${member.nickname }</td>
								<td style="padding-right: 0px">${member.email }</td>
								<td>${member.regDate }</td>
								<td><button type="button" class="btn btn-danger deleteBtn"
										id="deleteBtn">삭제</button></td>
							</tr>

						</c:forEach>
					</table>
				</div>


			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$(".deleteBtn").on("click",function() {
			
			const memberIdObj=$(this).parent().parent().find('td.id');
			let memberId = memberIdObj.text();
			console.log(memberId);
			//console.log($('tr.member-list').find('td.id').text());
			
			$.ajax ({
				type : "delete",
				url : "../member/admindel?memberId="+memberId,
				headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
	            dataType: "text",
	            data: JSON.stringify({
	            	memberId:memberId
	            }),
	            success: function(result){
	            	if(result === "delSuccess") {
	            		alert("삭제가 완료되었습니다.");
	            		memberIdObj.val("");
	            		self.location="";
	            	}
	            }
			});
			
			
		});
	})
	</script>
</body>
</html>