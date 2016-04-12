<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html>
<!--<![endif]-->
<head>


<title>一人一句</title>
<!-- Meta -->
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<!-- Bootstrap Extended -->
<link
	href="bootstrap/extend/jasny-bootstrap/css/jasny-bootstrap.min.css"
	rel="stylesheet" />
<link
	href="bootstrap/extend/jasny-bootstrap/css/jasny-bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="bootstrap/extend/bootstrap-wysihtml5/css/bootstrap-wysihtml5-0.0.2.css"
	rel="stylesheet" />

<!-- JQueryUI v1.9.2 -->
<link rel="stylesheet"
	href="theme/scripts/jquery-ui-1.9.2.custom/css/smoothness/jquery-ui-1.9.2.custom.min.css" />

<!-- Glyphicons -->
<link rel="stylesheet" href="theme/css/glyphicons.css" />

<!-- Bootstrap Extended -->
<link rel="stylesheet"
	href="bootstrap/extend/bootstrap-select/bootstrap-select.css" />
<link rel="stylesheet"
	href="bootstrap/extend/bootstrap-toggle-buttons/static/stylesheets/bootstrap-toggle-buttons.css" />

<!-- Uniform -->
<link rel="stylesheet" media="screen"
	href="theme/scripts/pixelmatrix-uniform/css/uniform.default.css" />

<!-- JQuery v1.8.2 -->
<script src="theme/scripts/jquery-1.8.2.min.js"></script>

<!-- Modernizr -->
<script src="theme/scripts/modernizr.custom.76094.js"></script>

<!-- MiniColors -->
<link rel="stylesheet" media="screen"
	href="theme/scripts/jquery-miniColors/jquery.miniColors.css" />

<!-- Theme -->
<link rel="stylesheet" href="theme/css/style.min.css?1361377771" />

