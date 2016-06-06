<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>仓库管理系统-个人中心</title>

<style type="text/css">
.consolas {
	font-family: Consolas;
}
</style>
</head>
<body>
	
	
	<script src="js/jquery-1.12.4.min.js" type="text/javascript"></script>
	
	<script>
		function userCheck() {
			var username = document.getElementById("username");
			var info = document.getElementById("info");
			var loginButton = document.getElementById("login-button");
			var errorMsg = document.getElementById("errorMsg");
			if (errorMsg != null) {
				errorMsg.innerText = "";
			}
			if (username.value.length > 17 || username.value.length < 4) {
				info.innerText = "Username Limited 4-16 characters";
			} else {
				info.innerText = "";
			}
		}
		function psdCheck() {
			var password = document.getElementById("password");
			var info = document.getElementById("info");
			var loginButton = document.getElementById("login-button");
			if (password.value.length > 17 || password.value.length < 4) {
				info.innerText = "Password Limited 6-16 characters";
			} else {
				info.innerText = "";
			}
		}
	</script>

</body>
</html>
