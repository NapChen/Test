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

<title>仓库管理系统-商品管理-录入商品</title>

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
					<form class="form-horizontal" id="productInfo" role="form"
						method="post">
						<h2 class="text-center">录入商品信息</h2>
						<div class="form-group" id="formLType">
							<label for="ltype" class="col-sm-2 control-label">物品大类</label>
							<div class="col-sm-10">
								<select class="form-control" id="ltype" name="largeType"
									onchange="lTypeChange()">
									<option id="lInfo">请选择商品大类</option>
									<!-- 采用JS动态创建Option -->
								</select>
							</div>
						</div>
						<div class="form-group" id="formMType">
							<label for="mtype" class="col-sm-2 control-label">物品中类</label>
							<div class="col-sm-10">
								<select class="form-control" id="mtype" name="mediumType"
									disabled onchange="mTypeOnChange()">
									<!-- 采用JS动态创建Option -->
								</select>
							</div>
						</div>
						<div class="form-group" id="formSType">
							<label for="stype" class="col-sm-2 control-label">物品小类</label>
							<div class="col-sm-10">
								<select class="form-control" id="stype" name="smallType"
									disabled>
									<!-- 采用JS动态创建Option -->
								</select>
							</div>
						</div>
						<div class="form-group" id="formName">
							<label for="name" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请输入物品名称">
							</div>
						</div>
						<div class="form-group" id="formSupplier">
							<label for="supplier" class="col-sm-2 control-label">供应商</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="supplier"
									name="supplier" placeholder="请输入物品供应商">
							</div>
						</div>
						<div class="form-group" id="formVersion">
							<label for="version" class="col-sm-2 control-label">型号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="version"
									name="version" placeholder="请输入物品型号">
							</div>
						</div>
						<div class="form-group" id="formDescription">
							<label for="description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="description"
									name="description" placeholder="请输入物描述">
							</div>
						</div>
						<div class="form-group" id="formRemark">
							<label for="remark" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="remark"
									name="remark" placeholder="请输备注信息">
							</div>
						</div>
						<div class="form-group" id="formNumber">
							<label for="number" class="col-sm-2 control-label">数量</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="number"
									name="number" placeholder="请输商品数量 (注意：多件商品将被拆分成单一记录保存)">
							</div>
						</div>
						<div class="form-group" id="formPrice">
							<label for="price" class="col-sm-2 control-label">售价</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="price" name="price"
									placeholder="请输商品售价">
							</div>
						</div>
						<div class="form-group" id="formLevel">
							<label for="level" class="col-sm-2 control-label">物品等级</label>
							<div class="col-sm-10">
								<select class="form-control" id="level" name="level">
									<option>一等品</option>
									<option>二等品</option>
									<option>三等品</option>
									<option>次 品</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12 text-center">
								<div class="checkbox">
									<label><input type="checkbox" id="lock" name="holdFlag">是否封锁</label>
									<label><input type="checkbox" id="repair"
										name="relFlag">是否返修</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-5  ">
								<div class="button col-sm-8">
									<button type="button" class="btn btn-default" id="clear"
										aria-hidden="true" data-placement="top" title="取消录入，将不保存任何信息">清空</button>
									<button type="button" class="btn btn-primary" id="save"
										data-toggle="tooltip" data-placement="top"
										title="保存录入，将物品信息保存下来">保存</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--/.col-xs-12.col-sm-10-->

			<!-- 放置一个模态框，用于提示 -->
			<!-- Modal1 -->
			<div class="modal fade" id="showInfoModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">提示信息</h4>
						</div>
						<div class="modal-body">
							<h3 id="saveInfo">保存成功</h3>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" aria-hidden="true"
								data-dismiss="modal" data-toggle="tooltip">取消</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.modal -->


			<div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<a class="list-group-item disabled">快速导航</a> <a
						href="<%=path%>/managerProduct" class="list-group-item">商品总览</a> <a
						href="<%=path%>/goAddProduct?operator=add"
						class="list-group-item active">录入商品</a> <a
						href="<%=path%>/goSaleProduct?operator=sale"
						class="list-group-item">出售商品</a> <a
						href="<%=path%>/goPriceProduct?operator=price"
						class="list-group-item">标定价格</a> <a
						href="<%=path%>/goLockProduct?operator=lock"
						class="list-group-item">封锁商品</a>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->

			<div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebarSys">
				<div class="list-group">
					<a class="list-group-item disabled">快速导航</a> <a
						href="<%=path%>/main" class="list-group-item">系统主页</a> <a
						href="<%=path%>/managerProduct" class="list-group-item active">商品管理</a>
					<a href="<%=path%>/managerType" class="list-group-item">商品分类</a> <a
						href="<%=path%>/managerReserve" class="list-group-item">库存管理</a> <a
						href="<%=path%>/managerCost" class="list-group-item">成本管理</a> <a
						href="<%=path%>/managerAuthority" class="list-group-item">授权管理</a>
					<a href="<%=path%>/personalCenter" class="list-group-item">个人中心</a>
					<a href="<%=path%>/aboutSystem" class="list-group-item">关于系统</a>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
		<!--/row-->
		<hr>
		<footer>
			<p class="text-center">
				All Rights Reserved Copyright &copy; <a
					href="http://www.kluntech.com/">广东昆仑信息科技有限公司 </a>2014
			</p>
		</footer>
	</div>
	<!--/.container-->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery-1.12.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/offcanvas.js"></script>

	<script type="text/javascript">
		//初始化大类
		var jsonStr='<%=request.getAttribute("jsonOfType")%>';
		//将Jason字符串转换成Jason对象
		var jsonObj = eval('(' + jsonStr + ')');
		for (var i = 0; i < jsonObj.length; i++) {
			if (jsonObj[i]["type"] == "L") {
				$("#ltype").append(
						"<option id="+jsonObj[i]["largeType"]+"> "
								+ jsonObj[i]["largeName"] + " </option>");
			}
		}
		//alert("初始化完毕");
	</script>
	<script type="text/javascript">
		$("#clear").click(function() {
			//清空所有输入框
			/*
			$("#name").val("");
			$("#supplier").val("");
			$("#verision").val("");
			$("#description").val("");
			$("#remark").val("");
			$("#number").val("");
			*/
			var inputs=$(":input[type='text']");
			//alert(inputs.length);
			for (var i=0;i<inputs.length;i++){
				//alert(inputs[i].value);
				inputs[i].value="";
			}
		})
	</script>
	<script type="text/javascript">
		function lTypeChange() {
			//alert("jin lai le");
			//清空当前选项
			$("#mtype").empty();
			var idStr="mInfo";
			//添加提示
			$("#mtype").append("<option id="+idStr+">请选择商品中类</option>");
			var selectId = $("#ltype").find("option:checked").attr("id");
			//alert(selectId);
			var jsonStr='<%=request.getAttribute("jsonOfType")%>';
			//将Jason字符串转换成Jason对象
			var jsonObj = eval('(' + jsonStr + ')');
			//添加大类下的中类
			var count=0;
			for (var i = 0; i < jsonObj.length; i++) {
				//alert(selectId+"=="+jsonObj[i]["largeType"])
				if (jsonObj[i]["type"] == "M"
						&& jsonObj[i]["largeType"] == selectId) {
					$("#mtype").append(
							"<option id="+jsonObj[i]["mediumType"]+"> " + jsonObj[i]["mediumName"]
									+ " </option>");
					count++;
				}
			}
			if(count==0){
				$("#mInfo").text("当前大类下无中类，请先新增");
				$("#mtype").attr("disabled", true);
			}else{
				$("#mtype").attr("disabled", false);
			}
		}
	</script>
	<script type="text/javascript">
		//改变中类的监听事件
		function mTypeOnChange() {
			//清空当前选项
			$("#stype").empty();
			var idStr="sInfo";
			//添加提示
			$("#stype").append("<option id="+idStr+">请选择商品小类</option>");
			var selectId = $("#mtype").find("option:checked").attr("id");
			//alert(selectId);
			var jsonStr='<%=request.getAttribute("jsonOfType")%>';
			//将Jason字符串转换成Jason对象
			var jsonObj = eval('(' + jsonStr + ')');
			var count = 0;
			//添加大类下的中类
			for (var i = 0; i < jsonObj.length; i++) {
				//alert(selectId+"=="+jsonObj[i]["largeType"])
				if (jsonObj[i]["type"] == "S"
						&& jsonObj[i]["mediumType"] == selectId) {
					$("#stype").append(
							"<option id="+jsonObj[i]["smallType"]+"> "
									+ jsonObj[i]["smallName"] + " </option>");
					count++;
				}
			}
			if (count == 0) {
				$("#sInfo").text("当前中类下无小类，请先新增");
				$("#stype").attr("disabled", true);
			} else {
				$("#stype").attr("disabled", false);
			}
		}
	</script>
	<script type="text/javascript">
	$.fn.serializeObject = function() {
			var o = {};
			var fields = this.serializeArray();
			$.each(fields, function(i,field) {
				if (o[this.name]) {
					if (!o[this.name]) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		}
	</script>
	<script type="text/javascript">
	   function checkData(){
			//检查数据完整性
			var checkInfo="";
			//检查物品大类
			if($("#ltype").val()=="请选择商品大类"){
				$("#formLType").removeClass("has-success");
				$("#formLType").addClass("has-error");
				checkInfo="error";
				return checkInfo;
			}else{
				$("#formLType").removeClass("has-error");
				$("#formLType").addClass("has-success");
				checkInfo="success";
			}
			
			//检查物品中类
			if($("#mtype").attr("disabled")||$("#mtype").val()=="请选择商品中类"){
				$("#formMType").removeClass("has-success");
				$("#formMType").addClass("has-error");
				checkInfo="error";
				return checkInfo;
			}else{
				$("#formMType").removeClass("has-error");
				$("#formMType").addClass("has-success");
				checkInfo="success";
			}
			
			//检查物品小类
			if($("#stype").attr("disabled")||$("#stype").val()=="请选择商品小类"){
				$("#formSType").removeClass("has-success");
				$("#formSType").addClass("has-error");
				checkInfo="error";
				return checkInfo;
			}else{
				$("#formSType").removeClass("has-error");
				$("#formSType").addClass("has-success");
				checkInfo="success";
			}
			
			//检查商品名称
			if($("#name").val()==undefined||$("#name").val()==""){
				$("#formName").removeClass("has-success");
				$("#formName").addClass("has-error");
				checkInfo="error";
				return checkInfo;
			}else{
				$("#formName").removeClass("has-error");
				$("#formName").addClass("has-success");
				checkInfo="success";
			}
			//检查商品供应商
			if($("#supplier").val()==undefined||$("#supplier").val()==""){
				$("#formSupplier").removeClass("has-success");
				$("#formSupplier").addClass("has-error");
				checkInfo="error";
				return checkInfo;
			}else{
				$("#formSupplier").removeClass("has-error");
				$("#formSupplier").addClass("has-success");
				checkInfo="success";
			}
			
			//检查商品型号
			if($("#version").val()==undefined||$("#version").val()==""){
				$("#formVersion").removeClass("has-success");
				$("#formVersion").addClass("has-error");
				checkInfo="error";
				return checkInfo;
			}else{
				$("#formVersion").removeClass("has-error");
				$("#formVersion").addClass("has-success");
				checkInfo="success";
			}
			
			//检查商品数量
			if($("#number").val()==undefined||$("#number").val()==""||isNaN($("#number").val())){
				$("#formNumber").removeClass("has-success");
				$("#formNumber").addClass("has-error");
				checkInfo="error";
				return checkInfo;
			}else{
				$("#formNumber").removeClass("has-error");
				$("#formNumber").addClass("has-success");
				checkInfo="success";
			}
			//检查商品售价
			if($("#price").val()==undefined||$("#price").val()==""||isNaN($("#price").val())){
				$("#formPricer").removeClass("has-success");
				$("#formPricer").addClass("has-error");
				checkInfo="error";
				return checkInfo;
			}else{
				$("#formPricer").removeClass("has-error");
				$("#formPricer").addClass("has-success");
				checkInfo="success";
			}
			
			//检查商品描述
			if($("#description").val()==undefined||$("#description").val()==""){
				$("#formDescription").removeClass("has-success");
				$("#formDescription").addClass("has-warning");
				checkInfo="warning";
			}else{
				$("#formDescription").removeClass("has-warning");
				$("#formDescription").addClass("has-success");
				checkInfo="success";
			}
			
			//检查商品备注
			if($("#remark").val()==undefined||$("#remark").val()==""){
				$("#formRemark").removeClass("has-success");
				$("#formRemark").addClass("has-warning");
				checkInfo="warning";
			}else{
				$("#formRemark").removeClass("has-warning");
				$("#formRemark").addClass("has-success");
				if(checkInfo=="warning"){
					
				}else{
					checkInfo="success";
				}
			}
			return checkInfo;
		}
	</script>
	<script type="text/javascript">
		//保存按钮的监听事件
		$("#save").click(function() {
			//检查数据
			var info=checkData();
			if(info=="error"){
				return;
			}
			alert(info);
			
			var lSelectId = $("#ltype").find("option:checked").attr("id");
			var mSelectId = $("#mtype").find("option:checked").attr("id");
			var sSelectId = $("#stype").find("option:checked").attr("id");
			var lockChecked="0";
			var repairChecked="0";
			//判断复选框是否选中
			if($("#lock").is(':checked')==true){
				lockChecked="1"
			}
			if($("#repair").is(':checked')==true){
				repairChecked="1"
			}
			var dataForSave = {
				"largeType" : lSelectId,
				"mediumType" : mSelectId,
				"smallType" : sSelectId,
				"name" : $("#name").val(),
				"supplier" : $("#supplier").val(),
				"version" : $("#version").val(),
				"description" : $("#description").val(),
				"remark" : $("#remark").val(),
				"number" : $("#number").val(),
				"price":$("#price").val(),
				"level" : $("#level").val(),
				"holdFlag":lockChecked,
				"relFlag":repairChecked
			};
			//var productInJsonObj=$('#productInfo').serializeObject();
			//var productIn=JSON.stringify(productInJsonObj);
			//var jsonData='{"productIn":'+productIn+'}';
			
			var jsonData=JSON.stringify(dataForSave);
			alert(jsonData);
			$.ajax({
				type : 'post',
				url : '<%=path%>/addProduct',
				dataType : 'text',
				contentType : 'application/json',
				data : jsonData,
				async : false,
				success : function(data) {
					//json字符串转为Json对象
					var jsonObj = eval('(' + data + ')');
					if (jsonObj.success == "true") {
						$('#saveInfo').text("保存成功！")
						$("#showInfoModal").modal("toggle");
					} else {
						$('#saveInfo').text("保存失败！")
						$("#showInfoModal").modal("toggle");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);//
					alert(XMLHttpRequest.readyState);//
					alert(textStatus);//
				}
			});
		})
	</script>
</body>
</html>
