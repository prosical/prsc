<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<!--  -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ReviewBoard</title>


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
#count-per-page input[type=button] {
	padding: 0 12px;
}
/* 사이드바 래퍼 스타일 */
.wrapper {
	padding-left: 100px;
	padding-right: 100px;
}

#page-content-wrapper {
	width: 70%;
	padding: 20px;
}

.pagination {
	list-sytle: none;
	display: inline-block;
	padding: 0;
	margin-top: 20px;
}

.pagination li {
	display: inline;
	text-align: center;
}

.pagination a {
	float: left;
	display: block;
	font-size: 14px;
	text-decoration: none;
	padding: 5px 12px;
	color: #96a0ad;
	line-height: 1.5;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 500%;
}

.pagination a.active, .pagination a:hover {
	cursor: pointer;
	color: #87CEFA;
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
.form-group{
form-align: center;
}
</style>
	
	 	<jsp:include page="../include/header.jsp"/>
	
	 
	 <!--<c:if test="${trig}">
	 	<jsp:include page="../include/header_ad.jsp"/>
	 </c:if>	-->

<body class="hold-transition skin-blue sidebar-mini layout-boxed">
	 

	<div class="wrapper">



		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Review</h1>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-header with-border">



						</div>
						<div class="box-body">
							<table class="table table-hover">
								<tbody>
									<tr>
										<th style="width: 30px">No</th>
										<th>제목</th>
										<th style="width: 100px">작성자</th>
										<th style="width: 200px">작성시간</th>
										<th style="width: 60px">조회</th>
										<th style="width: 50px"><img src="<c:url value='/assets/images/likeit.JPG' />" style="width: 30px"></th>
									</tr>

									<%-- 게시물이 들어갈 공간 --%>
									<c:if test="${articles.size() <= 0}">
										<tr>
											<td align="center" colspan="5"><strong>검색 결과가
													없습니다!</strong></td>
										</tr>
									</c:if>
									<c:if test="${articles.size() > 0}">
										<c:forEach var="article" items="${articles}">
											<tr>
												<td>${article.boardNo}</td>
												<td><a
													href="<c:url value='/board/content${pageCreator.makeSearchURI(pageCreator.criteria.page)}&boardNo=${article.boardNo}'/>">
														${article.title} [${article.replyCnt}]</a> <c:if
														test="${article.newMark}">
														<span class="label label-success">new</span>
													</c:if></td>
												<td>${article.memberId}</td>
												<td><fmt:formatDate value="${article.regDate}"
														pattern="yyyy-MM-dd a hh:mm" /></td>
												<td>${article.viewCnt}</td>
												<td></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>


						<div class="box-footer">
							<div class="text-center">
								<ul class="pagination">

									<c:if test="${pageCreator.prev}">
										<li><a
											href="<c:url value='/board/list${pageCreator.makeSearchURI(pageCreator.beginPage - 1)}' />">이전</a></li>
									</c:if>

									<c:forEach var="idx" begin="${pageCreator.beginPage}"
										end="${pageCreator.endPage}">
										<li
											<c:out value=
											"${pageCreator.criteria.page == idx ? 'class=active' : ''}"/>><a
											href="<c:url value='/board/list${pageCreator.makeSearchURI(idx)}'/>">${idx}</a></li>
									</c:forEach>

									<c:if test="${pageCreator.next}">
										<li><a
											href="<c:url value='/board/list${pageCreator.makeSearchURI(pageCreator.endPage + 1)}' />">다음</a></li>
									</c:if>

								</ul>
							</div>
						</div>


						<div class="box-footer">
							<div class="col-sm-2"></div>
							<form role="form" class="form-inline">
								<div class="form-group" align="center">
									<select id="condition" class="form-control" name="condition">
										<option value="title"
											<c:out value="${param.condition == 'title' ? 'selected' : ''}"/>>제목</option>
										<option value="content"
											<c:out value="${param.condition == 'content' ? 'selected' : ''}"/>>내용</option>
										<option value="nickname"
											<c:out value="${param.condition == 'nickname' ? 'selected' : ''}"/>>작성자</option>
										<option value="titleContent"
											<c:out value="${param.condition == 'titleContent' ? 'selected' : ''}"/>>제목+내용</option>
									</select>
								</div>
								<div class="form-group">
									<div class="input-group">
										<input type="text" class="form-control" name="keyword"
											id="keywordInput" value="${param.keyword}" placeholder="검색어">
										<span class="input-group-btn">
											<button type="button" class="btn btn-primary btn-flat"
												id="searchBtn">
												<i class="fa fa-search"></i> 검색
											</button>
										</span>
									</div>
								</div>
								<c:if test="${not empty member }">
									<div class="col-sm-4 float-right">
										<button type="button" class="btn btn-success btn-flat"
											id="writeBtn">
											<i class="fa fa-pencil"></i> 글쓰기
										</button>
									</div>
								</c:if>
									
							</form>
							
						</div>


					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


	</div>

<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript">
	const result = "${message}";
		
	if(result === "regSuccess") {
		alert("게시글 등록이 완료되었습니다.");
	} else if(result === "modSuccess") {
		alert("게시글 수정이 완료되었습니다.");
	} else if(result === "delSuccess") {
		alert("게시글 삭제가 완료되었습니다.");
	}
	
	//JQuery문의 시작
	$(document).ready(function() {
		
		//글쓰기 버튼 클릭 이벤트
		$("#writeBtn").on("click", function() {
			self.location = "/board/write";
		});
		
		//검색 버튼 클릭 이벤트
		$("#searchBtn").on("click", function() {
			self.location = "/board/list${pageCreator.makePageURI(1)}"
							+ "&condition=" + $("#condition").val()  
							+ "&keyword=" + $("#keywordInput").val();
			
		});
		
		//엔터키 입력 이벤트
		$("#keywordInput").keydown(function (key) {
			 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	$("#searchBtn").click();
	        }
	 
	    });

		
		//목록 개수 표현하기
		$("#count-per-page input[type=button]").on("click", function() {
						    	
			//console.log($(this).val());
			let count = $(this).val();
			self.location = "list?page=${pageCreator.criteria.page}&countPerPage=" + count; 
		});
		
		
	});
        
     
</script>







</body>

</html>








