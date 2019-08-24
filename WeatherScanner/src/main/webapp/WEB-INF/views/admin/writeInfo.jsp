<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    
    
    <!-- Bootstrap -->
<link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap.js -->
<script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>




<jsp:include page="../include/header_ad.jsp"></jsp:include>


  </head>

<style>
.wrapper {
	padding-left: 10%;
	padding-right: 10%;
}

.navbar-brand {
	color: #00FFFF;
}

.navbar li a:hover {
	background-color: #555;
	color: #00BFFF;
}

.content-header {
	width: 200px;
	margin: 0 auto;
}

.button-group {
	float: left;
}

.box-footer {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: right;
	background-color: #fff;
}
</style>



<body class="hold-transition skin-blue sidebar-mini layout-boxed">

	
	<br>
	<div class="wrapper">


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<b style="font-size:30px;">추천 여행지 추가</b>

			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<form role="form" id="writeForm" method="post"
						action="<c:url value='/reLoca/insert' />">
						<div class="box box-primary">
							<div class="box-header with-border">
								
							</div>
							<div class="box-body">
								
								
								
								<div class="form-group">
									<label for="cityName">도시이름</label> <input class="form-control"
										id="cityName" name="cityName" placeholder="도시이름을 입력해주세요">
								</div>
								<div class="form-group">
									<label for="cityMonth">월</label> <input class="form-control"
										id="cityMonth" name="cityMonth" placeholder="1~12 중에 입력하세요">
								</div>
								<div class="form-group">
									<label for="title">제목</label> <input class="form-control"
										id="title" name="title" placeholder="제목을 입력해주세요">
								</div>
								
								<div id="summernote"></div>
								<textarea name="content" id="summernote" class="summernote" style="margin: 0px; width: 100%; height: 400px;"></textarea>
								
								<div>
								<label for="cityImg">이미지</label> <input class="form-control"
										id="cityImg" name="cityImg">
								</div>
								<br>

							</div>
							<div class="box-footer">

									<button type="submit" id="listBtn"
										class="btn btn-primary listBtn">
										<i class="fa fa-list"></i><a href="../reLoca/admincity">목록</a> 
									</button>



								<div class="button-group">
									<button type="reset" class="btn btn-warning">
										<i class="fa fa-reply"></i> 초기화
									</button>
									<button type="submit" class="btn btn-success">
										<i class="fa fa-save"></i> 입력
									</button>
								</div>



							</div>
						</div>
					</form>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


	</div>
	<!-- ./wrapper -->

<jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>