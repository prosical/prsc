<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<!--
	Aerial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>

	<!-- ////////////////////////// 	custom 		//////////////////////////// -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	


	<style type="text/text/css">
	@@font-face {
		font-family: 'naBrush';
		src:url("NanumBrush.woff");
	}
	</style>



	<!-- //////////////////////////// 	custom 		//////////////////////////////////////// -->
	
	<title>Aerial by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript>
		<link rel="stylesheet" href="assets/css/noscript.css" />
	</noscript>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">


	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

  <!-- bootstrap.js -->
  <script src="js/bootstrap.min.js"></script>


</head>

<body class="is-preload">
	<div id="wrapper">
		<div id="bg"></div>
		<div id="overlay"></div>
		<div id="main">

			<!-- Header -->
			<header id="header">
				<div class="container">

				</div>
				<h1><p style="font-family:naBrush;">Weather Scanner</p></h1>
				<p>History Weather &nbsp;&bull;&nbsp; Currently Weather &nbsp;&bull;&nbsp; Future Weather</p>

<!---------------------------------------------->

<div class="welcome-hero-serch-box">

	<div class="welcome-hero-form" id="frm">
		<div class="single-welcome-hero-form">





			<div class="btn-group">
	      <button id="year-btn" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown"> year <span class="caret"></span>
		  </button>
	       <ul id="year-list" class="dropdown-menu" role="menu">
	        <li><a class="dropdown-item" href="#">2020</a></li>
	        <li><a class="dropdown-item" href="#">2019</a></li>
	        <li><a class="dropdown-item" href="#">2018</a></li>
	        </ul>
	    </div>


			<div class="btn-group">
	      <button id="month-btn" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown"> month <span class="caret"></span>
	      </button>
	      <ul id="month-list" class="dropdown-menu" role="menu">
	      
	      <c:forEach var="m" begin="1" end="12">
	        <li><a class="dropdown-item" href="#">${m }</a></li>
	      </c:forEach>
	      </ul>
	    </div>


			<div class="btn-group">
	      <button id="day-btn" multiple size=5 class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown"> day <span class="caret"></span>
	      </button>
	      <ul id="day-list" class="dropdown-menu" role="menu" >
	        <c:forEach var="d" begin="1" end="31">
	        <li><a class="dropdown-item" href="#">${d}</a></li>
	      </c:forEach> 
	      </ul>
	    </div>

			<div class="btn-group">
	      <button id="country-btn" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown"> country <span class="caret"></span>
	      </button>
	      <ul id="country-list" class="dropdown-menu" role="menu">
	        <li><a class="dropdown-item" href="#">미국</a></li>
	        <li><a class="dropdown-item" href="#">독일</a></li>
	        <li class="dropdown-divider"></li>
	        <li><a class="dropdown-item" href="#">다른 메뉴 </a></li>
	      </ul>
	    </div>



			<div class="city-group">
	      <button id="city-btn" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown"> city <span class="caret"></span>
	      </button>
	      <ul id="city-list" class="dropdown-menu" role="menu">

	        <li><a class="dropdown-item" href="#" value="뉴욕">뉴욕</a></li>
	        <li><a class="dropdown-item" href="#">괌</a></li>
	        <li><a class="dropdown-item" href="#">라이프치히</a></li>
					<li><a class="dropdown-item" href="#">뭰헨</a></li>
	        <li class="dropdown-divider"></li>
	        <li><a class="dropdown-item" href="#">다른 메뉴 </a></li>
	      </ul>
	    </div>
		
		</div>
	</div>
	
	
	

	<div class="welcome-hero-serch">
		<button id="search-btn" class="welcome-hero-btn" >
			 search  <i data-feather="search"></i>
		</button>
	</div>

</div>

<!--   ///////////////////	script	/////////////////////////	-->

