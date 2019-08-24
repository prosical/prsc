<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ReviewBoard</title>

<!-- Bootstrap -->
<link href="../../resources/assets/css/bootstrap.min.css" rel="stylesheet">

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
<script src="../../resources/assets/js/bootstrap.min.js"></script>


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
	margin-top: 10px;
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
					<form role="form" id="writeForm" method="post"
						action="<c:url value='/board/modify?boardNo=${article.boardNo }'/>" enctype="multipart/form-data">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">추천글 수정</h3>
							</div>
							<div class="box-body">
								<input type="hidden" name="boardNo" value="${article.boardNo}">
								<input type="hidden" name="page" value="${criteria.page}">
								<input type="hidden" name="countPerPage"
									value="${criteria.countPerPage}"> <input type="hidden"
									name="condition" value="${criteria.condition}"> <input
									type="hidden" name="keyword" value="${criteria.keyword}">

								<div class="form-group Motitle">
									<label for="title">제목</label> <input class="form-control"
										id="title" name="title" placeholder="제목을 입력해주세요"
										value="${article.title}">
								</div>
								<div class="form-group Mocontent">
									<label for="content">내용</label>
									<textarea class="form-control" id="content" name="content"
										rows="30" placeholder="내용을 입력해주세요" style="resize: none;">${article.content}</textarea>
								</div>
								
								<div class="form-group">
						
								<c:if test="${not empty file }">
									<img class="img-thumbnail img-fluid" src="<c:url value='/board/file/${article.boardNo }'/>" alt="" style="width:60px; height:60px;">
									<button type="button" id="imagedelBtn">이미지 삭제</button> <br>
								</c:if>
									<label># 이미지파일: </label> <input type="file" name="file">
								</div>
							</div>

							<div class="box-footer">

								<button type="submit" class="btn btn-success modBtn">
										<i class="fa fa-save"></i> 수정 저장
									</button>



								<div class="button-group">
									<button type="button" class="btn btn-warning cancelBtn">
										<i class="fa fa-trash"></i> 취소
									</button>
									
								</div>
								<br><br>



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


	<script>
    $(document).ready(function () {

        const formObj = $("form[role='form']");        

        $(".modBtn").on("click", function () {
            formObj.submit();
        });

        $(".cancelBtn").on("click", function () {
            history.back();
        });

        $(".listBtn").on("click", function () {
            self.location = "/reLoca/admincity?page=1&countPerPage=10&condition=&keyword=";
        });
        
        $("#imagedelBtn").on("click",function() {
        	
	        const imageNo = "${file.fileNo}";
	        console.log(imageNo);
	        
	        $.ajax({
	        	
	        	type:"delete",
	        	url:"/file/delete/${file.fileNo}",
	        	headers: {
	                "Content-Type": "application/json",
	                "X-HTTP-Method-Override": "POST"
	            },
	            dataType: "text",
	            data: JSON.stringify({
	                fileNo:imageNo
	            }),
	            success:function (result) {
	                console.log("result : " + result);
	                if (result === "delSuccess") {
	                    alert("첨부파일이 삭제되었습니다.");
	                }
	            }
	        	
	       });
        })

    });
</script>

</body>

</html>








