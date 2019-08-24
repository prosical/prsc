<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!--font-family-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<script src="<%=request.getContextPath()%>/resources/assets/js/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Bootstrap -->
<link href="../resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap.js -->
<script src="../resources/assets/js/bootstrap.min.js"></script>

<!-- title of site -->
<title>Directory Landing Page</title>

<!-- For favicon png -->
<link rel="shortcut icon" type="/image/icon"
	href="<%=request.getContextPath()%>/resources/assets/logo/favicon.png" />

<!--font-awesome.min.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/font-awesome.min.css">

<!--linear icon css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/linearicons.css">

<!--animate.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/animate.css">

<!--flaticon.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/flaticon.css">

<!--slick.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/slick.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/slick-theme.css">

<!--bootstrap.min.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css">

<!-- bootsnav -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/bootsnav.css">

<!--style.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">

<!--responsive.css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/responsive.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


<style>
.dropdown:hover>.dropdown-menu {
	display: block;
}

.hidden-xs {
	cursor: pointer;
	color: rgb(167, 176, 186);
	font-size: 12px;
	font-weight: 300;
	border-width: initial;
	border-style: none;
	border-color: initial;
	border-image: initial;
}
</style>
<header id="header-top" class="header-top">
	<ul>
		<li>
			<div class="header-top-left">
				<ul>
					<li class="select-opt"><select name="language" id="language">
							<option value="default">Home</option>
							<option value="Bangla">BN</option>
							<option value="Arabic">AB</option>
					</select></li>
					<li class="select-opt"><select name="currency" id="currency">
							<option value="usd">USD</option>
							<option value="euro">Euro</option>
							<option value="bdt">BDT</option>
					</select></li>
					<li class="select-opt"><a href="#"><span
							class="lnr lnr-magnifier"></span></a></li>
				</ul>
			</div>
		</li>
		<li class="head-responsive-right pull-right">




			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<c:if test="${not empty login}">
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <span
								class="hidden-xs">${login.nickname}</span>
						</a>
							<ul class="dropdown-menu">



								<li class="pull-left"><a href="#"
									class="btn btn-default btn-flat"><i
										class="fa fa-info-circle"></i><b>마이 페이지</b></a></li>


							</ul></li>
					</c:if>
					<c:if test="${empty login}">
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <span
								class="hidden-xs">회원가입 또는 로그인</span>
						</a>
							<ul class="dropdown-menu">
								<li class="user-header">
									<div class="pull-left">
										<a href="<c:url value='/member/join'/>"
											class="btn btn-default btn-flat"><i
											class="fa fa-user-plus"></i><b> 회원가입</b></a>
									</div>

								</li>
								<li class="user-footer">
									<div class="pull-left">
										<a href="<c:url value='/member/login'/>"
											class="btn btn-default btn-flat"><i
											class="glyphicon glyphicon-log-in"></i><b> 로그인</b></a>
									</div>
								</li>
							</ul></li>
					</c:if>
				</ul>
			</div>




		</li>
	</ul>

	<!--/.header-top-->
	<!--header-top end -->

	<!-- top-area Start -->
	<section class="top-area">
		<div class="header-area">
			<!-- Start Navigation -->
			<nav
				class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"
				data-minus-value-desktop="70" data-minus-value-mobile="55"
				data-speed="1000">

				<div class="container">

					<!-- Start Header Navigation -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navbar-menu">
							<i class="fa fa-bars"></i>
						</button>
						<a class="navbar-brand" href="/">Weather<span>Scanner</span></a>

					</div>
					<!--/.navbar-header-->
					<!-- End Header Navigation -->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li class=" scroll active"><a href="/">home</a></li>

							<li class="nav-item dropdownBtn"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown">추천
									여행지 <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=1'/>">1월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=2'/>">2월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=3'/>">3월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=4'/>">4월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=5'/>">5월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=6'/>">6월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=7'/>">7월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=8'/>">8월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=9'/>">9월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=10'/>">10월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=11'/>">11월</a></li>
									<li><a class="dropdown-item"
										href="<c:url value='/reLoca/recity?month=12'/>">12월</a></li>
								</ul></li>

							<li class="scroll"><a href="<c:url value='/board/list'/>">리뷰게시판</a></li>
							
							
							<c:if test="${!empty login}">
								<li class="nav-item dropdownBtn">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">마이페이지<b class="caret"></b></a>
								<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="<c:url value='../mypage/myModify?id=${login.memberId}'/>">회원정보 수정</a></li>
										<li><a class="dropdown-item" href="<c:url value='../mypage/myLike?id=${login.memberId}'/>">내가 찜한 게시물</a></li>
										<li><a class="dropdown-item" href="<c:url value='../mypage/myWrite?id=${login.memberId}'/>">내가 쓴 게시물</a></li>
										<li><a class="dropdown-item" href="<c:url value='../member/logout'/>">로그아웃 </a></li>
								</ul></li>
							</c:if>


						</ul>
						<!--/.nav -->
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!--/.container-->
			</nav>
			<!--/nav-->
			<!-- End Navigation -->
		</div>
		<!--/.header-area-->
		<div class="clearfix"></div>

	</section>
	<!-- /.top-area-->
	<!-- top-area End -->

</header>

<!--welcome-hero end -->