<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <!--font-family-->
  <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- title of site -->
  <title>Directory Landing Page</title>

  <!-- For favicon png -->
  <link rel="shortcut icon" type="/image/icon" href="<%=request.getContextPath()%>/resources/assets/logo/favicon.png" />

  <!--font-awesome.min.css-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/font-awesome.min.css">

  <!--linear icon css-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/linearicons.css">

  <!--animate.css-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/animate.css">

  <!--flaticon.css-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/flaticon.css">

  <!--slick.css-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/slick.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/slick-theme.css">

  <!--bootstrap.min.css-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css">

  <!-- bootsnav -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/bootsnav.css">

  <!--style.css-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/style.css">

  <!--responsive.css-->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/responsive.css">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

  <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>

<body>
  <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

  <!--header-top start -->
  <header id="header-top" class="header-top">
    <ul>
      <li>
        <div class="header-top-left">
          <ul>
            <li class="select-opt">
              <select name="language" id="language">
                <option value="default">Home</option>
                <option value="Bangla">BN</option>
                <option value="Arabic">AB</option>
              </select>
            </li>
            <li class="select-opt">
              <select name="currency" id="currency">
                <option value="usd">USD</option>
                <option value="euro">Euro</option>
                <option value="bdt">BDT</option>
              </select>
            </li>
            <li class="select-opt">
              <a href="#"><span class="lnr lnr-magnifier"></span></a>
            </li>
          </ul>
        </div>
      </li>
      <li class="head-responsive-right pull-right">
        <div class="header-top-right">
          <ul>
            <li class="header-top-contact">
              +1 222 777 6565
            </li>
            <li class="header-top-contact">
              <a href="./member/login">sign in</a>
            </li>
            <li class="header-top-contact">
              <a href="#">register</a>
            </li>
          </ul>
        </div>
      </li>
    </ul>

  </header>
  <!--/.header-top-->
  <!--header-top end -->

  <!-- top-area Start -->
  <section class="top-area">
    <div class="header-area">
      <!-- Start Navigation -->
      <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy" data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

        <div class="container">

          <!-- Start Header Navigation -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
              <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="index.html">list<span>race</span></a>

          </div>
          <!--/.navbar-header-->
          <!-- End Header Navigation -->

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
            <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
              <li class=" scroll active"><a href="#home">home</a></li>
              <li class="scroll"><a href="#works">정보수정</a></li>
              <li class="scroll"><a href="#explore">내가 쓴 게시글</a></li>
              <li class="scroll"><a href="#reviews">내가 찜한 게시글</a></li>
              <li class="scroll"><a href="">회원탈퇴</a></li>
            </ul>
            <!--/.nav -->
          </div><!-- /.navbar-collapse -->
        </div>
        <!--/.container-->
      </nav>
      <!--/nav-->
      <!-- End Navigation -->
    </div>
    <!--/.header-area-->
    <div class="clearfix"></div>

  </section><!-- /.top-area-->
  <!-- top-area End -->

 
  <!--welcome-hero end -->


  <!--subscription strat -->
  <section id="works" class="works">
    <div class="container">
      <div class="section-header">
        <h2>MyPage</h2>
        <p></p>
      </div>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text">아이디</span>
          </div>
          <input type="text" class="form-control" placeholder="아이디">
        </div>
        <br>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text">닉네임</span>
          </div>
          <input type="text" class="form-control" placeholder="닉네임" value="${member.nickname}">
        </div>
        <br>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text">Email</span>
          </div>
          <input type="text" class="form-control" placeholder="Email" value="${member.email}">
        </div>
        <br>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text">현재 비밀번호</span>
          </div>
          <input type="text" class="form-control" placeholder="현재 비밀번호">
        </div>
        <br>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text">변경 비밀번호</span>
          </div>
          <input type="text" class="form-control" placeholder="변경 비밀번호">
        </div>
        <br>
        <div class="input-group">
          <div class="input-group-prepend">
            <span class="input-group-text">비밀번호 확인</span>
          </div>
          <input type="text" class="form-control" placeholder="비밀번호 확인">
        </div>
      </div>

      <div class="row">
        <div class="col-sm-12">
          <div class="subscription-input-group">
            <form action="#">

              <button class="appsLand-btn subscribe-btn" onclick="window.location.href='#'">
                완료
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>

  </section>
  <!--/subscription-->
  <!--subscription end -->
  <!--explore start -->
  <section id="explore" class="explore">
    <div class="container">
      <div class="wrapper">

		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content container-fluid">
			<div class="section-header">
        	<h2>내가 쓴 게시글</h2>
      		 	 <p></p>
     	 </div>
				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-body">
							<table class="table table-hover">
								<tbody>
									<tr>
										<th style="width: 30px">#</th>
										<th>제목</th>
										<th style="width: 100px">작성자</th>
										<th style="width: 200px">작성시간</th>
										<th style="width: 60px">조회</th>
										<th style="width: 50px"><img src="<c:url value='/assets/image/likeit.jpg' />" style="width: 30px"></th>
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
												<td>${article.nickname}</td>
												<td><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd a hh:mm" /></td>
												<td>${article.viewCnt}</td>
												<td>#</td>
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
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

    </div>
    <!--/.container-->

  </section>
  <!--/.explore-->
  <!--explore end -->



  <!--blog start -->
  <section id="reviews" class="reviews">
    <div class="container">
