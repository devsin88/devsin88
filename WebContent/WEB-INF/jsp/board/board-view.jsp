<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- include libraries BS3 -->
<!-- <link rel="stylesheet"href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" /> -->
<link rel="stylesheet"href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" />

<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js)-->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.min.css" />
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/blackboard.min.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.min.css">

<!-- 소스코드 하이라이트 -->
<link href="http://alexgorbatchev.com/pub/sh/current/styles/shCore.css" rel="stylesheet" type="text/css">
<link href="http://alexgorbatchev.com/pub/sh/current/styles/shThemeDjango.css" rel="stylesheet" type="text/css">


</head>

<!-- body classes:  -->
<!-- "boxed": boxed layout mode e.g. <body class="boxed"> -->
<!-- "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> -->
<!-- "transparent-header": makes the header transparent and pulls the banner to top -->
<!-- "gradient-background-header": applies gradient background to header -->
<!-- "page-loader-1 ... page-loader-6": add a page loader to the page (more info @components-page-loaders.html) -->
<body class="no-trans">

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
							<span class="txt_detail my_post">${vo.mem_id } |
								${vo.board_date } 
								<c:if test="${login.mem_id == vo.mem_id }">
									| <a onclick="modifyBoard()" class="link_detail">수정</a> | <a onclick="deleteBoard()" class="link_detail">삭제</a>
								</c:if>
							</span>
						</div>
						<!-- page-title end -->
						<div class="separator"></div>

						<!-- content start -->
						<div>
							<div style="width: 90%; margin: auto;">${vo.board_contents }</div>
						</div>
						
						<c:if test="${vo.board_fname_ori != null }">
							<div>
								<br/><br/>
								<div style="width: 90%; margin: auto;">
									<label for="attachedFile">첨부파일 : </label>
									<a id="attachedFile" onclick="downloadFile()">${vo.board_fname_ori }</a>
								</div>
							</div>
						</c:if>
						<!-- content End -->

						<div class="separator"></div>

						
						<div class="area_reply">
							<div id="comment_show" style="width: 90%; margin: auto;">
								
									<a class="btn btn-success btn-sm" onclick="showRelay()">
										<strong class="tit_reply">댓글(${cvo_count })</strong>
									</a>
								
							</div>
						</div>


						<div class="separator"></div>
						<!-- Reply Start  -->
						<div id="reply" style="display: none;">
							<div>
								<div style="width: 90%; margin: auto;">
									<!-- 대체텍스트 댓글펼치기/댓글접기 변경 -->
	
									<div>
	
										<ul style="padding: 0;">
	
											<li style="list-style: none;">
												<table id="comment_table" style="width: 100%;">
													<colgroup>
														<col width="50px" />
														<col width="auto" />
													</colgroup>
													<tbody>
														<c:forEach var="comment_vo" items="${cvo }" varStatus="status">
															<tr>
																<td style="vertical-align: top;"><img
																	src="assets/images/comment_img.png"
																	 alt="프로필사진"
																	style="display: inline-block;"></td>
																<td>
																	<p style="margin: 0; color: green;">
																		${comment_vo.mem_id }
																	</p>
																	<p style="margin: 0;">${comment_vo.comment_contents }</p>
																	<p style="margin: 0; display: inline-block;">${comment_vo.comment_date}</p>
																	
																	<c:if test="${comment_vo.mem_id == login.mem_id }">
																		<div style="display: inline-block;">
																			<!-- <a href="#">수정</a>/ --><a onClick="delComment('${comment_vo.comment_no }')">삭제</a><!--  <a href="#"
																				onclick="" class="">댓글쓰기</a> -->
																		</div>
																	</c:if>
																	
																	<div class="separator"></div>
																</td>															
																
																<%-- <c:if test="${!status.last }">
			    													<div class="separator"></div>
			    												</c:if> --%>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</li>
	
										</ul>
									</div>
									<!-- 대체텍스트 댓글펼치기/댓글접기 변경 -->
								</div>
							</div>
						
							<form>
								<input type="hidden" id="mem_id" name="mem_id" value="${login.mem_id }"/>
								<input type="hidden" id="board_no" name="board_no" value="${board_no }"/>
								<div style="text-align: center;">
									<div style="width: 90%; margin: auto;">
										<textarea id="comment" name="comment" style="resize: none; width: 100%; height: 80px;" <c:if test="${login == null }">placeholder="댓글은 로그인을 해야 작성 가능 합니다."</c:if> ></textarea>
										<div style="text-align: right; width: 100%">
											<c:if test="${login != null }">
												<a class="btn btn-success btn-sm" onclick="addComment(this.form)">입력</a>
											</c:if>
											<c:if test="${login == null }">
												<a class="btn btn-success btn-sm" onclick="alert('로그인 후 작성 가능합니다.')">입력</a>
											</c:if>
										</div>
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

	<%-- footer --%>
	<%@include file="../main/footer.jsp"%>
	<%-- /footer --%>

	</div>
	<!-- page-wrapper end -->
	
	<form id="writerMenu" method="post">
		<input type="hidden" name="menu_no" value="${menu_no }">
		<input type="hidden" name="sub_no" value="${sub_no }">
		<input type="hidden" name="board_no" value="${vo.board_no }">
	</form>
	
	<form id="downFile" action="downFile.sin" method="post">
		<input type="hidden" name="board_fname_ori" value="${vo.board_fname_ori }">
		<input type="hidden" name="board_fname_svr" value="${vo.board_fname_svr }">
	</form>

	<!-- JavaScript files placed at the end of the document so the pages load faster -->
	<!-- ================================================== -->
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
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
	
	<!-- include libraries BS3 -->
	<script type="text/javascript"
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

	<!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js)-->
	<script type="text/javascript"
		src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.min.js"></script>
	
	<!-- include summernote -->
	<script type="text/javascript" src="assets/summernote/summernote.js"></script>
	
	<!-- 소스코드 하이라이트 -->
	<script src="http://alexgorbatchev.com/pub/sh/current/scripts/shCore.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushAS3.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushBash.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushColdFusion.js"></script>
	<!-- <script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushCSharp.js"></script> -->
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushCpp.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushCss.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushDelphi.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushDiff.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushErlang.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushGroovy.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJScript.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJava.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJavaFX.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushPerl.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushPhp.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushPlain.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushPowerShell.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushPython.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushRuby.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushScala.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushSql.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushVb.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushXml.js"></script>
	
		
	<script type="text/javascript">