<!-- LESS 2 CSS -->
<script src="theme/scripts/less-1.3.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<div class="navbar main">

		<div class="container">
			<div class="row">
				<div class="span12 relativeWrap">

					<button type="button" class="btn btn-navbar visible-phone">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<ul id="menu" class="hidden-phone">
						<li class="active"><a href="myInfo.jsp" class="menuToggle">我的信息</a></li>
						<li class="active"><a href="mainPage.jsp" class="menuToggle">主界面</a></li>
					</ul>
				</div>
				<div class="header-right">
					<ul id="menu" class="hidden-phone">
						<li class="active"><a href="login.jsp" class="menuToggle">注销</a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>



	<!-- Start Content -->
	<div class="container-fluid fixed">
		<div class="container-fluid fixed">
			<div id="content">

				<form name="newcase" id="newcase_id" method="post" action="">
					<h3 class="glyphicons show_thumbnails_with_lines">
						<i></i>作品1
					</h3>
					<div class="controls">
						<label class="heading">类型：</label>
						<div class="span2">
							<button type="button"
								class="btn btn-icon btn-primary glyphicons circle_ok"
								onclick="window.location.href='mainPage.jsp'">
								<i></i>小说
							</button>
						</div>
						<div class="span2">
							<button type="button"
								class="btn btn-icon btn-primary glyphicons circle_ok"
								onclick="window.location.href='typePage.jsp'">
								<i></i>言情
							</button>
						</div>
						<br /> <br /> <label class="heading">关键字：</label>
						<div class="span2" style="margin-top: 1em">
							<label class="btn btn-icon btn-primary glyphicons circle_ok">
								<i></i>现代
							</label>
						</div>
						<div class="span2" style="margin-top: 1em">
							<label class="btn btn-icon btn-primary glyphicons circle_ok">
								<i></i>幽默
							</label>
						</div>
						<div class="span2" style="margin-top: 1em">
							<label class="btn btn-icon btn-primary glyphicons circle_ok">
								<i></i>校园
							</label>
						</div>
					</div>
					<br /> <br />
					<hr/>
					<%
						for (int i = 0; i < 3; i++) {
					%>

					<div class="row-fluid">
						<div class="headline">
							<div class="row-fluid">
								<div class="span4" style="float: right">
									<div class="dataTables_paginate paging_bootstrap pagination">
										<ul>
											<li class="prev disabled"><a class="a1" 
												href="#">← Previous</a></li>
											<li class="active"><a href="writeArticle.jsp">接一句</a></li>
											<li class="next disabled"><a href="#" class="a1" >Next → </a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<label>作者：</label>



						<div class="control-group">
							<h4>This award-winning book, substantially updated to
								reflect the latest developments in the field, introduces the
								concepts and best practices of software architecture-how a
								software system is structured and how that system's elements are
								meant to interact. Distinct from the details of implementation,
								algorithm, and data representation, an architecture holds the
								key to achieving system quality, is a reusable asset that can be
								applied to subsequent systems, and is crucial to a software
								organization's business strategy. Drawing on their own extensive
								experience, the authors cover the essential technical topics for
								designing, specifying, and validating a system. They also
								emphasize the importance of the business context in which large
								systems are designed. Their aim is to present software
								architecture in a real-world setting, reflecting both the
								opportunities and constraints that companies encounter. To that
								end, case studies that describe successful architectures
								illustrate key points of both technical and organizational
								discussions.</h4>
						</div>

						<div class="row-fluid">
							<label>日期：</label>
							<div class="span2" style="float: right">
								<img class="img-icon" id="shou" alt="" src="images/shou.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<img class="img-icon" id="zan" alt="" src="images/zan.png" />
							</div>
						</div>


					</div>
					<%
						};
					%>
					<hr />
				</form>

			</div>
		</div>

	</div>

	<!-- JQueryUI v1.9.2 -->
	<script
		src="theme/scripts/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js"></script>
	<!-- JQueryUI Touch Punch -->
	<!-- small hack that enables the use of touch events on sites using the jQuery UI user interface library -->
	<script
		src="theme/scripts/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- MiniColors -->
	<script src="theme/scripts/jquery-miniColors/jquery.miniColors.js"></script>

	<!-- Themer -->
	<script>
		var themerPrimaryColor = '#71c39a';
	</script>
	<script src="theme/scripts/jquery.cookie.js"></script>
	<script src="theme/scripts/themer.js"></script>



	<!-- Resize Script -->
	<script src="theme/scripts/jquery.ba-resize.js"></script>

	<!-- Uniform -->
	<script src="theme/scripts/pixelmatrix-uniform/jquery.uniform.min.js"></script>


	<!-- DataTables -->
	<script
		src="theme/scripts/DataTables/media/js/jquery.dataTables.min.js"></script>
	<script src="theme/scripts/DataTables/media/js/DT_bootstrap.js"></script>

	<!-- Bootstrap Script -->
	<script src="bootstrap/js/bootstrap.min.js"></script>

	<!-- Bootstrap Extended -->
	<script src="bootstrap/extend/bootstrap-select/bootstrap-select.js"></script>
	<script
		src="bootstrap/extend/bootstrap-toggle-buttons/static/js/jquery.toggle.buttons.js"></script>
	<script
		src="bootstrap/extend/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"></script>
	<script
		src="bootstrap/extend/jasny-bootstrap/js/jasny-bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="bootstrap/extend/jasny-bootstrap/js/bootstrap-fileupload.js"
		type="text/javascript"></script>
	<script src="bootstrap/extend/bootbox.js" type="text/javascript"></script>
	<script
		src="bootstrap/extend/bootstrap-wysihtml5/js/wysihtml5-0.3.0_rc2.min.js"
		type="text/javascript"></script>
	<script
		src="bootstrap/extend/bootstrap-wysihtml5/js/bootstrap-wysihtml5-0.0.2.js"
		type="text/javascript"></script>

	<!-- Custom Onload Script -->
	<script src="theme/scripts/load.js"></script>

	<script type="text/javascript">
		function reservation() {

		}
	</script>

</body>
</html>