<script>
$('#year-list li > a').on('click', function() {
	// 버튼에 선택된 항목 텍스트 넣기
	$('#year-btn').text($(this).text());
	// 선택된 항목 값(value) 얻기
	$(this).attr('value')
});
$('#month-list li > a').on('click', function() {
	// 버튼에 선택된 항목 텍스트 넣기
	$('#month-btn').text($(this).text());
	// 선택된 항목 값(value) 얻기
	// alert($(this).attr('value'));
});
$('#day-list li > a').on('click', function() {
	// 버튼에 선택된 항목 텍스트 넣기
	$('#day-btn').text($(this).text());
	// 선택된 항목 값(value) 얻기
	// alert($(this).attr('value'));
});
$('#country-list li > a').on('click', function() {
	// 버튼에 선택된 항목 텍스트 넣기
	$('#country-btn').text($(this).text());
	// 선택된 항목 값(value) 얻기
	// alert($(this).attr('value'));
});

$('#city-list li > a').on('click', function() {
	// 버튼에 선택된 항목 텍스트 넣기
	$('#city-btn').text($(this).text());
	// 선택된 항목 값(value) 얻기
	// alert($(this).attr('value'));
});

//선택한 데이터 넘기는 script
$("#search-btn").on("click", function() {
	const year = $("#year-btn").text();
	const month = $("#month-btn").text();
	var date = $("#day-btn").text();
	if(date < 10){
		date = "0"+date
	}
	const day = date;
	const country = $("#country-btn").text();
	const city = $("#city-btn").text();
	
	var d = new Date();
	const time = year+"-"+month+"-"+day+"T"+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
	console.log(time);
	
	window.location.href='http://localhost:8080/weather/api?city='+city+'&time='+time+'&month='+month;
});


//카카오 로그인
//<![CDATA[
  
  Kakao.init('b11cd7f5990b23fc3848a76e46d9bfd8');
  function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  };
//]]>

</script>
<!--   ///////////////////	script	/////////////////////////	-->







<!---------------------
<i class="fa fa-camera"></i> 
<span style="color:blue"><i class="fa fa-camera fa-5x"></i></span>
<i class="fa fa-camera fa-lg"></i> 
<i class="fa fa-camera fa-2x"></i> 
<i class="fa fa-camera fa-3x"></i>
<i class="fa fa-camera fa-4x"></i> 
<i class="fa fa-camera fa-5x"></i> 

<i class="fas fa-bolt fa-border" aria-hidden="true"></i>
<i class="fa fa-spinner fa-spin fa-fw"></i> 

<i class="fa fa-spinner fa-spin fa-fw"></i> 
<i class="fa fa-circle-o-notch fa-spin fa-fw"></i>
<i class="fa fa-refresh fa-spin fa-fw"></i>  
<i class="fa fa-cog fa-spin fa-fw"></i> 
<i class="fa fa-spinner fa-pulse fa-fw"></i> 

------------------------->
	<!--  <img src="<c:url value='/resources/2368144B56FFF8620A.png'/>" />-->
				<nav>
					<ul>
					<li><a  href="https://kauth.kakao.com/oauth/authorize?client_id=fd4f87b0a1c6e0be3ef4cd9b8a05b285&redirect_uri=http://localhost:8080/weather/kakaoLogin&response_type=code">
                        	<img src="<c:url value='/resources/2368144B56FFF8620A.png'/>" width="50" width="50"/></a>
                    </li>
					
					<li><i class="fas fa-bolt fa-5x"></i></li>
					<li><span style="color:gray"><i class="fas fa-cloud-showers-heavy"></i></span></li>
						<li><a  href="https://api.instagram.com/oauth/authorize/?client_id=4d2cc2ac80794b1184eaf27ff19d5330&redirect_uri=http://localhost:8080/weather/main&response_type=code"class="icon brands fa-instagram"><span class="label">Instargram</span></a></li>
						<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
					</ul>
				</nav>
			</header>
			
			
			
	

			
			
			<!-- Footer -->
			<footer id="footer">
				<span class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.</span>
			</footer>

		</div>
	</div>
	<script>
		window.onload = function() {
			document.body.classList.remove('is-preload');
		}
		window.ontouchmove = function() {
			return false;
		}
		window.onorientationchange = function() {
			document.body.scrollTop = 0;
		}
	</script>
</body>

</html>
