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
<title>主页</title>

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
						<li class="active"><a href="login.jsp" class="menuToggle">注销</a></li>
					</ul>

				</div>
			</div>
		</div>
	</div>

	<!-- Start Content -->
	<div class="container-fluid fixed">


		<div id="content">

			<div class="controls">
				<div class="span2">
					<button type="button"
						class="btn btn-icon btn-primary glyphicons circle_ok"
						onclick="window.location.href='mainPage.jsp'">
						<i></i>所有
					</button>
				</div>
				<div class="span2">
					<button type="button"
						class="btn btn-icon btn-primary glyphicons circle_ok"
						onclick="window.location.href='typePage.jsp'">
						<i></i>诗歌
					</button>
				</div>
				<div class="span2">
					<button type="button"
						class="btn btn-icon btn-primary glyphicons circle_ok"
						onclick="window.location.href='typePage.jsp'">
						<i></i>散文
					</button>
				</div>
				<div class="span2">
					<button type="button"
						class="btn btn-icon btn-primary glyphicons circle_ok"
						onclick="window.location.href='typePage.jsp'">
						<i></i>小说
					</button>
				</div>
				<div class="span2">
					<button type="button"
						class="btn btn-icon btn-primary glyphicons circle_ok"
						onclick="window.location.href='typePage.jsp'">
						<i></i>戏剧
					</button>
				</div>
			</div>
			<h3 class="glyphicons show_thumbnails">
				<i></i>所有文章
			</h3>
			<div class="widget widget-4 widget-body-white">
				<div class="widget-head">
					<h4 class="heading">按标题查找</h4>
				</div>
				<div class="widget-body" style="padding: 10px 0 0;">
					<table
						class="dynamicTable table table-striped table-bordered table-primary table-condensed">
						<thead>
							<tr>
								<th class="center">作品列表</th>
								<th class="center">作品类型</th>
								<th class="center">作品排名</th>
							</tr>
						</thead>
						<tbody>
						<tr>
						<td class="center"><a href="article.jsp">作品1</a></td>
						<td class="center">小说</td>
						<td class="center">排名1</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br />
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">标题！！</h4>
						</div>
						<div class="modal-body">...</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div align="center">
			<img src='' id="oImg" style='display: none'>

		</div>

	</div>

	<!-- JQueryUI v1.9.2 -->
	<script
		src="theme/scripts/jquery-ui-1.9.2.custom/js/jquery-ui-1.9.2.custom.min.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	function rePe() {
		document.getElementById('oImg').style.display = "none";
	}
	</SCRIPT>
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

</body>
</html>