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
		<link rel="stylesheet" href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css" />

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
		


		
		
		<script type="text/javascript">
		
			$(function(){
	
				var datatables = null;
				
				if(datatables) datatables.destroy();
				
				var tableId = "#"+${menu_no};
				console.log(tableId);
	
			    datatables = $(tableId).DataTable({
			        processing: true
			        ,serverSide: true
			        ,retrieve: true
			        ,stateSave: true
			        ,paging: true
			        ,lengthChange: true
			        //,displayStart: ${start}
			        ,pageLength: 10
			        ,aLengthMenu: [[10, 15, 30], [10, 15, 30]]
			        ,searching: false
			        ,dom: '<"top"i>rt<"bottom"lp><"clear">'
			        ,autoWidth: false
			        ,columnDefs: [
			            {className: "text-left", targets: [0,1,2,3]},
			            {orderable: false, targets :[0,1,2,3]}
			        ]
			        ,"order" : [[0, "desc"]]
			        ,ajax: {
			            url: "paging.sin"
			            ,type: "POST"
		            	,data: function(d){
		                    tmp = new Object;
		                    tmp.datatables = 1;
		                    tmp = $.extend(tmp, d);
		                    return tmp;
		                }
			        }
			        ,columns: [
			            {"data": "board_no"}
			            ,{"data": "board_title"}
			            ,{"data": "mem_id"}
			            ,{"data": "board_date"}
			            
			        ],
			        initComplete: function () {
			        	$(tableId+' tbody').on('click', 'tr', function () {
			        		console.log( datatables.row( this ).data() );
			        		
			        		var data = datatables.row( this ).data();
			        		
			        		location.href = "boardview.sin?menu_no="+${menu_no}+"&sub_no="+${sub_no} + "&board_no="+ data.board_no;
			        		
			        		//alert( 'You clicked on '+data.board_no+' row' );
					    } );
			        }
			    });
			});
			
			function writeBoard(){
				$('#writeForm').submit();
			}
			
		</script>
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
		
			<!-- main-container start -->
			<!-- ================ -->
			<section class="main-container jumbotron light-gray-bg text-center margin-clear">

				<div class="container">
					<div class="row">

						<!-- main start -->
						<!-- ================ -->
						<table id="${menu_no }" class="table table-hover">
							<colgroup>
								<col width="10%" />
								<col width="50%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th>#</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							
							<c:if test="${login != null }">
								<tfoot>
									<tr>
										<td colspan="4" style="text-align: right">
											<a class="btn btn-success btn-sm" onClick="writeBoard()">Write</a>
										</td>
									</tr>
								</tfoot>
							</c:if>

						</table>
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
		
		<form action="boardWrite.sin" method="get" id="writeForm">
			<input type="hidden" id="sub_no" name="sub_no" value="${sub_no }"/>
			<input type="hidden" id="menu_no" name="menu_no" value="${menu_no }"/>
		</form>

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
		<!-- DataTables -->
		<script type="text/javascript" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

	</body>
</html>
