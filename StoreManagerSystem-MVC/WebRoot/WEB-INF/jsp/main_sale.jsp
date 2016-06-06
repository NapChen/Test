<%@page import="com.kl.napchen.store.bean.ProductType"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>仓库管理系统-商品管理</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/offcanvas.css" rel="stylesheet">

</head>

<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">仓库管理系统</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<%=path%>/main">系统主页</a></li>
					<li class="active"><a>商品管理</a></li>
					<li><a href="<%=path%>/managerType">商品分类</a></li>
					<li><a href="<%=path%>/managerReserve">库存管理</a></li>
					<li><a href="<%=path%>/managerCost">成本管理</a></li>
					<li><a href="<%=path%>/managerAuthority">授权管理</a></li>
					<li><a href="<%=path%>/personalCenter">个人中心</a></li>
					<li><a href="<%=path%>/aboutSystem">关于系统</a></li>
				</ul>
			</div>
			<!-- /.nav-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->
	<h1>
		<br>
	</h1>
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-10">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<div class="jumbotron">
					<h1>&nbsp;&nbsp;欢迎进入商品管理模块</h1>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;您可以预览商品、录入新的商品、标定商品价格、出售商品以及因质量问题对已入库的商品进行封锁。</p>
					<p style="color:#8B008B;">&nbsp;&nbsp;&nbsp;&nbsp;要开始，请在侧边栏选择一种操作或在下面进行分类预览。</p>
				</div>
				<div class="row">
					<div class="col-xs-6 col-lg-4">
						<h2></h2>
						<p></p>
						<p>
							<a class="btn btn-primary" href="<%=path%>/productType?"
								role="button">查看明细 &raquo;</a>
						</p>
					</div>
				</div>
				<!--/row-->
			</div>
			<!--/.col-xs-12.col-sm-9-->

			<div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<a class="list-group-item disabled">快速导航</a> <a
						class="list-group-item active">商品总览</a> <a
						href="<%=path%>/goAddProduct"
						class="list-group-item">录入商品</a> <a
						href="<%=path%>/goSaleProduct"
						class="list-group-item">出售商品</a> <a
						href="<%=path%>/goPriceProduct"
						class="list-group-item">标定价格</a> <a
						href="<%=path%>/goLockProduct"
						class="list-group-item">封锁商品</a>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->

			<div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebarSys">
				<div class="list-group">
					<a class="list-group-item disabled">快速导航</a> <a
						href="<%=path%>/main" class="list-group-item">系统主页</a> <a
						href="<%=path%>/managerProduct"
						class="list-group-item active">商品管理</a> <a
						href="<%=path%>/managerType" class="list-group-item">商品分类</a>
					<a href="<%=path%>/managerReserve" class="list-group-item">库存管理</a>
					<a href="<%=path%>/managerCost" class="list-group-item">成本管理</a> <a
						href="<%=path%>/managerAuthority" class="list-group-item">授权管理</a>
					<a href="<%=path%>/personalCenter" class="list-group-item">个人中心</a>
					<a href="<%=path%>/aboutSystem" class="list-group-item">关于系统</a>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->
		<hr>
	</div>
	<!--/.container-->
	<footer>
		<p class="text-center">
			All Rights Reserved Copyright &copy; <a
				href="http://www.kluntech.com/">广东昆仑信息科技有限公司 </a>2014
		</p>
	</footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.12.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/offcanvas.js"></script>
</body>
</html>