<div class="wrapper">

		<div class="content-wrapper">
			<!-- Main content -->
			<section class="content container-fluid">
			<div class="section-header">
        <h2>내가 찜한 게시글</h2>
        <p></p>
      </div>
				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-body">
							<table class="table table-hover">
								<tbody>
									<tr>
										<th style="width: 30px">#</th>
										<th>제목</th>
										<th style="width: 100px">작성자</th>
										<th style="width: 200px">작성시간</th>
										<th style="width: 60px">조회</th>
										<th style="width: 50px"><img src="<c:url value='/assets/image/likeit.jpg' />" style="width: 30px"></th>
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
												<td>${article.nickname}</td>
												<td><fmt:formatDate value="${article.regDate}"
														pattern="yyyy-MM-dd a hh:mm" /></td>
												<td>${article.viewCnt}</td>
												<td>#</td>
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




					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->




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
							+ "&condition=" + $("select option:selected").val()  
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
    </div>
    <!--/.container-->

  </section>
  <!--/.blog-->
  <!--blog end -->


  <!--footer start-->
  <footer id="footer" class="footer">
    <div class="container">
      <div class="footer-menu">
        <div class="row">
          <div class="col-sm-3">
            <div class="navbar-header">
              <a class="navbar-brand" href="index.html">list<span>race</span></a>
            </div>
            <!--/.navbar-header-->
          </div>
          <div class="col-sm-9">
            <ul class="footer-menu-item">
              <li class=" scroll active"><a href="#home">home</a></li>
              <li class="scroll"><a href="#works">정보수정</a></li>
              <li class="scroll"><a href="#explore">내가 쓴 게시글</a></li>
              <li class="scroll"><a href="#reviews">내가 찜한 게시글</a></li>
              <li class="scroll"><a href="#blog">회원탈퇴</a></li>
            </ul>
            <!--/.nav -->
          </div>
        </div>
      </div>
      <div class="hm-footer-copyright">
        <div class="row">
          <div class="col-sm-5">
            <p>
              &copy;copyright. designed and developed by <a href="https://www.themesine.com/">themesine</a>
            </p>
            <!--/p-->
          </div>
          <div class="col-sm-7">
            <div class="footer-social">
              <span><i class="fa fa-phone"> +1 (222) 777 8888</i></span>
              <a href="#"><i class="fa fa-facebook"></i></a>
              <a href="#"><i class="fa fa-twitter"></i></a>
              <a href="#"><i class="fa fa-linkedin"></i></a>
              <a href="#"><i class="fa fa-google-plus"></i></a>
            </div>
          </div>
        </div>

      </div>
      <!--/.hm-footer-copyright-->
    </div>
    <!--/.container-->

    <div id="scroll-Top">
      <div class="return-to-top">
        <i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
      </div>

    </div>
    <!--/.scroll-Top-->

  </footer>
  <!--/.footer-->
  <!--footer end-->

  <!-- Include all js compiled plugins (below), or include individual files as needed -->

  <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.js"></script>

  <!--modernizr.min.js-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

  <!--bootstrap.min.js-->
  <script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>

  <!-- bootsnav js -->
  <script src="<%=request.getContextPath()%>/resources/assets/js/bootsnav.js"></script>

  <!--feather.min.js-->
  <script src="<%=request.getContextPath()%>/resources/assets/js/feather.min.js"></script>

  <!-- counter js -->
  <script src="<%=request.getContextPath()%>/resources/assets/js/jquery.counterup.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets/js/waypoints.min.js"></script>

  <!--slick.min.js-->
  <script src="<%=request.getContextPath()%>/resources/assets/js/slick.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

  <!--Custom JS-->
  <script src="<%=request.getContextPath()%>/resources/assets/js/custom.js"></script>

</body>

</html>