/* 		$(function(){
			$('#reply').css('display','none');
		});
 */
		//소스코드 하이라이트
		SyntaxHighlighter.all()	
 
		function addComment(form){
			
			var url = "addComment.sin";
			var param = "mem_id="+ $('#mem_id').val() +"&comment_contents="+ $('#comment').val() +
						"&board_no="+$('#board_no').val();
			//console.log(param);
			$('#comment').val('');
			
			
			$.ajax({
				type: "POST",
				url: url,
				data: param,
				success: function(res){
					if(res.trim() != "null"){
						var obj = JSON.parse(res);
						
						$("#comment_table tbody").html('');
						
						//console.log(obj.length);
						
						for(var cvo in obj){
							var str = "<tr><td style='vertical-align: top;''><img src='"+
							"assets/images/comment_img.png'" + 
							"alt='프로필사진' style='display: inline-block;'></td><td><p style='margin: 0; color: green;'>"+
							obj[cvo].mem_id +
							"</p><p style='margin: 0;'>"+
							obj[cvo].comment_contents +
							"</p><p style='margin: 0; display: inline-block;'>"+
							obj[cvo].comment_date+
							"</p><div style='display: inline-block; text-align: right;'><a onClick=\"delComment('"+obj[cvo].comment_no+"')\">삭제</a> </div><div class='separator'></div></td></tr>"
							
							//console.log(str);
							
							$("#comment_table tbody").append(str);
						}
						
						$("#comment_show").html('');
						
						var str = "<a class='btn btn-success btn-sm' onclick='showRelay()'>"+
									"<strong class='tit_reply'>댓글("+ obj.length +")</strong>"+
								  "</a>";
								  
						$("#comment_show").append(str);


					}else
						alert("댓글 등록에 실패 했습니다.");
				},
				error: function(req, err, ex){
					alert(req.status + ": " +req.statusText);
				}
			});
		}
 
		function delComment(comment_no){
			
			var url = "delComment.sin";
			var param = "comment_no="+ comment_no + "&board_no="+$('#board_no').val();
			//console.log(param);
			
			$.ajax({
				type: "POST",
				url: url,
				data: param,
				success: function(res){
					if(res.trim() != "null"){
						var obj = JSON.parse(res);
						
						$("#comment_table tbody").html('');
						
						//console.log(obj.length);
						
						for(var cvo in obj){
							var str = "<tr><td style='vertical-align: top;''><img src='"+
							"assets/images/comment_img.png'" + 
							"alt='프로필사진' style='display: inline-block;'></td><td><p style='margin: 0; color: green;'>"+
							obj[cvo].mem_id +
							"</p><p style='margin: 0;'>"+
							obj[cvo].comment_contents +
							"</p><p style='margin: 0; display: inline-block;'>"+
							obj[cvo].comment_date+
							"</p><div style='display: inline-block; text-align: right;'><a onClick=\"delComment('"+obj[cvo].comment_no+"')\">삭제</a> </div><div class='separator'></div></td></tr>"
							
							console.log(str);
							
							$("#comment_table tbody").append(str);
						}

						$("#comment_show").html('');
						
						var str = "<a class='btn btn-success btn-sm' onclick='showRelay()'>"+
									"<strong class='tit_reply'>댓글("+ obj.length +")</strong>"+
								  "</a>";
								  
						$("#comment_show").append(str);
	
	
					}else
						alert("댓글 삭제에 실패 했습니다.");
				},
				error: function(req, err, ex){
					alert(req.status + ": " +req.statusText);
				}
			});
		}		
		
		function showRelay(){
			$('#reply').css('display', $('#reply').css('display') == 'none'? 'block' : 'none');
		}
		
		function modifyBoard(){
			$("#writerMenu").attr("action", "modifyBoard.sin");
			$("#writerMenu").submit();
		}
		
		function deleteBoard(){
			$("#writerMenu").attr("action", "deleteBoard.sin");
			$("#writerMenu").submit();
		}
		
		function downloadFile() {
			$("#downFile").submit();
		}
	</script>

</body>
</html>
