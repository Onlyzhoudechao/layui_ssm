<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册页面</title>
<script type="text/javascript" src="layui/layui.js"></script>
<link rel="shortcut icon" href="topjui/topjui/image/favicon.ico" />
<link rel="stylesheet"
	href="topjui/static/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="topjui/static/plugins/font-awesome/css/font-awesome.min.css">
<style type="text/css">
html, body {
	height: 100%;
}

.box {
	background: url("topjui/topjui/image/loginBg.jpg") no-repeat center
		center;
	background-size: cover;
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}

.login-box {
	width: 100%;
	max-width: 500px;
	height: 400px;
	position: absolute;
	top: 50%;
	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
}

@media screen and (min-width: 500px) {
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}

.form {
	width: 100%;
	max-width: 500px;
	height: 275px;
	margin: 2px auto 0px auto;
}

.login-content {
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
	height: 320px;
	width: 100%;
	max-width: 500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}

.input-group {
	margin: 30px 0px 0px 0px !important;
}

.form-control, .input-group {
	height: 40px;
}

.form-actions {
	margin-top: 30px;
}

.form-group {
	margin-bottom: 0px !important;
}

.login-title {
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}

.login-title h1 {
	margin-top: 10px !important;
}

.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}

.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}

.flag {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #fff;
	font-weight: bold;
	font: 14px/normal "microsoft yahei", "Times New Roman", "宋体", Times,
		serif;
}

a {
	top: 10px;
	right: 10px;
	color: #fff;
	font-weight: bold;
	font: 14px/normal "microsoft yahei", "Times New Roman", "宋体", Times,
		serif;
}
</style>
</head>
<body>
	<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<span class="flag"><i class="fa fa-user"></i> <a href="${basePath}/login">返回登录</a></span>
				<h1>
					<small>欢迎注册SSM管理系统</small>
				</h1>
			</div>
			<div class="login-content ">
				<div class="form">
					<form id="user_register_form" class="form-horizontal" action=""
						method="post">
						<input type="hidden" id="referer" name="referer"
							value="${param.referer}">
						<div class="form-group">
							<div class="col-xs-10 col-xs-offset-1">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input type="text"
										id="username" name="username" class="form-control"
										placeholder="用户名">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-10 col-xs-offset-1">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input
										type="password" id="password" name="password"
										class="form-control" placeholder="密码">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-10 col-xs-offset-1">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-envelope"></span></span> <input
										type="text" id="email" name="email"
										class="form-control" placeholder="邮箱">
								</div>
							</div>
						</div>
						<div class="form-group form-actions">
							<div class="col-xs-12 text-center">
								<button type="button" id="register" class="btn btn-sm btn-success">
									<span class="fa fa-check-circle"></span> 注册
								</button>
								<button type="button" id="reset" class="btn btn-sm btn-danger">
									<span class="fa fa-close"></span> 重置
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 引入jQuery -->
	<script src="topjui/static/plugins/jquery/jquery.min.js"></script>
	<script src="topjui/static/plugins/jquery/jquery.cookie.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#email').keyup(function(event) {
				if (event.keyCode == "13") {
					$("#register").trigger("click");
					return false;
				}
			});

			$("#register")
					.on(
							"click",
							function() {
								var userName = $('#username').val(), userPassword = $(
										'#password').val(), eMail = $('#email')
										.val();
								if (!(userName == null)
										&& !(userName == "undenfied")
										&& !(userPassword == null)
										&& !(userPassword == "undenfied")
										&& !(eMail == null)
										&& !(eMail == "undenfied")) {
									submitForm();
								} else {
									alert("用户名，密码和邮箱不能为空！");
								}
							});

			function submitForm() {
				$.ajax({
					type : "post",
					url : "${basePath}user_register",
					data : {
						"userName" : $('#username').val(),
						"userPassword" : $('#password').val(),
						"eMail" : $('#email').val()
					},
					success : function(cbm) {
						if (cbm.status == '1') {
							window.location.href = '${basePath}login';
						} else {
							alert(cbm.message);
						}
					},
					error : function() {
					}
				});
			}

			$("#reset").on("click", function() {
				$("#usercode").val("");
				$("#password").val("");
			});
		});
	</script>
</body>
</html>