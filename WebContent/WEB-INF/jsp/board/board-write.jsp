<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- include summernote -->
<link rel="stylesheet" href="assets/summernote/summernote.css">

<!-- 소스코드 하이라이트 -->
<!-- <link href="http://alexgorbatchev.com/pub/sh/current/styles/shCore.css" rel="stylesheet" type="text/css">
<link href="http://alexgorbatchev.com/pub/sh/current/styles/shThemeDjango.css" rel="stylesheet" type="text/css"> -->

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

					<form id="writeForm" action="boardWrite.sin" method="post" encType="multipart/form-data">
						<input type="hidden" name="mem_id" value="${login.mem_id }"/>
						<input type="hidden" name="menu_no" value="${menu_no }"/>
						<input type="hidden" name="sub_no" value="${sub_no }"/>
						<c:if test="${bvo != null }">
							<input type="hidden" name="board_no" value="${bvo.board_no }"/>
						</c:if>
						<input type="hidden" id="type" name="type"/>
						<label for="board_title">Title</label>
						<input type="text" class="form-control" id="board_title" name="board_title" placeholder="Enter Title"
						value="${bvo.board_title }">
						
						<div class="separator"></div>
						<textarea id="board_contents" name="board_contents"
							class="summernote"></textarea>
						
						<div style="display: inline-block; width: 49%">
							<label for="exampleInputFile">File input</label>
							<input type="file" id="exampleInputFile" name="file">
							<p class="help-block">${bvo.board_fname_ori }</p>
						</div>
						<div style="display: inline-block; width: 49%; text-align: right;">
							<c:if test="${bvo == null }">
								<a onclick="chkSubmit()" class="btn radius-50 btn-success btn-lg">Save</a>
							</c:if>
							<c:if test="${bvo != null }">
								<a onclick="chkModify()" class="btn radius-50 btn-success btn-lg">Save</a>
							</c:if>
							<a href="subtitle.sin?menu_no=${menu_no }&sub_no=${sub_no}" class="btn radius-50 btn-danger btn-lg">Cancel</a>
						</div>
					</form>
					<!-- main End -->
				</div>
			</div>
		</section>
		<!-- main-container end -->

		<%-- footer --%>
		<%@include file="../main/footer.jsp"%>
		<%-- /footer --%>

	</div>
	<!-- page-wrapper end -->
	
	<!-- add code modal start -->
	<div id="myModal" class="modal  bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="false">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="false">&times;</span><span class="sr-only">Close</span></button>
	                <h3 class="modal-title" id="myModalLabel">Add Code</h3>
	            </div>
	            <div>
	            	<label for="selectLanguage">Select Language</label>
		            <select id="selectLanguage" class="form-control">
		            	<c:forEach var="lan_vo" items="${language }">
							<option value="${lan_vo.language_name }">${lan_vo.language_name }</option>
						</c:forEach>
					</select>
	            </div>
	            
	            <div class="modal-body">
	                <textarea id="source-code" rows="10" style="width:100%; resize: none;" placeholder="Source Code를 붙여 넣으세요."></textarea>
	            </div>
	            <div class="modal-footer">
	            	<button type="button" class="btn btn-sm btn-success" data-dismiss="modal" onclick="insertSource()">Insert Code</button>
	                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal" onclick="clearSource()">Close</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- add code modal end -->
	
	<div style="display: none;">
		<textarea id="bvo_board_contents">${bvo.board_contents}</textarea>
	</div>
	
	<!-- JavaScript files placed at the end of the document so the pages load faster -->
	<!-- ================================================== -->
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>

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
<!-- 	<script src="http://alexgorbatchev.com/pub/sh/current/scripts/shCore.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushAS3.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushBash.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushColdFusion.js"></script>
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushCSharp.js"></script>
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
	<script type="text/javascript" src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushXml.js"></script> -->
	

	<script type="text/javascript">

	// 소스코드 하이라이트
	//SyntaxHighlighter.all()
  
    $(document).ready(function() {
    	
	   	var editor = $('#board_contents');

	   	editor.summernote({
	   	    height: ($(window).height() - 900),
	   	    focus: true,
	   	 	callbacks : {

                onInit: function() {
  		   	      // Add Code - buttons
  		   	      var noteBtn = '<button id="makeSnote" type="button" class="btn btn-default btn-sm btn-small" title="Add Code" data-toggle="modal" data-target="#myModal" tabindex="-1"><i class="fa fa-file-text"></i></button>';
  		   	      var fileGroup = '<div class="note-file btn-group">' + noteBtn + '</div>';

  		   	      $(fileGroup).appendTo($('.note-toolbar'));
  		   	      // Button tooltips
  		   	      $('#makeSnote').tooltip({
  		   	        container: 'body',
  		   	        placement: 'bottom'
  		   	      });
  		   	      // Button events
  		   	      /* $('#makeSnote').click(function(event) {

  		   	      }); */
  		   	    },
                onImageUpload: function(files, editor, welEditable) {
			        sendFile(files[0], editor, welEditable);
                }
	   	 	}

	   	  });
	   	
	   	  $('#board_contents').summernote("code", $('#bvo_board_contents').val());

	   	  /* var para = "<p>I am trying to make it</p><p>such that when a user</p><p>highlights any character or</p><p>word within this textbox (using their cursor)</p><p>and then clicks the music note button</p><p>in the toolbar, that a function</p>will:</p><p><ol><li>Wrap that highlighted text in a 'span' tag with a class of 'snote'</li><li>All of the formatting in this textbox will remain the same</li><li>The text will be the color 'blue'</li></ol></p><p>Right now the function does #1 and #3 but cannot do #2 and it deletes some text too</p>";

	   	  $('.note-editable').html(para);

	   	  $('#resetBtn').click(function() {
	   	    $('.note-editable').html('').html(para);
	   	  }); */


    });
    
    function sendFile(file, editor, welEditable) {
		data = new FormData();	// 폼태그처럼 파라미터를 전달하기 위해 만든 객체
		
		// upload_file 이라는 파라미터 지정
		data.append("file", file);
		
		$.ajax({
			url: "uploadImage.sin", // image 저장 소스
			data: data,
			//datatype: 'json',
			cache: false,
			contentType: false,
			processData: false,
			type: 'POST',
			// url 실행 결과값은 success 로 넘어온다.
			success: function(data){
				//alert(data.url);
				//var image = $('<img>').attr('src', '' + data.url); // 에디터에 img 태그로 저장을 하기 위함
				//$('#content').summernote("insertNode", image[0]); // summernote 에디터에 img 태그를 보여줌
				//editor.insertImage(welEditable, data);
				//console.log(data)
				$('#board_contents').summernote("insertImage", data.url); // summernote 에디터에 img 태그를 보여줌
			},
			error: function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus+" "+errorThrown);
			}
		});
	}
    
    function clearSource(){
    	$('#source-code').val("");
    }
    
    function insertSource(){
    	// highlight
    	//var source = "<pre><code>" + htmlEntities($('#source-code').val()) +"</code></pre>";
    	
    	// 소스코드 하이라이트
    	var	source = $('#board_contents').summernote("code");
    	
    	console.log(source);
    	
    	source += "<pre class='brush: "+$('#selectLanguage').val()+"'>" + htmlEntities($('#source-code').val()) +"</pre>";
    	
    	$('#board_contents').summernote("code", "");
    	
    	$('#board_contents').summernote("code", source);

    	clearSource();
    }
    
    function htmlEntities(str) {
        return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
    }
    
    function chkSubmit() {
    	if($('#board_title').val().length == 0) {
    		alert("제목을 입력해 주세요.");
    		$('#board_title').focus();
    		
    		return;
    	}
    	
    	$('#type').val("add");
    	$('#writeForm').submit();
    }
    
    function chkModify() {
    	if($('#board_title').val().length == 0) {
    		alert("제목을 입력해 주세요.");
    		$('#board_title').focus();
    		
    		return;
    	}
    	
    	//alert($('#board_title').val());
    	$('#type').val("modify");
    	$('#writeForm').submit();
    }
  </script>

</body>
</html>
