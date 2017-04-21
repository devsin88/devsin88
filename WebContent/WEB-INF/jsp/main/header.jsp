<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header-container start -->
<div class="header-container">
	
	<!-- header-top start -->
	<!-- classes:  -->
	<!-- "dark": dark version of header top e.g. class="header-top dark" -->
	<!-- "colored": colored version of header top e.g. class="header-top colored" -->
	<!-- ================ -->
	<div class="header-top  colored">
		<div class="container">
			<div class="row">
				<div class="col-xs-2 col-sm-5">
					<!-- header-top-first start -->
					<!-- ================ -->
					<!--
					<div class="header-top-first clearfix">
						<ul class="social-links circle small clearfix hidden-xs">
							<li class="twitter"><a target="_blank" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
							<li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
							<li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
							<li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
							<li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube-play"></i></a></li>
							<li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
							<li class="facebook"><a target="_blank" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
							<li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
						</ul>
						<div class="social-links hidden-lg hidden-md hidden-sm circle small">
							<div class="btn-group dropdown">
								<button type="button" class="btn dropdown-toggle" data-toggle="dropdown"><i class="fa fa-share-alt"></i></button>
								<ul class="dropdown-menu dropdown-animation">
									<li class="twitter"><a target="_blank" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
									<li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
									<li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
									<li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
									<li class="youtube"><a target="_blank" href="http://www.youtube.com"><i class="fa fa-youtube-play"></i></a></li>
									<li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
									<li class="facebook"><a target="_blank" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
									<li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					-->
					<!-- header-top-first end -->
				</div>
				<div class="col-xs-10 col-sm-7">

					<!-- header top dropdowns start -->
					<!-- ================ -->
					<div class="header-top-dropdown text-right">
					
						<c:if test="${login == null }">
							<div class="btn-group">
								<a href="signup.sin" class="btn btn-default btn-sm"><i class="fa fa-user pr-10"></i> Sign Up</a>
							</div>
							<div class="btn-group">
								<a href="login.sin" class="btn btn-default btn-sm"><i class="fa fa-lock pr-10"></i> Login</a>
							</div>
						</c:if>
						<c:if test="${login != null }">
							<div class="btn-group">
								<a href="mypage.sin" class="btn btn-default btn-sm"><i class="fa fa-user pr-10"></i> MyPage</a>
							</div>
							<div class="btn-group">
								<a href="logout.sin" class="btn btn-default btn-sm"><i class="fa fa-unlock pr-10"></i> LogOut</a>
							</div>
						</c:if>
					</div>
					<!--  header top dropdowns end -->
				</div>
			</div>
		</div>
	</div>
	<!-- header-top end -->
	
	<!-- header start -->
	<!-- classes:  -->
	<!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
	<!-- "dark": dark version of header e.g. class="header dark clearfix" -->
	<!-- "full-width": mandatory class for the full-width menu layout -->
	<!-- "centered": mandatory class for the centered logo layout -->
	<!-- ================ --> 
	<header class="header centered fixed    clearfix">
		
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- header-first start -->
					<!-- ================ -->
					<div class="header-first clearfix">

						<!-- logo -->
						<div id="logo" class="logo">
							<a href="index.sin"><img id="logo_img" src="assets/images/logo_cool_green.png" alt="The Project"></a>
						</div>
						
					</div>
					<!-- header-first end -->

				</div>
				<div class="col-md-12">
		
					<!-- header-second start -->
					<!-- ================ -->
					<div class="header-second clearfix">
						
					<!-- main-navigation start -->
					<!-- classes: -->
					<!-- "onclick": Makes the dropdowns open on click, this the default bootstrap behavior e.g. class="main-navigation onclick" -->
					<!-- "animated": Enables animations on dropdowns opening e.g. class="main-navigation animated" -->
					<!-- "with-dropdown-buttons": Mandatory class that adds extra space, to the main navigation, for the search and cart dropdowns -->
					<!-- ================ -->
					<div class="main-navigation  animated with-dropdown-buttons">

						<!-- navbar start -->
						<!-- ================ -->
						<nav class="navbar navbar-default" role="navigation">
							<div class="container-fluid">

								<!-- Toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
										<span class="sr-only">Toggle navigation</span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
									
								</div>

								<!-- Collect the nav links, forms, and other content for toggling -->
								<div class="collapse navbar-collapse" id="navbar-collapse-1">
									<!-- main-menu -->
									<ul class="nav navbar-nav ">

										<!-- mega-menu start -->
										<c:if test="${menu_no==null}">
										<li class="active">
										</c:if>
										<c:if test="${menu_no!=null}">
										<li>
										</c:if>
											<a href="index.sin">home</a>
										</li>
										<!-- mega-menu end -->
										
										<c:forEach var="mvo" items="${menu }" varStatus="status">
											<!-- mega-menu start -->
											<c:if test="${menu_no != mvo.menu_no }">
											<li class="dropdown">
											</c:if>
											<c:if test="${menu_no == mvo.menu_no }">
											<li class="dropdown active">
											</c:if>
												<a href="title.sin?menu_no=${mvo.menu_no }" class="dropdown-toggle" data-toggle="dropdown">${mvo.menu_title }</a>
												<ul class="dropdown-menu">
													
													<c:forEach var="svo" items="${mvo.sm_list }">
														<li>
															<c:if test="${mvo.menu_title != 'portfolio' }">
																<a href="subtitle.sin?menu_no=${mvo.menu_no }&sub_no=${svo.sub_no }">${svo.sub_title } </a>
															</c:if>
															<c:if test="${mvo.menu_title == 'portfolio' }">
																<a href="portfolio.sin?sub_no=${svo.sub_no }">${svo.sub_title } </a>
															</c:if>
															<!-- 
															<ul class="dropdown-menu">
																<li ><a href="features-headers-default.html">Default/Semi-Transparent</a></li>
															</ul>
															 -->
														</li>
													</c:forEach>
													
												</ul>
											</li>
											<!-- mega-menu end -->
										</c:forEach>
										
									</ul>	
									<!-- main-menu end -->
									
								</div>

							</div>
						</nav>
						<!-- navbar end -->

					</div>
					<!-- main-navigation end -->
					</div>
					<!-- header-second end -->
		
				</div>
			</div>
		</div>
		
	</header>
	<!-- header end -->
</div>
<!-- header-container end -->

<c:forEach var="mvo" items="${menu }" varStatus="status">
	<c:if test="${mvo.menu_no == requestScope.menu_no }">
		<!-- breadcrumb start -->
		<!-- ================ -->
		<div class="breadcrumb-container">
			<div class="container">
				<ol class="breadcrumb">
					<li><i class="fa fa-home pr-10"></i><a href="title.sin?menu_no=${mvo.menu_no }">${mvo.menu_title }</a></li>
					<c:forEach var="svo" items="${mvo.sm_list }">
						<c:if test="${svo.sub_no == requestScope.sub_no }">
							<li class="active">${svo.sub_title }</li>
						</c:if>
					</c:forEach>
				</ol>
			</div>
		</div>
		<!-- breadcrumb end -->
	</c:if>
</c:forEach>
