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
<title>Insert title here</title>
<script type="text/javascript" src="${basePath}layui/layui.js"></script>
<script type="text/javascript" src="${basePath}js/main.js"></script>
<link rel="stylesheet" href="${basePath}layui/css/layui.css">
<link rel="stylesheet" href="${basePath}/css/changepwd.css">
</head>
<body>
	<form class="layui-form" action="">
		<div class="changepwd">
		<div class="layui-form-item">
			<label class="layui-form-label">原密码</label>
			<div class="layui-input-inline">
				<input type="password" id="oldpwd" required
					lay-verify="required" placeholder="请输入原密码" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-inline">
				<input type="password" id="newpwd" required
					lay-verify="required" placeholder="请输入新密码" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-inline">
				<input type="password" id="confirpwd" required
					lay-verify="required" placeholder="请确认新密码" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="confirm">
			<a href="javascript:;" class="layui-btn layui-btn-normal" id="change_save"> 确定</a>&nbsp;
			<a href="javascript:;" class="layui-btn layui-btn-danger" id="change_cancel" > 取消</a>
		</div>
				</div>
	</form>
</body>
</html>