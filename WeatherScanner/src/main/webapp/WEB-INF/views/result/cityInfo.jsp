<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천도시정보</title>
<link href="../../resources/assets/css/bootstrap.min.css"
	rel="stylesheet">

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


</head>
<style>
.box-title {
	background-color: White;
	color: #6E6E6E; 
	border: 1px outset black;
	border-radius: 15px;
	margin-left: 0px;
	margin-right: 0px;
	padding-left: 10px;
	padding-right: 10px;
}

.box-body {
	background-color: #FBFBEF;
	border: 1px outset black;
	font-size: 20px;
	height: 700px;
	margin-left: 10px;
	padding-left: 10px;
	padding-right: 10px;
	margin-right: 10px;
	margin-left: 10px;
	height: 700px;
}
</style>

<body>
<c:if test="${empty trig }">
	 	<jsp:include page="../include/header.jsp"></jsp:include>
	 </c:if>
	 
	 <c:if test="${trig}">
	 	<jsp:include page="../include/header_ad.jsp"/>
	 </c:if>

	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1></h1>

			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<div class="box box-primary">

						<div class="box-header" align="center">
							<h3 class="box-title">TITLE : ${location.title}</h3>
						</div>
						<br><br>

						<div class="box-body with-border" align="left">
							${location.content}</div>
							
							<br>

						<div class="box-footer">
							<div class="writer_name" align="right">관리자 작성</div>
						</div>

	<br><br>
						<div class="box-footer">



						
							<div class="button-group">
								<button type="button" id="listBtn"
									class="btn btn-primary listBtn">
									<i class="fa fa-list"></i> 목록
								</button>
								
							</div>
							<br> <br> <br>






						</div>
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

<jsp:include page="../include/footer.jsp"/>
		<!-- Main Footer -->

	</div>
	<!-- ./wrapper -->


	<script type="text/javascript">
		$(document).ready(function() {

			const formObj = $("form[role='form']");

			$("#listBtn").on("click", function() {
				location.href="http://qwerasdf9.cafe24.com/reLoca/recity?month=${location.cityMonth}";
			});

			

		});
	</script>

</body>
</html>