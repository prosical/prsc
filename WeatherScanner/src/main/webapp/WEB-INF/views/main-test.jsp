<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<!--
   Aerial by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>

<!-- //////////////////////////    custom       //////////////////////////// -->

<style type="text/text/css">
   @@font-face {
      font-family: 'naBrush';
      src:url("NanumBrush.woff");
   }
   </style>



<!-- ////////////////////////////    custom       //////////////////////////////////////// -->

<title>Aerial by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- bootstrap.js -->
<script src="js/bootstrap.min.js"></script>


</head>
<style>
@media (max-width:400px){
 select{
   float:left;
   width:100%;
   font-size: 18px;
}
}
@media (max-width:400px){
 input{
   float:left;
   width:100%;
   font-size: 18px;
   margin-right:0px;
}
}


  form{
margin: 0 auto;
}


  option {
   width:20%;
    color:#000000;
}
  optgroup {
    color:#0A0A2A;
}
  input {
    color:#0A0A2A;
}
  select {
margin-top: 5px;
}
.navbar-expand-md {
   width: 500px;
   background-color: #81F7D8;
   opacity: 0.9;
   
}


</style>
<body class="is-preload">
   <div id="wrapper">
      <div id="bg"></div>
      <div id="overlay"></div>
      <div id="main">

         <!-- Header -->
         <header id="header">
            <div class="container">


               <h1>
                  <p style="font-family: naBrush;" color="#f8f9fa">Weather
                     Scanner</p>
               </h1>
               <p>History Weather &nbsp;&bull;&nbsp; Currently Weather
                  &nbsp;&bull;&nbsp; Future Weather</p>

               <!---------------------------------------------->
               <nav class="navbar navbar-expand-md bg-light navbar-light" style="width: 100%;background: none;">
               
                  
                     <form action="http://qwerasdf9.cafe24.com/api" method="get" style="width:75%">
                  <input type="date" id="dateSelect" name="date" style="margin-right:5%;"/> 
                  <select name="city" style="margin-top:5px;" id="citySelect">
                  <option selected disabled hidden >나라&도시</option>
                     <optgroup label="아시아">
                        <option value="방콕">방콕</option>
                        <option value="싱가포르">싱가포르</option>
                     </optgroup>
                     
                  </select> <input id="searchBtn" type="submit" value="search"  style="margin-top:5px;
                  float:right;" />
                  
               </form>
                  

                  <!-- /.navbar-collapse -->
               </nav>

               <div class="welcome-hero-serch-box"></div>

            </div>
            <!--   ///////////////////   script   /////////////////////////   -->







            <script>
               //카카오 로그인
               //<![CDATA[

               Kakao.init('b11cd7f5990b23fc3848a76e46d9bfd8');
               function loginWithKakao() {
                  Kakao.Auth.login({
                     success : function(authObj) {
                        alert(JSON.stringify(authObj));
                     },
                     fail : function(err) {
                        alert(JSON.stringify(err));
                     }
                  });
               };
               //]]>
            </script>
            <!--   ///////////////////   script   /////////////////////////   -->

            <nav>
               <ul>
                  <li><a
                     href="https://kauth.kakao.com/oauth/authorize?client_id=fd4f87b0a1c6e0be3ef4cd9b8a05b285&redirect_uri=http://qwerasdf9.cafe24.com/kakaoLogin&response_type=code">
                        <img
                        src="<c:url value='resources/icon/sns/2368144B56FFF8620A.png'/>"
                         style="width:60%;"/>
                  </a></li>
                  <li><a
                     href="https://api.instagram.com/oauth/authorize/?client_id=4d2cc2ac80794b1184eaf27ff19d5330&redirect_uri=http://localhost:8080/weather/main&response_type=code"
                     class="icon brands fa-instagram"><span class="label">Instargram</span></a></li>
                  <li><a href="#" class="icon brands fa-github"><span
                        class="label">Github</span></a></li>
                  <li><a href="/member/login" class="icon solid fa-envelope"><span
                        class="label">Email</span></a></li>
               </ul>
            </nav>
         </header>

         <!-- Footer -->
         <footer id="footer">
            <span class="copyright">&copy; Untitled. Design: <a
               href="http://html5up.net">HTML5 UP</a>.
            </span>
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
        
	      $("#searchBtn").click(function(){
	    	  var target = document.getElementById("citySelect").value;
	    		if( target === "나라&도시" || $("#dateSelect").val() === "" ){
	    			alert("날짜와 도시를 선택하세요!");
	    			return false;
	    		}
	    		
	    	});
     
   </script>
</body>

</html>