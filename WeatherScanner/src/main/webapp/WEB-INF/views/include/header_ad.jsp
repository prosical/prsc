<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="jquery-1.8.1.js"></script>



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

<style>
.dropdownBtn li a:hover {
	 background-color: #CED8F6;
}
</style>

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
     
    </ul>

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
            <a class="navbar-brand" href="/weather/">Weather<span>Scanner</span></a>

          </div>
          <!--/.navbar-header-->
          <!-- End Header Navigation -->

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
            <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
              <li class=" scroll active"><a href="/">home</a></li>
               <li class="scroll"><a href="<c:url value='../../member/adminMem'/>">회원관리</a></li>
               
              <li class="scroll"><a href="<c:url value='../../reLoca/admincity'/>" id="locationAd">추천 여행지 관리 </a>
                    
                
             
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

  </header>
  
 
  <!--welcome-hero end -->