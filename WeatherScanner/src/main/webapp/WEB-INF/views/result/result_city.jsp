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


	<c:if test="${empty trig }">
	 	<jsp:include page="../include/header.jsp"></jsp:include>
	 </c:if>
	 
	 <c:if test="${trig}">
	 	<jsp:include page="../include/header_ad.jsp"/>
	 </c:if>


<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
</head>
<style>
@media (max-width:400px) {
	#Nocontent h4 h5 p {
		font-size: 18px;
	}
	#noLocation p {
		font-size: 18px;
	}
}

#Nocontent p {
	margin-left:350px;
	height: 50px;
	  width: 700px;
	font-size: 30px;
}

</style>
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<br>
				
				<div class="offset-md-1 col-md-11" id="Nocontent">
					<hr>
				<div id="noLocation">
				<c:if test="${empty locations }">
					<p><b>검색하신 ${month}월의 추천 여행지를 수정하고 있습니다.</b></p>
				</c:if>
				</div>
				</div>
				<c:if test="${not empty locations }">
				
					<b>${month }월의 추천 여행지</b>
			
				<c:forEach var="location" items="${locations }">
					
					<div class="offset-md-4 col-md-8">
					</div>
					
					<div class="offset-md-1 col-md-11">
					<br>
						<div class="row">
							<div class="col-md-2">
								<img alt="reLocation"
								src="${location.cityImg }"/>
							</div>
							<div class="col-md-10">
							<h4>도시이름: ${location.cityName }</h4> <br>
								<h5>${location.title}</h5><br>
								<p>
								${location.content }
								</p>
								<br>
								
								<!--  <a class="btn btn btn-info btn-small" href="<c:url value='../reLoca/content/${location.cityNo }'/>">자세한 정보</a>-->
							</div>
						</div>
						<hr>
					</div>
				</c:forEach>
				</c:if>

			</div>
		</div>
	</div>




</body>
</html>