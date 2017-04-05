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
		<title>The Project | Page Sign Up</title>
		<meta name="description" content="The Project a Bootstrap-based, Responsive HTML5 Template">
		<meta name="author" content="htmlcoder.me">

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
		<script type="text/javascript" src="assets/js/ajaxUtil.js"></script>
		<script type="text/javascript">
		
			// id, email 중복 확인
			var idSucc = false;
			var emailSucc = false;
		
			// 패스워드 체크
			function checkPwd() {
	    		var pwd = document.getElementById("mem_pwd");
	    		var repwd = document.getElementById("mem_repwd");
	
	    		repwd.value="";
	    		repwd.pattern = pwd.value;
	    		
	    		checkState(pwd);
			}
			
			//사용자가 서버를 호출할 때 사용하는 함수
			function sendRequest(url, param, callback, method, async){
							//서버요청경로, 파라미터값들, 도착함수명, 요청방식, 비동기식 여부
				getRequest(); //xhr생성
				
				//요청방식 지정 사용자가 method변수에 "get"이라고 넣었을 때만 get방식으로 지정하고, 그 외는 모두 post방식을 지정하자!
				method = (method.toLowerCase() == "get")?"GET":"POST";
				
				//요청방식에 따라 파라미터를 변경해야 한다.
				//이유는 AJAX에서 GET방식일 때 param은 무조건 null이어야 하기 때문이다. 
				//(왜냐면? GET방식은 파라미터가 URL 뒤에 있어야 하므로 param이라는 변수가 의미가 없다.)
				
				param = (param == null || param == "")?null:param;
				
				if(method == "GET" && param != null) //사용자가 원하는 요청방식이 GET방식인데 파라미터가 있을 경우!
					url = url + "?" + param; 
				
				//요청을 보내고, 응답이 도착할 함수를 지정한다. callback
				xhr.onreadystatechange = callback;
				
				//요청정보 지정
				xhr.open(method, url, async);
				
				//post방식을 위한 Http헤더 설정
				xhr.setRequestHeader("Content-Type",  //key
						"application/x-www-form-urlencoded"); //value
				
				//서버 요청 보내기
				xhr.send(method == "POST"?param:null);
			}
			
			// ID 중복 체크
			function checkID() {
				var id = document.getElementById("mem_id");
				
				if(id.checkValidity() == true && id.value.length >= 4){
					//서버로 보낼 파라미터 작업
					var param = "id=" + id.value; 
					//서버통신
					sendRequest("checkID.sin", param, checkID_res, "post", true);
				}else if(id.value.length == 0){
					$("#id").attr("class","form-group has-feedback");
					idSucc = false;
				}else{
					$("#id").attr("class","form-group has-feedback has-error");
					idSucc = false;
				}
			}
			
			function checkID_res() {
				//서버에서 오류가 날 수도 있다. 판단!
				if(xhr.readyState == 4 && xhr.status == 200){ //readyState == 4 응답이 도착한 경우
															  //status == 200 도착한 응답의 값이 정상적일 경우 (404나 500이 올 수도 있다.)
					//정상적인 처리가 완료되었을 경우, 서버에서 보내온 응답결과를 받아야 한다. 
					//그리고 그 결과를 현재 문서의 id가 box인 곳에 넣어야 한다.
					var str = xhr.responseText;    			
					$("#id").attr("class",str.trim());
					
					if(str.trim() == "form-group has-feedback has-success")
						idSucc = true;		
					else
						idSucc = false;
				}
			}
			
			// Email 중복 체크
			function checkEmail() {
				var email = document.getElementById("mem_email");
				
				if(email.checkValidity() == true && email.value.length >= 4){
					//서버로 보낼 파라미터 작업
					var param = "email=" + email.value; 
					//서버통신
					sendRequest("checkEmail.sin", param, checkEmail_res, "post", true);
				}else if(email.value.length == 0){
					$("#email").attr("class","form-group has-feedback");
					emailSucc = false;
				}else{
					$("#email").attr("class","form-group has-feedback has-error");
					emailSucc = false;
				}
			}
			
			function checkEmail_res() {
				//서버에서 오류가 날 수도 있다. 판단!
				if(xhr.readyState == 4 && xhr.status == 200){ //readyState == 4 응답이 도착한 경우
															  //status == 200 도착한 응답의 값이 정상적일 경우 (404나 500이 올 수도 있다.)
					//정상적인 처리가 완료되었을 경우, 서버에서 보내온 응답결과를 받아야 한다. 
					//그리고 그 결과를 현재 문서의 id가 box인 곳에 넣어야 한다.
					var str = xhr.responseText;    			
					$("#email").attr("class",str.trim());
					
					if(str.trim() == "form-group has-feedback has-success")
						emailSucc = true;		
					else
						emailSucc = false;
				}
			}
			
			function checkState(val) {
				// 상위 div id 구하기
				var id = "#"+(val.id).substring((val.id).indexOf("_")+1);
				
				if(val.value.length == 0)
					$(id).attr("class","form-group has-feedback");
				else if(val.checkValidity())
					$(id).attr("class","form-group has-feedback has-success");
				else
					$(id).attr("class","form-group has-feedback has-error");				
			}
			
			function send(form) {
				
				// 유효성 검사
				if(!idSucc){
					alert("중복된 아이디 또는 형식에 맞지 않는 아이디 입니다.");
					document.getElementById("mem_id").focus();
					return;
				}
				if(!document.getElementById("mem_pwd").checkValidity()){
					alert("비밀번호는 영문, 숫자, 특수문자를 포함한 8~20를 입력해야 합니다.")
					document.getElementById("mem_pwd").focus();
					return;
				}
				if(!document.getElementById("mem_repwd").checkValidity()){
					alert("위에 입력한 비밀번호와 동일하게 입력해 주세요.")
					document.getElementById("mem_repwd").focus();
					return;
				}
				if(!emailSucc){
					alert("중복된 이메일 또는 형식에 맞지 않는 이메일 입니다.")
					document.getElementById("mem_email").focus();
					return;
				}
				if(!document.getElementById("check").checked){
					alert("약관에 동의해 주세요.")
					return;
				}
				
				form.submit();
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
			<%@include file="header.jsp" %>
			<%-- /Header --%>
		
			<!-- breadcrumb start -->
			<!-- ================ -->
			<div class="breadcrumb-container">
				<div class="container">
					<ol class="breadcrumb">
						<li><i class="fa fa-home pr-10"></i><a href="index.sin">Home</a></li>
						<li class="active">Page Sign Up</li>
					</ol>
				</div>
			</div>
			<!-- breadcrumb end -->

			<!-- main-container start -->
			<!-- ================ -->
			<div class="main-container dark-translucent-bg" style="background-image:url('images/background-img-6.jpg');">
				<div class="container">
					<div class="row">
						<!-- main start -->
						<!-- ================ -->
						<div class="main object-non-visible" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
							<div class="form-block center-block p-30 light-gray-bg border-clear">
								<h2 class="title">Sign Up</h2>
								<form class="form-horizontal" role="form" action="signup.sin" method="post">
									<div id="id" class="form-group has-feedback">
										<label for="mem_id" class="col-sm-3 control-label">User Name <span class="text-danger small">*</span></label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="User Name" onkeyup="checkID()" pattern="[A-Za-z0-9]{4,15}" required>
											<i class="fa fa-user form-control-feedback"></i>
										</div>
									</div>
									<div id="pwd" class="form-group has-feedback">
										<label for="mem_pwd" class="col-sm-3 control-label">Password <span class="text-danger small">*</span></label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="mem_pwd" name="mem_pwd" placeholder="Password" onkeyup="checkPwd()" pattern="^(?=.*\d)(?=.*[~`!@#$%\^&*()-])(?=.*[a-zA-Z]).{8,20}$" required>
											<i class="fa fa-lock form-control-feedback"></i>
										</div>
									</div>
									<div id="repwd" class="form-group has-feedback">
										<label for="mem_repwd" class="col-sm-3 control-label">Re-Password <span class="text-danger small">*</span></label>
										<div class="col-sm-8">
											<input type="password" class="form-control" id="mem_repwd" placeholder="Password" onkeyup="checkState(this)" required>
											<i class="fa fa-lock form-control-feedback"></i>
										</div>
									</div>
									<div id="email" class="form-group has-feedback">
										<label for="mem_email" class="col-sm-3 control-label">Email <span class="text-danger small">*</span></label>
										<div class="col-sm-8">
											<input type="email" class="form-control" id="mem_email" name="mem_email" placeholder="Email" onkeyup="checkEmail()" required>
											<i class="fa fa-envelope form-control-feedback"></i>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-8">
											<div class="checkbox">
												<label>
													<input id="check" type="checkbox" required> Accept our <a href="#">privacy policy</a> and <a href="#">customer agreement</a>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-3 col-sm-8">
											<button type="button" class="btn btn-group btn-default btn-animated" onclick="send(this.form)">Sign Up <i class="fa fa-check"></i></button>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- main end -->
					</div>
				</div>
			</div>
			<!-- main-container end -->
			
			<%-- footer --%>
			<%@include file="footer.jsp" %>
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
		<!-- Owl carousel javascript -->
		<script type="text/javascript" src="assets/plugins/owlcarousel2/owl.carousel.min.js"></script>
		<!-- SmoothScroll javascript -->
		<script type="text/javascript" src="assets/plugins/jquery.browser.js"></script>
		<script type="text/javascript" src="assets/plugins/SmoothScroll.js"></script>
		<!-- Initialization of Plugins -->
		<script type="text/javascript" src="assets/js/template.js"></script>
		<!-- Custom Scripts -->
		<script type="text/javascript" src="assets/js/custom.js"></script>
		<script type="text/javascript" src="assets/js/ajaxUtil.js"></script>

	</body>
</html>
