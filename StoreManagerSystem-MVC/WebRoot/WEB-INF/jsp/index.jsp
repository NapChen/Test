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
<title>仓库管理系统-登录</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">

<style type="text/css">
.consolas {
	font-family: Consolas;
}
</style>
</head>
<body>
	<div class="htmleaf-container">
		<div class="wrapper">
			<div class="container">
				<h1>Welcome To</h1>
				<h1>Store Manager System</h1>
				<h5>
					<br>
				</h5>
				<%
					String msg = (String) request.getAttribute("msg");
					Object state = request.getAttribute("state");
					if (msg != null) {
						if (Integer.parseInt(state.toString()) == -1) {
						%>
							<h5 id="errorMsg" style="color:red"><%=msg%></h5>
						<%
						}else{
						%>
							<h5 id="errorMsg" style="color:green"><%=msg%></h5>
						<%
						}
					}
				%>
				<h5 id="info" style="color:red"></h5>
				<form class="form" method="post" action="<%=path%>/login">
					<input id="username" type="text" name="username"
						oninput="userCheck()" placeholder="Username"> 
					<input
						id="password" oninput="psdCheck()" type="password"
						name="password" placeholder="Password">
					<button type="submit" id="login-button">Login</button>
					<div class="consolas">
						<h5>
							<br>
						</h5>
						<h5 id="registerLink">
							Don't Have? Try <a href="<%=path%>/register"> Register</a>
						</h5>
					</div>
				</form>
			</div>

			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>

	<script src="js/jquery-1.12.4.min.js" type="text/javascript"></script>
	<script>
		$('#login-button').click(function(event) {
			event.preventDefault();
			var username = document.getElementById("username");
			var password = document.getElementById("password");
			var info = document.getElementById("info");
			if (username.value.length > 17 || username.value.length < 4) {
				info.innerText = "Username Limited 4-16 characters";
				return;
			} else {
				info.innerText = "";
			}

			if (password.value.length > 17 || password.value.length < 6) {
				info.innerText = "Password Limited 6-16 characters";
				return;
			} else {
				info.innerText = "";
			}
			document.getElementById("registerLink").innerText = "";
			//document.getElementById("errorMsg").innerText = "";

			$('form').fadeOut(500);
			$('.wrapper').addClass('form-success');
			$('form').submit();
		});
	</script>

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
			if (password.value.length > 17 || password.value.length < 6) {
				info.innerText = "Password Limited 6-16 characters";
			} else {
				info.innerText = "";
			}
		}
	</script>

</body>
</html>
