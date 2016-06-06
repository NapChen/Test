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
<link href="css/bootstrap-table.min.css" rel="stylesheet">
<link href="css/offcanvas.css" rel="stylesheet">
<link href="css/bootstrap-editable.css" rel="stylesheet">
<link href="css/jquery-editable.css" rel="stylesheet">
<!-- JS -->
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/jquery-editable-poshytip.min.js"></script>
<script src="//rawgit.com/hhurz/tableExport.jquery.plugin/master/tableExport.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/offcanvas.js"></script>
<script src="js/bootstrap-table.min.js"></script>
<script src="js/bootstrap-table-toolbar.min.js"></script>
<script src="js/bootstrap-table-export.min.js"></script>
<script src="js/bootstrap-table-zh-CN.min.js"></script>
<script src="js/bootstrap-table-editable.min.js"></script>
<script src="js/bootstrap-table-filter-control.min.js"></script>
<script src="js/bootstrap-editable.min.js"></script>
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
					<li><a href="<%=path%>/managerProduct">商品管理</a></li>
					<li class="active"><a>商品分类</a></li>
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
		<div class="col-xs-12 col-sm-10">
			<div id="toolbar">
				<button id="add" class="btn btn-success">
					<i class="glyphicon glyphicon-plus"></i> 新增
				</button>
				<button id="edit" class="btn btn-warning" disabled>
					<i class="glyphicon glyphicon-edit"></i> 编辑
				</button>
				<button id="remove" class="btn btn-danger" disabled>
					<i class="glyphicon glyphicon-remove"></i> 删除
				</button>
				<button id="filter" class="btn btn-success">
					<i class="glyphicon glyphicon-filter"></i> 筛选
				</button>
			</div>
			<table id="table"></table>
			<!-- /.table -->
		</div>
		<!--/.col-xs-12.col-sm-9-->


		<!-- 放置一个模态框，用于新增 -->
		<!-- Modal1 -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title text-center" id="myModalLabel">新增商品分类</h4>
					</div>
					<!-- /.modal-hearder -->
					<div class="modal-body">
						<h4 class="text-center" style="color:green" id="saveInfo"></h4>
						<form class="form-horizontal" id="productInfo" role="form"
							method="post">
							<div class="form-group">
								<div class="text-center">
									<div class="checkbox" id="checkType">
										<label><input type="radio" id="addLType"
											name="addType" value="L">新增大类</label> <label><input
											type="radio" id="addMType" name="addType" value="M">新增中类</label>
										<label><input type="radio" id="addSType"
											name="addType" value="S">新增小类</label>
									</div>
								</div>
							</div>
							<div class="form-group hide" id="formLType">
								<label for="ltype" class="col-sm-2 control-label">物品大类</label>
								<div class="col-sm-10">
									<select class="form-control" id="ltype" name="largeType"
										onchange="lTypeChange()">
										<option id="lInfo">请选择商品大类</option>
										<!-- 采用JS动态创建Option -->
									</select>
								</div>
							</div>
							<div class="form-group hide" id="textLtype">
								<label for="price" class="col-sm-2 control-label">商品大类</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="textLtypeIn"
										name="textLtype" placeholder="请输商品大类">
								</div>
							</div>

							<div class="form-group hide" id="formMType">
								<label for="mtype" class="col-sm-2 control-label">物品中类</label>
								<div class="col-sm-10">
									<select class="form-control" id="mtype" name="mediumType"
										disabled onchange="mTypeOnChange()">
										<!-- 采用JS动态创建Option -->
									</select>
								</div>
							</div>
							<div class="form-group hide" id="textMtype">
								<label for="price" class="col-sm-2 control-label">商品中类</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="textMtypeIn"
										name="textMtype" placeholder="请输商品中类">
								</div>
							</div>

							<div class="form-group hide" id="formSType">
								<label for="stype" class="col-sm-2 control-label">物品小类</label>
								<div class="col-sm-10">
									<select class="form-control" id="stype" name="smallType"
										disabled>
										<!-- 采用JS动态创建Option -->
									</select>
								</div>
							</div>
							<div class="form-group hide" id="textStype">
								<label for="price" class="col-sm-2 control-label">商品小类</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="textStypeIn"
										name="textStype" placeholder="请输商品小类">
								</div>
							</div>
						</form>
						<!-- /.form -->
					</div>
					<!-- /.modal-boody -->
					<div class="modal-footer">
						<div class="button">
							<button type="button" class="btn btn-default" aria-hidden="true"
								data-dismiss="modal" data-toggle="tooltip">取消</button>
							<button type="button" class="btn btn-primary" id="save"
								data-toggle="tooltip" data-placement="top"
								title="保存录入，将物品信息保存下来">保存</button>
						</div>
					</div>
					<!-- /.footer -->
				</div>
				<!--/.modal-content  -->
			</div>
		</div>
		<!-- /.modal1 -->
		
		<!-- 放置一个模态框，用于修改-->
		<!-- Modal2 -->
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title text-center" id="myModalLabel">修改商品分类信息</h4>
					</div>
					<!-- /.modal-hearder -->
					<div class="modal-body">
						<h4 class="text-center" style="color:green" id="saveInfo"></h4>
						<form class="form-horizontal" id="editProductInfo" role="form"
							method="post">
							<h3 class="lead text-danger text-center">注意：对分类名的修改将应用到所包含的分类上</h3>
							<h4 class="text-center" style="color:green" id="editInfo"></h4>
							<div class="form-group" id="editTextLtype">
								<label for="editTextLtypeIn" class="col-sm-2 control-label">商品大类</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="editTextLtypeIn"
										name="largeName" placeholder="">
								</div>
							</div>
							<div class="form-group" id="editTextMtype">
								<label for="editTextMtypeIn" class="col-sm-2 control-label">商品中类</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="editTextMtypeIn"
										name="mediumName" placeholder="">
								</div>
							</div>
							<div class="form-group" id="editTextStype">
								<label for="editTextStypeIn" class="col-sm-2 control-label">商品小类</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="editTextStypeIn"
										name="smallName" placeholder="">
								</div>
							</div>
						</form>
						<!-- /.form -->
					</div>
					<!-- /.modal-boody -->
					<div class="modal-footer">
						<div class="button">
							<button type="button" class="btn btn-default" aria-hidden="true"
								data-dismiss="modal" data-toggle="tooltip">取消</button>
							<button type="button" class="btn btn-primary" id="editSave"
								data-toggle="tooltip" data-placement="top"
								title="保存录入，将物品信息保存下来">修改</button>
						</div>
					</div>
					<!-- /.footer -->
				</div>
				<!--/.modal-content  -->
			</div>
		</div>
		<!-- /.modal2 -->

		<!-- 放置一个模态框，用于提示 -->
		<!-- Modal3 -->
		<div class="modal fade" id="showInfoModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
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
		<!-- /.modal3 -->

		<div class="col-xs-6 col-sm-2 sidebar-offcanvas" id="sidebarSys">
			<div class="list-group">
				<a class="list-group-item disabled">快速导航</a> <a
					href="<%=path%>/main" class="list-group-item">系统主页</a> <a
					href="<%=path%>/managerProduct" class="list-group-item">商品管理</a> <a
					class="list-group-item active">商品分类</a> <a
					href="<%=path%>/managerReserve" class="list-group-item">库存管理</a> <a
					href="<%=path%>/managerCost" class="list-group-item">成本管理</a> <a
					href="<%=path%>/managerAuthority" class="list-group-item">授权管理</a>
				<a href="<%=path%>/personalCenter" class="list-group-item">个人中心</a>
				<a href="<%=path%>/aboutSystem" class="list-group-item">关于系统</a>
			</div>
		</div>
		<!--/.sidebar-offcanvas-->
		<!--/row-->
		<hr class="col-xs-8 col-sm-12">
		<footer class="col-xs-10 col-sm-12">
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
	<script>
		$("#addLType").click(function() {
			//show
			$("#textLtype").removeClass("hide");
			$("#textBtn").removeClass("hide");
			
			//hide
			$("#textMtype").addClass("hide");
			$("#textStype").addClass("hide");
			$("#formLType").addClass("hide");
			$("#formMType").addClass("hide");
			$("#formSType").addClass("hide");
		});		
		
		$("#addMType").click(function() {
			//show
			$("#formLType").removeClass("hide");
			$("#textMtype").removeClass("hide");
			$("#textBtn").removeClass("hide");
			//alert($("#addLType").is(':checked')==true);
			
			//hide
			$("#textLtype").addClass("hide");
			$("#textStype").addClass("hide");
			$("#formMType").addClass("hide");
			$("#formSType").addClass("hide");
		});	
		
		$("#addSType").click(function() {
			//show
			$("#formLType").removeClass("hide");
			$("#formMType").removeClass("hide");
			$("#textStype").removeClass("hide");
			$("#textBtn").removeClass("hide");
			
			//hide
			$("#textLtype").addClass("hide");
			$("#textMtype").addClass("hide");
			$("#formSType").addClass("hide");
		});	
		
		$("#clear").click(function() {
			//show
			$("#formLType").addClass("hide");
			$("#formMType").addClass("hide");
			$("#textStype").addClass("hide");
			$("#textBtn").addClass("hide");
			
			//hide
			$("#textLtype").addClass("hide");
			$("#textMtype").addClass("hide");
			$("#formSType").addClass("hide");
		});	
	</script>

	<script type="text/javascript">
		var $table = $('#table');
		var $remove = $('#remove');
		var $edit = $('#edit');
		var $add = $('#add');
		var $filter=$('#filter')
        var selections = [];
        var filterFlag=false;
        
        
        window.operateEvents = { 
			'click .like': function (e, value, row, index) { 
	            alert('You click like action, row: ' + JSON.stringify(row)); 
	         }, 
		
        	 'click .remove': function (e, value, row, index) { 
             	alert('You click remove action, row: ' + JSON.stringify(row)); 
         	} 
     	}
        
        var columns=[
                    { 
                        //field: 'check', 
                        checkbox: true, 
                        align: 'center', 
                        valign: 'middle' 
                    }, 
                    { 
                        title: '类型', 
                        field: 'type', 
                        align: 'center', 
                        valign: 'middle',
                        filterControl:'select',
                        sortable: true, 
                        //footerFormatter: TextFormatter 
                    }, 
                    { 
                        title: '大类', 
                        field:'largeName',
                        sortable: true, 
                        filterControl:'select',
                        //editable: true, 
                        align: 'center', 
                        valign: 'middle', 
                        align: 'center' ,
                        //footerFormatter: TextFormatter 
                    }, 
                    { 
                        field: 'largeType', 
                        title: '大类编号', 
                        filterControl:'select',
                        visible:false,
                        sortable: true, 
                        //editable: true, 
                        //footerFormatter: NameFormatter, 
                        align: 'center' 
                    }, 
                    { 
                        field: 'mediumName', 
                        title: '中类', 
                        filterControl:'select',
                        sortable: true, 
                        align: 'center', 
                        //editable: true, 
                        //editable: { 
                        //    type: 'text', 
                        //    title: '中类', 
                        //    validate: function (value) { 
                        //        value = $.trim(value); 
                        //        if (!value) { 
                        //            return 'This field is required'; 
                        //        } 
                        //        if (!/^\$/.test(value)) { 
                        //            return 'This field needs to start width $.' 
                        //        } 
                        //        var data = $table.bootstrapTable('getData'), 
                        //        index = $(this).parents('tr').data('index'); 
                        //        console.log(data[index]); 
                        //        return ''; 
                        //    } 
                        // }, 
                        //footerFormatter: PriceFormatter 
                    }, 
                    { 
                        field: 'mediumType', 
                        title: '中类编号', 
                        filterControl:'select',
                        sortable: true, 
                        visible:false,
                        align: 'center', 
                        //events: operateEvents, 
                        //formatter: operateFormatter 
                    },
                    { 
                     	field:'smallName',
                        title: '小类', 
                        filterControl:'select',
                        sortable: true, 
                        //editable: true, 
                        align: 'center', 
                        valign: 'middle', 
                        align: 'center' ,
                        //footerFormatter: TextFormatter 
                    }, 
                    { 
                        field: 'smallType', 
                        title: '小类编号',
                        filterControl:'select',
                        visible:false,
                        sortable: true, 
                        //editable: true, 
                        //footerFormatter: NameFormatter, 
                        align: 'center' 
                    }, 
                    { 
                        field: 'createTime', 
                        title: '创建时间', 
                        visible:false,
                        sortable: true, 
                        //editable: true, 
                        //footerFormatter: NameFormatter, 
                        align: 'center' 
                    },
                    { 
                        field: 'action', 
                        title: '操作', 
                        align: 'center',
                        formatter: operateFormatter, 
                        events: operateEvents 
                    }, 
             ];
		
		var jsonStr='<%=request.getAttribute("jsonOfType")%>';
		var data = eval('(' + jsonStr + ')');
		
		//初始化Table
		$table.bootstrapTable({
			height: getHeight()-56,
			//striped:    true,
			sortOrder:  'desc',
			method:     'get',
			//url:        '<%=path%>/getTypeAjxa',
			data:       data,
			cache:      false,
			contentType:'application/json',
			dataType:   'json',
			undefinedText:'-',
			queryParams:queryParams,
			queryParamsType:'limit',
			responseHandler:responseHandler,
			pagination:true,
			sidePagination:'client',
			pageNumber:1,
			pageSize:10,
			//pageList: '[10, 25, 50, 100, All]',
			//selectItemName:'btSelectItem',
			//smartDisplay:true,
			search:true,
			searchOnEnterKey:false,//The search method will be executed until the Enter key is pressed.
			strictSearch:false,//Enable the strict search.
			searchText:'',
			searchTimeOut:500,
			//showHeader:true,
			//showFooter:true,
			showExport:true,
			exportDataType: 'basic', //'basic', 'all', 'selected'.
			showColumns:true,
			showRefresh:false,//客户端分页的refresh无作用
			showToggle:true,
			//showFilter:false,
			filterControl:filterFlag,
			filterShowClear:false,
			showPaginationSwitch:true,
			minimumCountColumns:2,
			cardView:false,
			detailView:true,
			detailFormatter:detailFormatter,//function(index, row, element) {return '';}
			paginationPreText:'上一页',
			paginationNextText:'下一页',
			//clickToSelect:true,//True to select checkbox or radiobox when clicking rows.
			//singleSelect:true,
			toolbar:'#toolbar',
			columns: columns,
            onExpandRow: function (index, row, $detail) {
            	//展开的层数
            	var cells = 0;
            	if(row['type']=='大类'){
             		cells=2;
            	}
            	if(row['type']=='中类'){
             		cells=1;
            	}
            	//alert('onExpandRow-cells:'+cells);
             	//调用拓展函数
                expandTable($detail,cells,row);
            }
		});
		
		
		
		$table.on('check.bs.table uncheck.bs.table check-all.bs.table uncheck-all.bs.table', function () {
             selections = $table.bootstrapTable('getSelections');
             $remove.prop('disabled', !selections.length);
             $edit.prop('disabled', !(selections.length == 1));
         });
    	
    	//筛选
    	$filter.click(function () {
    		filterFlag=!filterFlag;
    		//alert(filterFlag);
    		$table.bootstrapTable('refreshOptions', {
                filterControl: filterFlag,
            });
        });
        
        //删除
    	$remove.click(function () {
            var rows = selections;
			var data=JSON.stringify(rows);
			alert(data);
			//var reg=/"0":true,"check":"-",/g;
			var reg=/"0":true,/g;
			var dataReplace=data.replace(reg, '');
			alert(dataReplace);
			reg=/,"createTime":"[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9].0"/g;
			var dataDone=dataReplace.replace(reg,'');
			alert(dataDone);
			//return;
			$.ajax({
				type : 'post',
				url : '<%=path%>/deleteType',
				dataType : 'json',
				contentType : 'application/json; charset=UTF-8',
				data : dataDone,
				async : false,
				success : function(data) {
					if (data.success == "true") {
						$("#info").text("");
						exist = false;
					} else {
						$("#info").text("Username Exist!");
						exist = true;
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert('status:'+XMLHttpRequest.status 
					+ '\nreadyState:'+XMLHttpRequest.readyState
					+'\ntextStatus:'+textStatus);//415
				}
			});
        });
        
        //编辑
        $edit.click(function () {
            var rows = selections;
            $('#editModal').modal("toggle");
            $('#editTextLtypeIn').val(rows[0]['largeName']);
            $('#editTextMtypeIn').val(rows[0]['mediumName']);
            $('#editTextStypeIn').val(rows[0]['smallName']);
            
            if($('#editTextMtypeIn').val()=='-'){
            	$('#editTextMtypeIn').attr('disabled',true);
            }else{
            	$('#editTextMtypeIn').attr('disabled',false);
            }
            if($('#editTextStypeIn').val()=='-'){
            	$('#editTextStypeIn').attr('disabled',true);
            }else{
            	$('#editTextStypeIn').attr('disabled',false);
            }
        });
        //新增
        $add.click(function () {
            $('#addModal').modal("toggle");
        });
         
        $table.on('expand-row.bs.table', function (e, index, row, $detail) { 
         	
        });
         
         /*****************************************************/
         //处理detail信息
    	 function expandTable($detail,cells,row) {
    	 	//alert('expandTable-cells:'+cells);
        	buildTable($detail.html('<table></table>').find('table'),cells,row);
    	 }
    	 
    	 function buildTable($el, cells, row) {
    	 	//alert('buildTable-cells:'+cells);
	        //var i, j;
	        var columnsTemp = [];
	        //拷贝一份
	        var dataTemp = [];
	        
	        if(row['type']=='大类'){
	        	columnsTemp=columns;
	        	//筛选出对应的中类
	        	for(var i=0;i<data.length;i++){
	        		if(data[i]['type']=='中类'&&data[i]['largeType']==row['largeType']){
	        			dataTemp.push(data[i]);
	        		}
	        	}
	        }
	        if(row['type']=='中类'){
	        	columnsTemp=columns;
	        	//筛选出对应的小类
	        	for(var i=0;i<data.length;i++){
	        		if(data[i]['type']=='小类'&&data[i]['mediumType']==row['mediumType']){
	        			dataTemp.push(data[i]);
	        		}
	        	}
	        }
	        if(row['type']=='小类'){
	        	dataTemp=null;
	        }
	       
	        //columns.push(columns);
	        
	        /*for (i = 0; i < rows; i++) {
	            row = {};
	            for (j = 0; j < cells; j++) {
	                row['field' + j] = 'Row-' + i + '-' + j;
	            }
	            data.push(row);
	        }*/
	        $el.bootstrapTable({
	            columns: columnsTemp,
	            data: dataTemp,
	            detailView: cells,
	            onExpandRow: function (index, row, $detail) {
	                expandTable($detail, cells-1,row);
	            }
	        });
	    }
    	 
         /*****************************************************/
         
         
		function operateFormatter(value, row, index) { 
         	return [  
	         	'<a class="like" href="javascript:void(0)" title="Like">', 
	            '<i class="glyphicon glyphicon-heart"></i>', 
	            '</a>', 
         	
             	'<a class="remove" href="javascript:void(0)" title="Remove">', 
             	'<i class="glyphicon glyphicon-remove"></i>', 
             	'</a>' 
         	].join(''); 
     	}
     	
     	function responseHandler(res) { 
     		
         	return res; 
     	}
     	
     	function queryParams(params) {
			return params;
		}
		
		function detailFormatter(index, row, element) {
			return '';
		}
		
		function getHeight() {
        	return $(window).height() - $('h1').outerHeight(true);
    	}
			
	</script>

	<script type="text/javascript">
		//初始化大类
		var jsonStr='<%=request.getAttribute("jsonOfType")%>';
		//将Jason字符串转换成Jason对象
		var data = eval('(' + jsonStr + ')');
		for (var i = 0; i < data.length; i++) {
			if (data[i]["type"] == "大类") {
				$("#ltype").append(
						"<option id="+data[i]["largeType"]+"> "
								+ data[i]["largeName"] + " </option>");
			}
		}
	</script>
	<script>
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
				if (jsonObj[i]["type"] == "中类"
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
				if (jsonObj[i]["type"] == "小类"
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
	   function checkData(){
			//检查数据完整性
			var checkInfo="";
			
			//选中新增大类
			if($("#addLType").is(':checked')){
				//检查物品大类
				if($("#textLtypeIn").val()==null||$("#textLtypeIn").val()==""){
					$("#textLtype").removeClass("has-success");
					$("#textLtype").addClass("has-error");
					checkInfo="error";
					return checkInfo;
				}else{
					$("#textLtype").removeClass("has-error");
					$("#textLtype").addClass("has-success");
					checkInfo="success";
				}
			}
			
			//选中新增大类
			if($("#addMType").is(':checked')){
				//检查物品大类选择框
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
				
				//检查物品中类输入框
				if($("#textMtypeIn").val()==null||$("#textMtypeIn").val()==""){
					$("#textMtype").removeClass("has-success");
					$("#textMtype").addClass("has-error");
					checkInfo="error";
					return checkInfo;
				}else{
					$("#textMtype").removeClass("has-error");
					$("#textMtype").addClass("has-success");
					checkInfo="success";
				}
			}
			
			//选中新增大类
			if($("#addSType").is(':checked')){
				//检查物品大类选择框
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
				
				//检查物品中类选择框
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
				
				//检查物品小类输入框
				if($("#textStypeIn").val()==null||$("#textStypeIn").val()==""){
					$("#textStype").removeClass("has-success");
					$("#textStype").addClass("has-error");
					checkInfo="error";
					return checkInfo;
				}else{
					$("#textStype").removeClass("has-error");
					$("#textStype").addClass("has-success");
					checkInfo="success";
				}
			}
			return checkInfo;
		}
	</script>
	<script type="text/javascript">
		//保存按钮的监听事件
		$("#save").click(function() {
		
			$('#addmodal').modal("toggle");
			
			//检查数据
			var info=checkData();
			var addType="";
			if(info=="error"){
				return;
			}
			
			//默认获取文本框的值
			var lTypeVal = $("#textLtypeIn").val();
			var mTypeVal = $("#textMtypeIn").val();
			var sTypeVal = $("#textStypeIn").val();
			
			if($("#addLType").is(':checked')){
				addType="L";
			}
			if($("#addMType").is(':checked')){
				addType="M";
				//改为获取选择框的值
				lTypeVal=$("#ltype").val();
			}
			if($("#addSType").is(':checked')){
				addType="S";
				//改为获取选择框的值
				lTypeVal=$("#ltype").val();
				mTypeVal=$("#mtype").val();
			}
			
			var lSelectId = $("#ltype").find("option:checked").attr("id");
			var mSelectId = $("#mtype").find("option:checked").attr("id");
			var sSelectId = $("#stype").find("option:checked").attr("id");
			
			var dataForSave = {
				"type":addType,
				"largeType" : lSelectId,
				"mediumType" : mSelectId,
				"smallType" : sSelectId,
				"largeName" : lTypeVal,
				"mediumName" : mTypeVal,
				"smallName" : sTypeVal
			};
			//var productInJsonObj=$('#productInfo').serializeObject();
			//var productIn=JSON.stringify(productInJsonObj);
			//var jsonData='{"productIn":'+productIn+'}';
			
			var jsonData=JSON.stringify(dataForSave);
			alert(jsonData);
			$.ajax({
				type : 'post',
				url : '<%=path%>/addType',
				dataType : 'text',
				contentType : 'application/json',
				data : jsonData,
				async : false,
				success : function(data) {
					//json字符串转为Json对象
					var jsonObj = eval('(' + data + ')');
					if (jsonObj.success == "true") {
						$('#saveInfo').text("保存成功！");
					} else {
						$('#saveInfo').text("保存失败！");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);//
					alert(XMLHttpRequest.readyState);//
					alert(XMLHttpRequest.textStatus);//
				}
			});
		})
	</script>
	
	<script type="text/javascript">
		//保存按钮的监听事件
		$("#editSave").click(function() {
		
			//$('#editModal').modal("toggle");
			
			//检查数据
			if($("#editTextLtypeIn").val()==""){
					$("#editTextLtype").removeClass("has-success");
					$("#editTextLtype").addClass("has-error");
					return ;
				}else{
					$("#editTextLtype").removeClass("has-error");
					$("#editTextLtype").addClass("has-success");
			}
			if($("#editTextMtypeIn").val()==""){
					$("#editTextMtype").removeClass("has-success");
					$("#editTextMtype").addClass("has-error");
					return ;
				}else{
					$("#editTextMtype").removeClass("has-error");
					$("#editTextMtype").addClass("has-success");
			}
			if($("#editTextStypeIn").val()==""){
					$("#editTextStype").removeClass("has-success");
					$("#editTextStype").addClass("has-error");
					return ;
				}else{
					$("#editTextStype").removeClass("has-error");
					$("#editTextStype").addClass("has-success");
			}
			
			//默认获取文本框的值
			var lTypeVal = $("#editTextLtypeIn").val();
			var mTypeVal = $("#editTextMtypeIn").val();
			var sTypeVal = $("#editTextStypeIn").val();
			
			var largeType=selections[0]['largeType'];
			var largeName=selections[0]['largeName'];
			var mediumType=selections[0]['mediumType'];
			var mediumName=selections[0]['mediumName'];
			var smallType=selections[0]['smallType'];
			var smallName=selections[0]['smallName'];
			//将新类名添加在原类名后面，用:分隔
			var dataForSave = {
				"largeType" : largeType,
				"mediumType" : mediumType,
				"smallType" : smallType,
				"largeName" : largeName+":"+lTypeVal,
				"mediumName" : mediumName+":"+mTypeVal,
				"smallName" : smallName+":"+sTypeVal,
			};
			
			var jsonData=JSON.stringify(dataForSave);
			alert(jsonData);
			$.ajax({
				type : 'post',
				url : '<%=path%>/editType',
				dataType : 'text',
				contentType : 'application/json',
				data : jsonData,
				async : false,
				success : function(data) {
					//json字符串转为Json对象
					var jsonObj = eval('(' + data + ')');
					if (jsonObj.success == "true") {
						$('#editInfo').text("保存成功！");
						$('#editInfo').css('color','green');
					} else {
						$('#editInfo').text("保存失败！");
						$('#editInfo').css('color','red');
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);//
					alert(XMLHttpRequest.readyState);//
					alert(XMLHttpRequest.textStatus);//
				}
			});
		})
	</script>