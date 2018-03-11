<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.kangjian.domain.SessionInfo" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	pageContext.setAttribute("basePath", basePath);
	SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute("loginInfo");
	if (sessionInfo == null) {//判断保存的信息是否为空，即判断用户是否登录  
		response.sendRedirect("/SSM/login");//如果用户登录后就跳转到某个页面  
	}else{
		pageContext.setAttribute("userName", sessionInfo.getUserName());
		pageContext.setAttribute("tempCode", sessionInfo.getID());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${basePath}layui/layui.js"></script>
<script type="text/javascript" src="${basePath}js/main.js"></script>
<script type="text/javascript" src="${basePath}js/LogOut.js"></script>

<link rel="stylesheet" href="layui/css/layui.css">
<title>首页</title>
<style type="text/css">
.layui-tab-title li:first-child>i {
	display: none;
}
</style>
</head>
<body class="layui-layout-body" >
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">layui 后台布局</div>
			<input type="hidden" id="tempcode" value="${tempCode}">
			<input type="hidden" id="basePath" value="${basePath}">
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left" lay-filter="top-menu">
				<li  id="999" url="bbb.jsp" class="layui-nav-item"  ><a href="javascript:;">关于系统</a></li>
				<li  id="888" url="bbb.jsp" class="layui-nav-item" ><a href="javascript:;">商品管理</a></li>
				<li  id="777" url="bbb.jsp" class="layui-nav-item"  ><a href="javascript:;">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd id="33" url="main/top.jsp">
							<a href="javascript:;">邮件管理</a>
						</dd>
						<dd id="44" url="bb.jsp">
							<a href="javascript:;">消息管理</a>
						</dd>
						<dd id="5" url="aaa.jsp">
							<a href="javascript:;">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> ${userName}
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="javascript:;" id="changepwd">修改密码</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="javascript:;" id="logOut">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="left-menu" id="left-menu">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd id="search" url="${basePath}/menu/toUserList">
								<a href="javascript:;">查询用户</a>
							</dd>
							<dd id="two" url="">
								<a href="javascript:;">新增用户</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">系统管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">日志管理</a>
							</dd>
							<dd>
								<a href="javascript:;">附件管理</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body" style="bottom: 0px;">
			<div style="padding-left: 15px">
				<!-- 内容主体区域 -->
				<div class="layui-tab" lay-allowClose="true" lay-filter="tab-switch">
					<ul class="layui-tab-title">
						<li class="layui-this">首页</li>
					</ul>
					<div class="layui-tab-content">
						<div class="layui-tab-item layui-show">首页内容</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>