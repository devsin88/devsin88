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

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<!-- DataTables -->
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Web Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,500italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:700,400,300'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Pacifico'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=PT+Serif'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap core CSS -->
<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Font Awesome CSS -->
<link href="assets/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet">

<!-- Fontello CSS -->
<link href="assets/fonts/fontello/css/fontello.css" rel="stylesheet">

<!-- Plugins -->
<link href="assets/plugins/magnific-popup/magnific-popup.css"
	rel="stylesheet">
<link href="assets/plugins/rs-plugin-5/css/settings.css"
	rel="stylesheet">
<link href="assets/plugins/rs-plugin-5/css/layers.css" rel="stylesheet">
<link href="assets/plugins/rs-plugin-5/css/navigation.css"
	rel="stylesheet">
<link href="assets/css/animations.css" rel="stylesheet">
<link href="assets/plugins/owlcarousel2/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="assets/plugins/owlcarousel2/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="assets/plugins/hover/hover-min.css" rel="stylesheet">

<!-- The Project's core CSS file -->
<!-- Use css/rtl_style.css for RTL version -->
<link href="assets/css/style.css" rel="stylesheet">
<!-- The Project's Typography CSS file, includes used fonts -->
<!-- Used font for body: Roboto -->
<!-- Used font for headings: Raleway -->
<!-- Use css/rtl_typography-default.css for RTL version -->
<link href="assets/css/typography-default.css" rel="stylesheet">
<!-- Color Scheme (In order to change the color scheme, replace the blue.css with the color scheme that you prefer)-->
<link href="assets/css/skins/cool_green.css" rel="stylesheet">


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
	<div class="scrollToTop circle">
		<i class="icon-up-open-big"></i>
	</div>

	<!-- page wrapper start -->
	<!-- ================ -->
	<div class="page-wrapper">

		<%-- Header --%>
		<%@include file="../main/header.jsp"%>
		<%-- /Header --%>

		<!-- main-container start -->
		<!-- ================ -->
		<section class="main-container">

			<div class="container">
				<div class="row">

					<!-- main start -->
					<!-- ================ -->
					<div class="main col-md-12">

						<!-- page-title start -->
						<!-- ================ -->
						<div style="text-align: center;">
							<h1 class="page-title text-center">${vo.board_title }</h1>
							<span class="txt_detail my_post">${vo.mem_id } | ${vo.board_date } | 
								<a href="#" class="link_detail">수정</a> | 
								<a href="#" class="link_detail">비공개</a> | 
								<a href="#" onclick="#" class="link_detail">삭제</a>
							</span>
						</div>
						<!-- page-title end -->
						<div class="separator"></div>

						<!-- content start -->
						<div>
							<div style="width:90%; margin:auto;">${vo.board_contents }</div>
						</div>
						<!-- content End -->

						<div class="separator"></div>

						<!-- Reply Start  -->
						<div class="area_reply ">
							<div style="width: 90%; margin:auto;">
								<strong class="tit_reply">댓글
									<button type="button" onclick="">
										<span>2</span> <span>댓글펼치기</span>
									</button>
								</strong>
							</div>
						</div>
						
						
						<div class="separator"></div>
						<div>
							<div style="width: 90%; margin:auto;">
								<!-- 대체텍스트 댓글펼치기/댓글접기 변경 -->
								
								<div>
									
									<ul style="padding: 0;">
	
										<li style="list-style: none;">
											<table style="width: 100%;">
												<colgroup>
													<col width="50px" />
													<col width="auto" />
												</colgroup>
												<tbody>
													<tr>
														<td>
															<img src="//i1.daumcdn.net/thumb/C100x100/?fname=https://t1.daumcdn.net/tistory_admin/blog/admin/profile_default_05.png"
															width="50" height="50" alt="프로필사진" style="display: inline-block;">
														</td>
														<td>
															<p style="margin: 0;"><a href="" onclick=""> DevSin</a></p>
															<p style="margin: 0;">test</p>
															<p style="margin: 0; display: inline-block;">2017.04.11 22:12</p>
															<div style="display: inline-block; text-align: right;">
															 <a href="#">수정</a>/<a href="#">삭제</a> <a href="#" onclick="" class="">댓글쓰기</a>
															 </div>
														</td>
													</tr>
												</tbody>
											</table>
										</li>
	
									</ul>
								</div>
								<!-- 대체텍스트 댓글펼치기/댓글접기 변경 -->
							</div>
						</div>

						<div class="separator"></div>
							<form method="post" action="">
								<div  style="text-align: center;">
									<div style="width: 90%; margin:auto;">
										<textarea style="resize: none; width:100%; height: 80px;"></textarea>
										<div style="text-align: right; width:100%"><button type="submit">입력</button></div>
									</div>
								</div>
							</form>

						</div>
						<!-- Reply End -->
					</div>
					<!-- main end -->

				</div>
			</div>
		</section>
		<!-- main-container end -->

	</div>
	</div>
	</section>
	<!-- main-container end -->

	<%-- footer --%>
	<%@include file="../main/footer.jsp"%>
	<%-- /footer --%>

	</div>
	<!-- page-wrapper end -->

	<!-- JavaScript files placed at the end of the document so the pages load faster -->
	<!-- ================================================== -->
	<!-- Jquery and Bootstap core js files -->
	<script type="text/javascript" src="assets/plugins/jquery.min.js"></script>
	<script type="text/javascript"
		src="assets/bootstrap/js/bootstrap.min.js"></script>
	<!-- Modernizr javascript -->
	<script type="text/javascript" src="assets/plugins/modernizr.js"></script>
	<script type="text/javascript"
		src="assets/plugins/rs-plugin-5/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
	<script type="text/javascript"
		src="assets/plugins/rs-plugin-5/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
	<!-- Isotope javascript -->
	<script type="text/javascript"
		src="assets/plugins/isotope/isotope.pkgd.min.js"></script>
	<!-- Magnific Popup javascript -->
	<script type="text/javascript"
		src="assets/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
	<!-- Appear javascript -->
	<script type="text/javascript"
		src="assets/plugins/waypoints/jquery.waypoints.min.js"></script>
	<!-- Count To javascript -->
	<script type="text/javascript" src="assets/plugins/jquery.countTo.js"></script>
	<!-- Parallax javascript -->
	<script src="assets/plugins/jquery.parallax-1.1.3.js"></script>
	<!-- Contact form -->
	<script src="assets/plugins/jquery.validate.js"></script>
	<!-- Background Video -->
	<script src="assets/plugins/vide/jquery.vide.js"></script>
	<!-- Owl carousel javascript -->
	<script type="text/javascript"
		src="assets/plugins/owlcarousel2/owl.carousel.min.js"></script>
	<!-- Pace javascript -->
	<script type="text/javascript" src="assets/plugins/pace/pace.min.js"></script>
	<!-- SmoothScroll javascript -->
	<script type="text/javascript" src="assets/plugins/jquery.browser.js"></script>
	<script type="text/javascript" src="assets/plugins/SmoothScroll.js"></script>
	<!-- Initialization of Plugins -->
	<script type="text/javascript" src="assets/js/template.js"></script>
	<!-- Custom Scripts -->
	<script type="text/javascript" src="assets/js/custom.js"></script>
	<!-- DataTables -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

</body>
</html>
