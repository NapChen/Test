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
<title>仓库管理系统-注册</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<script src="js/jquery-1.12.4.min.js" type="text/javascript"></script>
<style type="text/css">
.consolas {
	font-family: Consolas;
}
</style>
</head>
<body>
	<div class="htmleaf-container">
		<div class="wrapper2">
			<div class="container" id="container">
				<h1>Register Your Information</h1>
				<h5>
					<br>
				</h5>
				<h5 id="notice">When you've done register, you may go to
					personal center to complete your detail information</h5>
				<h5>
					<br>
				</h5>
				<%
					String msg = (String) request.getAttribute("msg");
					if (msg != null) {
				%>
				<h5 id="errorMsg" style="color:red"><%=msg%></h5>
				<%
					}
				%>
				<h5 id="info" style="color:red"></h5>
				<form class="form" id="userInfo" method="post"
					action="<%=path%>/addUser">
					<input id="username" type="text" name="nickName"
						oninput="userCheck()" placeholder="Username"> 
					<input
						id="password" type="password" name="Password" oninput="confPsdCheck()"
						placeholder="Password"> 
					<input id="confPassword"
						type="password" name="ConfirmPassword" oninput="confPsdCheck()"
						placeholder="Confirm Password">
					<button type="button" id="login-button">Register</button>
					<div class="consolas">
						<h5>
							<br>
						</h5>
						<h5 id="loginLink">
							Already Have? Try <a href="<%=path%>/">Login</a>
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


	<script>
		var exist=false;
		
		$('#login-button').click(function(event) {
			event.preventDefault();
			var username = document.getElementById("username");
			var info = document.getElementById("info");
			var password = document.getElementById("password");
			var confPassword = document.getElementById("confPassword");
			
			
			if(exist){
				$("#info").text("Username Exist!");
				return;
			}
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
			if (password.value == confPassword.value) {
				info.innerText = "";
			} else {
				info.innerText = "Passwords Don't Match";
				return;
			}
			
			document.getElementById("notice").innerText = "";
			document.getElementById("loginLink").innerText = "";

			$('form').fadeOut(500);
			$('.wrapper2').addClass('form-success');
			$('form').submit();
		});
		
		function checkUserName() {
			var dataForCheck=$("#userInfo").serialize();
			$.ajax({
				type : 'post',
				url : '<%=path%>/addUserCheck',
				//dataType : 'json',
				//contentType : 'application/json',
				data : dataForCheck,
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
					alert(XMLHttpRequest.status);//415
					alert(XMLHttpRequest.readyState);//4
					alert(textStatus);//error
				}
			});
		}
		
	</script>
	<script>
		function userCheck() {
			var username = document.getElementById("username");
			var info = document.getElementById("info");
			if (username.value.length > 17 || username.value.length < 4) {
				info.innerText = "Username Limited 4-16 characters";
				return;
			} else {
				info.innerText = "";
			}
			checkUserName();
		}
		function confPsdCheck() {
			var password = document.getElementById("password");
			var confPassword = document.getElementById("confPassword");
			var info = document.getElementById("info");
			if (password.value.length > 17 || password.value.length < 6) {
				info.innerText = "Password Limited 6-16 characters";
				return;
			} else {
				info.innerText = "";
			}
			if (confPassword.value.length > 17 || confPassword.value.length < 6) {
				info.innerText = "Password Limited 6-16 characters";
				return;
			} else {
				info.innerText = "";
			}
			if (password.value == confPassword.value) {
				info.innerText = "";
			} else {
				info.innerText = "Passwords Don't Match";
			}
		}
	</script>

	<script>
		
	</script>

</body>
</html>