<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if gt IE 9]> <html lang="en" class="ie"> <![endif]-->
<!--[if !IE]><!-->
<html dir="ltr" lang="en">
	<!--<![endif]-->

	<head>
		<meta charset="utf-8">
		<title>The Project | Page 404</title>
		
		<!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">

		<!-- Web Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=PT+Serif' rel='stylesheet' type='text/css'>

		<!-- Bootstrap core CSS -->
		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">

		<!-- Font Awesome CSS -->
		<link href="assets/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

		<!-- Fontello CSS -->
		<link href="assets/fonts/fontello/css/fontello.css" rel="stylesheet">

		<!-- Plugins -->
		<link href="assets/plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
		<link href="assets/plugins/rs-plugin-5/css/settings.css" rel="stylesheet">
		<link href="assets/plugins/rs-plugin-5/css/layers.css" rel="stylesheet">
		<link href="assets/plugins/rs-plugin-5/css/navigation.css" rel="stylesheet">
		<link href="assets/css/animations.css" rel="stylesheet">
		<link href="assets/plugins/owlcarousel2/assets/owl.carousel.min.css" rel="stylesheet">
		<link href="assets/plugins/owlcarousel2/assets/owl.theme.default.min.css" rel="stylesheet">
		<link href="assets/plugins/hover/hover-min.css" rel="stylesheet">		
		
		<!-- The Project's core CSS file -->
		<!-- Use css/rtl_style.css for RTL version -->
		<link href="assets/css/style.css" rel="stylesheet" >
		<!-- The Project's Typography CSS file, includes used fonts -->
		<!-- Used font for body: Roboto -->
		<!-- Used font for headings: Raleway -->
		<!-- Use css/rtl_typography-default.css for RTL version -->
		<link href="assets/css/typography-default.css" rel="stylesheet" >
		<!-- Color Scheme (In order to change the color scheme, replace the blue.css with the color scheme that you prefer)-->
		<link href="assets/css/skins/cool_green.css" rel="stylesheet">
		

		<!-- Custom css --> 
		<link href="assets/css/custom.css" rel="stylesheet">
	</head>

	<!-- body classes:  -->
	<!-- "boxed": boxed layout mode e.g. <body class="boxed"> -->
	<!-- "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> -->
	<!-- "transparent-header": makes the header transparent and pulls the banner to top -->
	<!-- "gradient-background-header": applies gradient background to header -->
	<!-- "page-loader-1 ... page-loader-6": add a page loader to the page (more info @components-page-loaders.html) -->
	<body class="no-trans    ">

		<!-- scrollToTop -->
		<!-- ================ -->
		<div class="scrollToTop circle"><i class="icon-up-open-big"></i></div>
		
		<!-- page wrapper start -->
		<!-- ================ -->
		<div class="page-wrapper">
		
			<%-- Header --%>
			<%@include file="../main/header.jsp" %>
			<%-- /Header --%>
		
			<!-- breadcrumb start -->
			<!-- ================ -->
			<div class="breadcrumb-container">
				<div class="container">
					<ol class="breadcrumb">
						<li><i class="fa fa-home pr-10"></i><a href="index.sin">Home</a></li>
						<li class="active">Page 404</li>
					</ol>
				</div>
			</div>
			<!-- breadcrumb end -->

			<!-- main-container start -->
			<!-- ================ -->
			<section class="main-container jumbotron light-gray-bg text-center margin-clear">

				<div class="container">
					<div class="row">

						<!-- main start -->
						<!-- ================ -->
						<div class="main col-md-6 col-md-offset-3 pv-40">
							<h1 class="page-title"><span class="text-default">404</span></h1>
							<h2>Ooops! Page Not Found</h2>
							<p>The requested URL was not found on this server. Make sure that the Web site address displayed in the address bar of your browser is spelled and formatted correctly.</p>
							
							<a href="index.sin" class="btn btn-default btn-animated btn-lg">Return Home <i class="fa fa-home"></i></a>
						</div>
						<!-- main end -->

					</div>
				</div>
			</section>
			<!-- main-container end -->
			
			<%-- footer --%>
			<%@include file="../main/footer.jsp" %>
			<%-- /footer --%>		
			
		</div>
		<!-- page-wrapper end -->

		<!-- JavaScript files placed at the end of the document so the pages load faster -->
		<!-- ================================================== -->
		<!-- Jquery and Bootstap core js files -->
		<script type="text/javascript" src="assets/plugins/jquery.min.js"></script>
		<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
		<!-- Modernizr javascript -->
		<script type="text/javascript" src="assets/plugins/modernizr.js"></script>
		<script type="text/javascript" src="assets/plugins/rs-plugin-5/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
		<script type="text/javascript" src="assets/plugins/rs-plugin-5/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
		<!-- Isotope javascript -->
		<script type="text/javascript" src="assets/plugins/isotope/isotope.pkgd.min.js"></script>
		<!-- Magnific Popup javascript -->
		<script type="text/javascript" src="assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
		<!-- Appear javascript -->
		<script type="text/javascript" src="assets/plugins/waypoints/jquery.waypoints.min.js"></script>
		<!-- Count To javascript -->
		<script type="text/javascript" src="assets/plugins/jquery.countTo.js"></script>
		<!-- Parallax javascript -->
		<script src="assets/plugins/jquery.parallax-1.1.3.js"></script>
		<!-- Contact form -->
		<script src="assets/plugins/jquery.validate.js"></script>
		<!-- Background Video -->
		<script src="assets/plugins/vide/jquery.vide.js"></script>
		<!-- Owl carousel javascript -->
		<script type="text/javascript" src="assets/plugins/owlcarousel2/owl.carousel.min.js"></script>
		<!-- Pace javascript -->
		<script type="text/javascript" src="assets/plugins/pace/pace.min.js"></script>
		<!-- SmoothScroll javascript -->
		<script type="text/javascript" src="assets/plugins/jquery.browser.js"></script>
		<script type="text/javascript" src="assets/plugins/SmoothScroll.js"></script>
		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="assets/js/template.js"></script>
		<!-- Custom Scripts -->
		<script type="text/javascript" src="assets/js/custom.js"></script>

	</body>
</html>
