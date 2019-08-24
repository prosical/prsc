<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>bootstrap4</title>

<jsp:include page="../include/header.jsp"/>
	
	 
	 <!--<c:if test="${trig}">
	 	<jsp:include page="../include/header_ad.jsp"/>
	 </c:if>	-->
</head>

<style>
.wrapper {
	padding-left: 100px;
	padding-right: 100px;
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

	<div class="wrapper">


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>ReviewWrite</h1>

			</section>

			<!-- Main content -->
			<section class="content container-fluid" style="width: 70%">

				<div class="col-lg-12">
					<form role="form" id="writeForm" method="post"
						action="<c:url value='/board/write' />" enctype="multipart/form-data">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">게시글 작성</h3>
							</div>
							<div class="box-body">
								<div class="form-group">
									<label for="memberId">작성자</label> <input class="form-control"
										id="memberId" name="memberId" value="${ID }" readonly>
								</div>
								<div class="form-group">
									<label for="title">제목</label> <input class="form-control"
										id="title" name="title" placeholder="제목을 입력해주세요">
								</div>
								<div id="summernote"></div>
								<textarea name="content" id="summernote" class="summernote" style="margin: 0px;"></textarea>

								<div class="form-group">
									<label># 이미지파일: </label> 
									
									<input type="file" name="file">
									
								</div>

							</div>
							<div class="box-footer">

								<button type="button" id="listBtn"
									class="btn btn-primary listBtn">
									<a href="<c:url value='/board/list'/>"> <i
										class="fa fa-list"></i> 목록
									</a>
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

	<jsp:include page="../include/footer.jsp" />
</body>

</html>
